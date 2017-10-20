package com.mycom.sample.test;

public class DynamicShout {
	static {
		System.out.println("DynamicShout is loaded...");
	}
	public String shout() {
		return "wooo...";
	}
}
