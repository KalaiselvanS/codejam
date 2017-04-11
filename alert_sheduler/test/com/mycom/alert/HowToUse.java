package com.mycom.alert;

import com.mycom.alert.AlertListenerAdaptor;
import com.mycom.alert.AlertSheduler;
import com.mycom.alert.EventType;

/**
 *
 */
public class HowToUse {

	static public class MultiplyTask {
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
	}

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		AlertSheduler alertSheduler = new AlertSheduler(10);
		Runtime.getRuntime().addShutdownHook(new Thread(){
			@Override
			public void run() {
				alertSheduler.shutDown();
			}
		});
		alertSheduler.addAlertListener(new AlertObserver(new MultiplyTask(3)));
		alertSheduler.addAlertListener(new AlertObserver(new MultiplyTask(4)));
		alertSheduler.addAlertListener(new AlertObserver(new MultiplyTask(5)));
		alertSheduler.addAlertListener(new AlertObserver(new MultiplyTask(6)));
		alertSheduler.addAlertListener(new AlertListenerAdaptor(){@Override
		protected void doRun(EventType event) {
			System.out.println();
		}});
		alertSheduler.start();
		Thread.sleep(1000 * 4);
		alertSheduler.pause();
		Thread.sleep(1000 * 2);
		alertSheduler.resume();
		Thread.sleep(1000 * 4);
		System.exit(1);
	}

	static class AlertObserver extends AlertListenerAdaptor {
		MultiplyTask t = null;
		public AlertObserver(MultiplyTask t) {
			this.t = t;
		}
		protected void doResume(EventType event) {
			System.out.println("doResume has been called!!!");
		}
		protected void doPause(EventType event) {
			System.out.println("doPause has been called!!!");
		}
		protected void doShutdown(EventType event) {
			System.out.println("doShutdown has been called!!!");
			System.out.println("Climax => :) Sum of the day is " + t.getSum());
		}
		protected void doRun(EventType event) {
			t.doIt();
		}
		protected void doStrat(EventType event) {
			System.out.println("doStrat has been called!!!");
		}
	}
}
