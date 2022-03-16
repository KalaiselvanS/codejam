package com.mycom.galmerguid.engine;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

import com.mycom.galmerguid.common.GalaxyCommanUtil;

public class ExpressionDefineStatement implements Statement {

	private Stack<String> stack = new Stack<String>();

	public void push(String operand) {
		stack.push(operand);
	}

	@Override
	public int execute() {
		try {
			System.out.println(" stack: " + stack);
			if (stack.size() < 3 || !GalaxyCommanUtil.stackSearchSymbal(stack, "is")) {
				throw new SyntaxError(String.format("Operand stack size mismatch error %d", stack.size()));
			}

			String rhsExchangeStr = stack.pop();
			Exchange rhsExchange = Session.getExchange(rhsExchangeStr);
			if (rhsExchange == null) {rhsExchange = new Exchange(rhsExchangeStr);}

			int rhsNumber = 1;
			List<String> numList = new ArrayList<String>();
			while(!"is".equalsIgnoreCase(stack.peek())) {
				numList.add(0, stack.pop());
			}
			if (numList.size() > 0) {
				rhsNumber = GalaxyCommanUtil.parseNumber(numList);
			}

			stack.pop();// removes the opperator

			String lhsExchangeStr = stack.pop();
			Exchange lhsExchange = Session.getExchange(lhsExchangeStr);
			if (lhsExchange == null) {lhsExchange = new Exchange(lhsExchangeStr);}

			int lhsNumber = 1;
			if (stack.size() > 0) {
				lhsNumber = GalaxyCommanUtil.parseNumber(stack);
			}

			lhsExchange.addComparableExchange(rhsExchange, lhsNumber, rhsNumber);
			rhsExchange.addComparableExchange(lhsExchange, rhsNumber, lhsNumber);

			Session.addExchange(lhsExchange);
			Session.addExchange(rhsExchange);

//			System.out.println(Session.context().allExchanges);
		}catch (java.lang.IllegalArgumentException e) {
			throw new IllegalArgumentException(String.format("[%s is not a valid value symbal]",""));
		}
		return 0;
	}
}
