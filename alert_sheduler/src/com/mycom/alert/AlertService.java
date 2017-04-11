package com.mycom.alert;

/**
 * 
 */
public interface AlertService {
	public void addAlertListener(AlertListener listener);
	public void removeAlertListener(AlertListener listener);
	public void removeAllAlertListeners();
	public void setIntervalTiime(long intervalTiime);
}
