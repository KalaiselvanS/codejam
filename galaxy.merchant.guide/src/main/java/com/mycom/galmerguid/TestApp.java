package com.mycom.galmerguid;

import com.mycom.galmerguid.engine.Executer;

public class TestApp {
	public static void main(String argv[]) throws Exception {
		if (argv.length == 0) {
			System.out.format("Usage : %s <inputfile>\n", TestApp.class.getName());
			new Executer("test1.inp").start();
		} else {
			for (int i = 0; i < argv.length; i++) {
				new Executer(argv[i]).start();
			}
		}
	}
}