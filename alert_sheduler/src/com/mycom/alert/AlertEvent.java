package com.mycom.alert;

/**
 * 
 */
public class AlertEvent {

	private final long triggeredWhen;
	private final EventType eventType;

	public AlertEvent(EventType eventType, long triggeredWhen) {
		this.triggeredWhen = triggeredWhen;
		this.eventType = eventType;
	}

	public long getTriggeredWhen() {
		return triggeredWhen;
	}
	
	public EventType getEventType() {
		return eventType;
	}
}
