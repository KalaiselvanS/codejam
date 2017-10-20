package com.mycom.sample.test;

public class DynamicShout {
	static {
		System.out.println("DynamicShout is loaded from external folder...");
	}
	public String shout() {
		return "wooo...  whooo.... !!!";
	}
}
