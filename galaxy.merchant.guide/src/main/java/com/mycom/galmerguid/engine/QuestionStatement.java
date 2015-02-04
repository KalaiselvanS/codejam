package com.mycom.galmerguid.engine;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

import com.mycom.galmerguid.common.GalaxyCommanUtil;

public class QuestionStatement implements Statement {

	private Stack<String> stack = new Stack<String>();
	private int resultCode;
	private List<String> resultBuilder = new ArrayList<String>();

	public void push(String operand) {
		stack.push(operand);
	}

	@Override
	public int execute() {
		try {
//			System.out.println(stack);
			resultBuilder.addAll(stack);
			resultBuilder.add("?\n\t");
			Session.addQuestion(this);
			if (stack.size() < 3 || !GalaxyCommanUtil.stackSearchSymbal(stack, "is")) {
				return resultCode = -1;
			}
			String rhsEarningStr = null;
			if (Session.hasEarning(stack.peek())) {
				rhsEarningStr = stack.pop();
			}

			int rhsNumber = 1;
			List<String> numList = new ArrayList<String>();
			while(!"is".equalsIgnoreCase(stack.peek())) {
				numList.add(0, stack.pop());
			}
			if (numList.size() > 0) {
				rhsNumber = GalaxyCommanUtil.parseNumber(numList);
			}

			stack.pop();// removes the opperator

			String lhsEarningStr = null;
			if (Session.hasEarning(stack.peek())) {
				lhsEarningStr = stack.pop();
			}

			double result;
			Earning rhsEarning = Session.getEarning(rhsEarningStr);
			Earning lhsEarning = Session.getEarning(lhsEarningStr);
			if (rhsEarning != null) {
//				result = (int)Math.round(rhsNumber * rhsEarning.getOtherEarningValue(lhsEarning));
				result = rhsNumber * rhsEarning.getOtherEarningValue(lhsEarning);
			} else {
				result = rhsNumber;
			}

			resultBuilder.addAll(numList);
			if (rhsEarning != null) {
				resultBuilder.add(rhsEarning.getName());
			}
			resultBuilder.add("is");
			resultBuilder.add(String.valueOf(result));
			if (lhsEarning != null) {
				resultBuilder.add(lhsEarning.getName());
			} else if (rhsEarning != null) {
				resultBuilder.add(rhsEarning.getName());
			}
			resultCode = 1;

//			System.out.println("\t==>>> Result code is "+ resultCode + " : " + resultBuilder);
		}catch (Throwable e) {
			resultCode = -1;
			e.printStackTrace();
		}
		return resultCode;
	}

	public int getResponseCode() {
		return resultCode;
	}

	public String getResponse() {
		StringBuilder response = new StringBuilder();
		if (resultCode != 1) {
			response.append("I have no idea what you are talking about");
		}
		for (String string : resultBuilder) {
			response.append(" ").append(string);
		}
		return response.toString();
	}


}
