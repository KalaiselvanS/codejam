package com.mycom.galmerguid.common;

import java.util.List;
import java.util.Stack;

import com.mycom.galmerguid.engine.GalaxyNumber;
import com.mycom.galmerguid.engine.SyntaxError;

public class GalaxyCommanUtil {

	public static String camelCase(String name) {
		return null;
	}

	public static boolean stackSearchSymbal(Stack<String> stack, String symbal) {
		if (stack != null && stack.size() > 0 && symbal != null) {
			for (String string : stack) {
				if (symbal.equalsIgnoreCase(string)) {
					return true;
				}
			}
		}
		return false;
	}
	
	/**
	 * @TODO write comments
	 * 
	 * @param rhsNumberStr
	 * @return int parsed integer
	 */
	public static int parseNumber(String rhsNumberStr) throws NumberFormatException{
		int rhsNumber = 0;
		if (rhsNumberStr.length() > 0) {
			try {
				//Try to parse as Arabian number
				rhsNumber = Integer.valueOf(rhsNumberStr);
			}catch (NumberFormatException numberFormatException) {
				// Try to parse as Roman number
				try {
					rhsNumber = RomanNumberSym.parse(rhsNumberStr);
				}catch (NumberFormatException formatException) {
					// Try to parse as Galaxy number
					try {
						rhsNumber = GalaxyNumber.parse(rhsNumberStr);
					}catch (NumberFormatException exception) {
						throw new SyntaxError(
								String.format("Number string [%s] should be in one of the [Arabian, Roman or Galaxy] formats",
												rhsNumberStr));
					}
				}
			}
		}
		return rhsNumber;
	}

	/**
	 * @TODO write comments
	 * @param numList
	 * @return int parsed integer
	 */
	public static int parseNumber(List<String> numList) {
		StringBuilder numberBuilder = new StringBuilder(); 
		for (String numStr : numList) {
			numberBuilder.append(" ").append(numStr);
		}
		return GalaxyCommanUtil.parseNumber(numberBuilder.toString().trim());
	}
}
