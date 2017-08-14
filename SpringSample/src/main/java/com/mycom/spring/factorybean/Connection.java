package com.mycom.spring.factorybean;

public class Connection {

	private String connectionString;
	private int lifeInMillis;

	public Connection(int lifeInMillis) {
		this.connectionString="ESTABLISHED";
		thread.start();
		this.lifeInMillis = lifeInMillis;
	}

	public String getConnectionString() {
		return connectionString;
	}

	@Override
	public String toString() {
		return this.hashCode()+": connection is [" + connectionString+ "]";
	}

	Thread thread = new Thread(){@Override public void run() {
		try {
			sleep(lifeInMillis);
		} catch (InterruptedException e) {}
		Connection.this.connectionString = "NOT ESTABLISHED";
	}};
}