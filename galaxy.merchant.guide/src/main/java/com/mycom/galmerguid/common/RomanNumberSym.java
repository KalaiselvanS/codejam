package com.mycom.galmerguid.common;

public enum RomanNumberSym {

	M(1000, 3),
    CM(900, 1),
    D(500, 1),
    CD(400, 1),
    C(100, 3),
    XC(90, 1),
    L(50, 1),
    XL(40, 1),
    X(10, 3),
    IX(9, 1),
    V(5, 1),
    IV(4, 1),
    I(1, 3);

	private static final RomanNumberSym[] ROMAN_SYMBALS = RomanNumberSym.values();
	private static final int MAX = 3999;
	private static final int MIN = 1;
	private final int maximumAppearence;
	private final int value;

	private RomanNumberSym(int value, int maximumAppearence) {
		this.value = value;
		this.maximumAppearence = maximumAppearence;
	}

	public int getValue() {
		return value;
	}

	public String symbal() {
		return name();
	}
	public static String of(int number) {
		if (number < MIN || MAX < number) {
			throw new IllegalArgumentException(
				String.format("Sorry, not possible to convert %d to roman number. try in range of %d ... %d",
					number, MIN, MAX));
		}

		StringBuilder sb = new StringBuilder();
		for (RomanNumberSym sym : ROMAN_SYMBALS) {
			int value = sym.value;

			while (number >= value) {
				sb.append(sym.name());
				number -= value;
			}
		}
		return sb.toString();
	}

	public static int parse(String roman) {
		if (roman.isEmpty()) {
			throw new NumberFormatException("Not a valid Roman number");
		}

		int number = 0;
		int offset = 0;
		for (RomanNumberSym sym : ROMAN_SYMBALS) {
			for (int i = 0; i < sym.maximumAppearence && roman.startsWith(sym.name(), offset);
				i++) {
				number += sym.value;
				offset += sym.name().length();
			}
		}
		if (offset != roman.length()) {
			throw new NumberFormatException(String.format(
					"This '%s' is not a valid Roman number", roman));
		}
		return number;
	}
}