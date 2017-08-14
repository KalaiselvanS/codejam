package com.mycom.spring.factorybean;

import org.springframework.beans.factory.FactoryBean;

public class ConnectionFactory implements FactoryBean {

	public ConnectionFactory() {
		System.out.println("Factory: "+hashCode());
	}

	private Connection connection;
	private boolean singleton;
	private int lifeInMillis;

	public void setLifeInMillis(int lifeInMillis) {
		this.lifeInMillis = lifeInMillis;
	}

	public synchronized Object getObject() throws Exception {
		if (connection == null || !"ESTABLISHED".equals(connection.getConnectionString())) {
			connection = new Connection(lifeInMillis);
		}
		return connection;
	}

	public Class getObjectType() {
		return Connection.class;
	}

	public boolean isSingleton() {
		return singleton;
	}

	public void setSingleton(boolean singleton) {
		this.singleton = singleton;
	}
}
