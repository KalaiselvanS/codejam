package com.mycom.alert;

/**
 * 
 */
public class AlertListenerAdaptor implements AlertListener {

	@Override
	public void alert(AlertEvent alertEvent) {
		EventType event = alertEvent.getEventType();
		switch (event) {
		case START:
			doStrat(event);
			break;
		case RUNNING:
			doRun(event);
			break;
		case SHUTDOWN:
			doShutdown(event);
			break;
		case PAUSE:
			doPause(event);
			break;
		case RESUME:
			doResume(event);
			break;
		default:
			doNothing(event);
			break;
		}
	}

	private void doNothing(EventType event) {
	}

	protected void doResume(EventType event) {
	}

	protected void doPause(EventType event) {
	}

	protected void doShutdown(EventType event) {
	}

	protected void doRun(EventType event) {
	}

	protected void doStrat(EventType event) {
	}
	
}
