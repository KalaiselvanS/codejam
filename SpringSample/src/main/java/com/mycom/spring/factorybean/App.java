package com.mycom.spring.factorybean;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
	public static void main(String[] args) throws InterruptedException {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/mycom/spring/factorybean/spring-config.xml");

		Connection cust = (Connection) context.getBean("ConnectionBean");
		System.out.println(cust);
		for (int i = 0; i < 15; i++) {
			Thread.sleep(300);
			System.out.println(context.getBean("ConnectionBean"));
		}
		
		System.out.println("If you get the output like \"connection is [NOT ESTABLISHED]\" then make the below change in ./com/mycom/spring/factorybean/spring-config.xml\n"
				+ "<property name=\"singleton\" value=\"false\" />");
	}
}