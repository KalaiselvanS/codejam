package com.mycom.alert;

import java.util.List;
import java.util.Vector;

/**
 * 
 */
public class AlertSheduler implements Runnable, AlertService {	
	private static final int SLEEP_TIME = 100;
	
	private long age = 0; 
	private volatile boolean isPaused = false;
	private volatile boolean isStopped = false;
	private long alertInterval;
	private List<AlertListener> listeners = new Vector<AlertListener>();
	private ThreadGroup threadGroup = new ThreadGroup("Alert Sheduler Group");
	
	public AlertSheduler() {
		this(1);
	}

	public AlertSheduler(long alertInterval) {
		this.alertInterval = alertInterval;
	}

	public void setIntervalTiime(long alertInterval) {
		this.alertInterval = alertInterval;
	}

	public void addAlertListener(AlertListener listener) {
		if(listener == null) return;
		listeners.add(listener);
	}

	public void removeAlertListener(AlertListener listener) {
		listeners.remove(listener);
	}

	public void removeAllAlertListeners() {
		listeners.clear();
	}

	public void start(){
		isPaused = false;
		isStopped = false;
		AlertEvent event = new AlertEvent(EventType.START, System.currentTimeMillis());
		notifyListeners(event);
		new Thread(this).start();
	}
	
	public void pause(){
		isPaused = true;
		if (!isStopped) {
			AlertEvent event = new AlertEvent(EventType.PAUSE, System.currentTimeMillis());
			notifyListeners(event);
		}
	}
	
	public void resume(){
		isPaused = false;
		AlertEvent event = new AlertEvent(EventType.RESUME, System.currentTimeMillis());
		notifyListeners(event);
		synchronized (this) {
			notifyAll();
		}		
	}
	
	public void shutDown(){
		isStopped = true;
		if(isPaused){
			resume();
		}
		AlertEvent event = new AlertEvent(EventType.SHUTDOWN, System.currentTimeMillis());
		notifyListeners(event);
	}

	public void run() {
		while(true){
			if(isStopped) break;
			if(isPaused){
				synchronized (this) {
					try {
						wait();
					} catch (InterruptedException e) {}
				}
			}
			try{
				Thread.sleep(SLEEP_TIME);
				age += SLEEP_TIME;
			}catch(InterruptedException exp){}
			
			if(isStopped || isPaused)continue;
			
			if (age >= alertInterval * SLEEP_TIME) {
				AlertEvent event = new AlertEvent(EventType.RUNNING, System.currentTimeMillis());
				notifyListeners(event);
				age = 0;
			}
		}
	}
	
	private void notifyListeners(AlertEvent event) {
		for(AlertListener listener : listeners) {
			listener.alert(event);
		}
	}
}
