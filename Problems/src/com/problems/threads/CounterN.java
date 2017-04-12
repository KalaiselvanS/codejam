package com.problems.threads;

import java.util.concurrent.atomic.AtomicInteger;

public class CounterN extends Thread {

	private AtomicInteger integer;

	CounterN(AtomicInteger integer) {
		this.integer = integer;
		start();
	}
	CounterN(String threadname, AtomicInteger integer) {
		super(threadname);
		this.integer = integer;
		start();
	}

	public void run() {
		try {
			int i = 0;
			for (; integer.get() < 100;) {
				synchronized (integer) {
					i = integer.incrementAndGet();
					integer.notify();
				}
				System.out.println(getName() + ": " + i);
				Thread.sleep(1000);
				synchronized (integer) {
					integer.wait(1);
				}
			}
		} catch (Exception e) {
			System.out.println("Exception in " + getName() + " " + e);
		}
//		System.err.println(getName() + " exiting.");
		synchronized ("") {
			"".notify();
		}
	}

	public static void main(String args[]) throws Exception {
		AtomicInteger integer = new AtomicInteger();
		long time = System.currentTimeMillis();
		int noOfActors = 10;

		for (int i = 0; i < noOfActors; i++) {
			new CounterN(integer);
		}

		synchronized ("") {
			"".wait();// Wait for the Job to be completed
		}
		time = System.currentTimeMillis() - time;
		System.out.format("Time taken for counting: %s Seconds and %s Millis\n", time/1000, time%1000);
		System.out.println("Main thread exiting.");
	}
}