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

			String rhsEarningStr = stack.pop();
			Earning rhsEarning = Session.getEarning(rhsEarningStr);
			if (rhsEarning == null) {rhsEarning = new Earning(rhsEarningStr);}

			int rhsNumber = 1;
			List<String> numList = new ArrayList<String>();
			while(!"is".equalsIgnoreCase(stack.peek())) {
				numList.add(0, stack.pop());
			}
			if (numList.size() > 0) {
				rhsNumber = GalaxyCommanUtil.parseNumber(numList);
			}

			stack.pop();// removes the opperator

			String lhsEarningStr = stack.pop();
			Earning lhsEarning = Session.getEarning(lhsEarningStr);
			if (lhsEarning == null) {lhsEarning = new Earning(lhsEarningStr);}

			int lhsNumber = 1;
			if (stack.size() > 0) {
				lhsNumber = GalaxyCommanUtil.parseNumber(stack);
			}

			lhsEarning.addComparableEarning(rhsEarning, lhsNumber, rhsNumber);
			rhsEarning.addComparableEarning(lhsEarning, rhsNumber, lhsNumber);

			Session.addEarning(lhsEarning);
			Session.addEarning(rhsEarning);

//			System.out.println(Session.context().allEarnings);
		}catch (java.lang.IllegalArgumentException e) {
			throw new IllegalArgumentException(String.format("[%s is not a valid value symbal]",""));
		}
		return 0;
	}
}
