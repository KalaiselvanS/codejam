package com.mycom.galmerguid.engine;

import java.util.Collection;

import com.mycom.galmerguid.common.RomanNumberSym;

public class GalaxyNumber {

	private RomanNumberSym romanSym;
	private String galaxySymbal;

	public GalaxyNumber(String romanSymbal, String galaxySymbal) {
		this(RomanNumberSym.valueOf(romanSymbal), galaxySymbal);
	}
	public GalaxyNumber(RomanNumberSym romanSym, String galaxySymbal) {
		this.romanSym = romanSym;
		this.galaxySymbal = galaxySymbal;
		System.out.println(" "+this);
	}

	public RomanNumberSym getRomanSym() {
		return romanSym;
	}

	public String getGalaxySymbal() {
		return galaxySymbal;
	}

	public static String of(int number) {
		String romanNum = RomanNumberSym.of(number);
		Collection<GalaxyNumber> allGalaxyNums = Session.getAllGalaxyNumbers();

		StringBuilder sb = new StringBuilder();
		for (int i = 0, offset=0; i < romanNum.length(); i++) {
			String sym = String.valueOf(romanNum.charAt(i));
			offset = sb.length();
			for (GalaxyNumber galaxyNumber : allGalaxyNums) {
				if (galaxyNumber.romanSym.symbal().equals(sym)) {
					sb.append(" ").append(galaxyNumber.galaxySymbal);
				}
			}
			if (offset == sb.length()) {
				throw new IllegalArgumentException(
						String.format("Sorry, not possible to convert %d to galaxy number. Please specify galaxy number symbal for %s",
								number, sym));
			}
		}
		return sb.toString();
	}

	public static int parse(String galaxyNumberSymbals) {
		String[] galSyms = galaxyNumberSymbals.split(" ");
		StringBuilder romanNumSyms = new StringBuilder();
		for (String galaxySymbal : galSyms) {
			if ((galaxySymbal=galaxySymbal.trim()).length() == 0 )
				continue;
			GalaxyNumber galaxyNumber = Session.getGalaxyNumber(galaxySymbal);
			if (galaxyNumber == null) {
				throw new NumberFormatException(String.format(
					"This '%s' is not a valid galaxy number symbal", galaxySymbal));
			}
			romanNumSyms.append(galaxyNumber.getRomanSym().symbal());
		}
		return RomanNumberSym.parse(romanNumSyms.toString());
	}
	@Override
	public String toString() {
		return String.format("GalaxyNumber[ %s = %s = %d ]", galaxySymbal, romanSym, romanSym.getValue() );
	}
	
}
