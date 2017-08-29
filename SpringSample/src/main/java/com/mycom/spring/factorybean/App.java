package com.mycom.spring.factorybean;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
	public static void main(String[] args) throws InterruptedException {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/mycom/spring/factorybean/spring-config.xml");
		ConnectionUtil conn = (ConnectionUtil) context.getBean("connectionUtil");
		System.out.println(conn.getConnection());
		for (int i = 0; i < 15; i++) {
			Thread.sleep(300);
			System.out.println(conn.getConnection());
		}
	}
}