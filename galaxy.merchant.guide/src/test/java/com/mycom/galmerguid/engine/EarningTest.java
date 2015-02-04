package com.mycom.galmerguid.engine;

import static org.junit.Assert.*;

import org.junit.Test;

public class EarningTest {
	
	Earning silver = new Earning("silver");
	Earning gold = new Earning("gold");
	Earning rupees = new Earning("rupees");

	@Test
	public void testAddComparableEarningEarningDouble() {
		// TODO
	}

	@Test
	public void testAddComparableEarningEarningIntInt() {
		// TODO
	}

	@Test
	public void testGetOtherEarningValue() {
		silver.addComparableEarning(rupees, 1, 50);
		rupees.addComparableEarning(silver, 50, 1);
		
		gold.addComparableEarning(silver, 1, 55);
		silver.addComparableEarning(gold, 55, 1);
		
		double goldRateInRupees = gold.getOtherEarningValue(rupees);
		assertEquals(50*55, (int)goldRateInRupees);
	}

	@Test(expected=RuntimeException.class)
	public void testGetOtherEarningValueFailure1() {
		gold.addComparableEarning(silver, 1, 55);
		silver.addComparableEarning(gold, 55, 1);
		
		gold.getOtherEarningValue(rupees);
	}
	
	@Test(expected=RuntimeException.class)
	public void testGetOtherEarningValueFailure2() {
		gold.addComparableEarning(gold, 1, 1);
		
		gold.getOtherEarningValue(rupees);
	}
}
