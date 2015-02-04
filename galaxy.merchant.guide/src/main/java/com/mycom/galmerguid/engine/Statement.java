package com.mycom.galmerguid.engine;

public interface Statement {

	int execute();
	
	void push(String operand);

}
