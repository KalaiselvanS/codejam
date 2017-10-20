package com.mycom.sample.agent;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.instrument.ClassFileTransformer;
import java.lang.instrument.IllegalClassFormatException;
import java.lang.instrument.Instrumentation;
import java.net.URL;
import java.net.URLClassLoader;
import java.security.ProtectionDomain;

import javax.management.loading.MLet;

final public class PatchingAgent implements ClassFileTransformer {

	private File patchClasspath;
	private URLClassLoader patchingLoader;
	private URL url;

	public PatchingAgent() throws FileNotFoundException, IOException {
		String path = System.getProperty("patch.classpath");
		if (path == null) {
			path = ".";
		}
		url = new URL(path);
		patchClasspath = new File(url.getFile());
		patchingLoader = new MLet(new URL[] { url }, this.getClass().getClassLoader());
	}

	public static void premain(String agentArgument, final Instrumentation instrumentation) {
		System.out.println("Initializing hot patcher...");
		PatchingAgent agent = null;

		try {
			agent = new PatchingAgent();
		} catch (Exception e) {
			System.out.println("terrible things happened...." + e.getMessage());
		}

		instrumentation.addTransformer(agent);
	}

	@Override
	public byte[] transform(final ClassLoader loader, String className, final Class classBeingRedefined,
			final ProtectionDomain protectionDomain, final byte[] classfileBuffer) throws IllegalClassFormatException {
		byte[] result = null;
//		result = readPatchedCode(className);
//		System.out.println(new String(result));
		if (patchClasspath != null && patchClasspath.exists() && patchClasspath.isDirectory()) {
			File classFile = new File(patchClasspath.getAbsolutePath(), className + ".class");
			if (classFile.exists()) {
				System.out.println("Patching... " + className);
				result = readPatchedCode(classFile);
			} else {
				System.out.format("Class %s is defined ...\n", className);
			}
		} else {
			System.err.println("patchClasspath not found " + patchClasspath);
		}
		return result;
	}

	private byte[] readPatchedCode(final File classFile) {
		byte[] bs = null;
		try {
			FileInputStream is = new FileInputStream(classFile);
			bs = new byte[is.available()];
			is.read(bs);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return bs;
	}

	private byte[] readPatchedCode(final String className) {
		try {
			InputStream is = patchingLoader.findResource(className + ".class").openStream();
			byte[] bs = new byte[is.available()];
			bs = new byte[is.available()];
			is.read(bs);
			return bs;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
}