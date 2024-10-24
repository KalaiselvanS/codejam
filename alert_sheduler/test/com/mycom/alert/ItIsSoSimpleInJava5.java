package com.mycom.alert;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * It is so simple in Java 5
 */
public class ItIsSoSimpleInJava5 {

	static public class MultiplyTask implements Runnable{
		int counter;
		long sum;
		int table;
		public MultiplyTask(int table) {
			System.out.println("My task is created");
			this.table = table;
			for (int i = 3; i < table; i++) {
			}
		}
		public void doIt(){
			++counter;
//			System.out.println("My task is executed ["+ counter + "] times");
			sum += table;
			System.out.print(String.format("\t%d X %d = %d", counter, table, sum));
		}
		public int getCounter() {
			return counter;
		}
		public long getSum() {
			return sum;
		}
		@Override
		public void run() {
			doIt();			
		}
	}

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
//		ScheduledExecutorService executor = Executors.newSingleThreadScheduledExecutor();
		ScheduledExecutorService executor = Executors.newScheduledThreadPool(1);
		int initialDelay = 0;
		int period = 1;
		executor.scheduleAtFixedRate(new MultiplyTask(1), initialDelay, period, TimeUnit.SECONDS);
		executor.scheduleAtFixedRate(new MultiplyTask(2), initialDelay, period, TimeUnit.SECONDS);
		executor.scheduleAtFixedRate(new MultiplyTask(3), initialDelay, period, TimeUnit.SECONDS);
		executor.scheduleAtFixedRate(new MultiplyTask(4), initialDelay, period, TimeUnit.SECONDS);
		executor.scheduleAtFixedRate(new MultiplyTask(5), initialDelay, period, TimeUnit.SECONDS);
		executor.scheduleAtFixedRate(new Runnable() {
			@Override
			public void run() {
				System.out.println();
			}
		}, initialDelay, period, TimeUnit.SECONDS);
		shut(executor, 10);

		// 
//		alertSheduler.start();
//		Thread.sleep(1000 * 4);
//		alertSheduler.pause();
//		Thread.sleep(1000 * 2);
//		alertSheduler.resume();
//		Thread.sleep(1000 * 4);
//		System.exit(1);
	}

	private static void shut(ScheduledExecutorService executor, int t) {
		try {
			TimeUnit.SECONDS.sleep(t);
		} catch (InterruptedException e) {
			throw new IllegalStateException("task interrupted", e);
		}
		executor.shutdown();
	}
}
