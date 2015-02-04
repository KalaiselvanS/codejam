package com.mycom.galmerguid.engine;

import java.util.Stack;

import com.mycom.galmerguid.common.GalaxyCommanUtil;

public class DefineStatement implements Statement {

	private Stack<String> stack = new Stack<String>();

	public void push(String operand) {
		stack.push(operand);
	}

	@Override
	public int execute() {
		System.out.println(" stack: " + stack);
		if (stack.size() != 3 || !GalaxyCommanUtil.stackSearchSymbal(stack, "is")) {
			throw new SyntaxError(String.format("Operand stack size mismatch error %d", stack.size()));
		}
		String operand1 = stack.pop();
		stack.pop();// removes the opperator
		String operand2 = stack.pop();
		try {
			GalaxyNumber galaxyNumber = new GalaxyNumber(operand1, operand2);
			Session.addGalaxyNumber(galaxyNumber);
//			System.out.println("galaxyNumbers : "+Session.context().galaxyNumbers);
		}catch (java.lang.IllegalArgumentException e) {
			throw new IllegalArgumentException(String.format("[%s is not a valid value symbal]",operand1));
		}
		return 0;
	}
}
