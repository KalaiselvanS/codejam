package com.mycom.sample.agent;

import com.mycom.sample.test.DynamicShout;

public class Server {

	public static void main(String[] args) throws InterruptedException, ClassNotFoundException {
		DynamicShout dynamicShout = new DynamicShout();
		System.out.println(System.getProperty("patch.classpath"));
		for (int i=5;i-->0;) {
			Thread.sleep(3000);
			System.out.println(dynamicShout.shout());
		}
	}
}
