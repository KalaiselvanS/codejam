package com.mycom.spring.factorybean;

import org.springframework.aop.TargetSource;
import org.springframework.aop.framework.ProxyFactory;
import org.springframework.beans.factory.FactoryBean;

public class ConnectionFactory implements FactoryBean {

	public ConnectionFactory() {
		System.out.println("Factory: " + hashCode());
	}

	private Connection connection;
	private boolean singleton;
	private int lifeInMillis;

	public void setLifeInMillis(int lifeInMillis) {
		this.lifeInMillis = lifeInMillis;
	}

	public synchronized Object getObject() throws Exception {
		TargetSource targetSource = new TargetSource() {
			public void releaseTarget(Object arg0) throws Exception {
//				System.out.println("releasing "+ arg0);
			}
			public boolean isStatic() {
				return false;
			}
			public Class<Connection> getTargetClass() {
				return Connection.class;
			}
			public Object getTarget() throws Exception {
//				System.out.println("getTarget()");
				if (connection == null || !"ESTABLISHED".equals(connection.getConnectionString())) {
					connection = new Connection(lifeInMillis);			
				}
				return connection;
			}
		};
		return ProxyFactory.getProxy(targetSource);
	}
	/*
	public synchronized Object getObject() throws Exception {
		if (connection == null || !"ESTABLISHED".equals(connection.getConnectionString())) {
			connection = new Connection(lifeInMillis);			
		}
		return connection;
	}*/
	public Class<Connection> getObjectType() {
		return Connection.class;
	}

	public boolean isSingleton() {
		return singleton;
	}

	public void setSingleton(boolean singleton) {
		this.singleton = singleton;
	}
}
