package com.mycom.galmerguid.engine;

import static org.junit.Assert.*;

import org.junit.Test;

public class ExchangeTest {
	
	Exchange silver = new Exchange("silver");
	Exchange gold = new Exchange("gold");
	Exchange rupees = new Exchange("rupees");

	@Test
	public void testAddComparableExchangeExchangeDouble() {
		// TODO
	}

	@Test
	public void testAddComparableExchangeExchangeIntInt() {
		// TODO
	}

	@Test
	public void testGetOtherExchangeValue() {
		silver.addComparableExchange(rupees, 1, 50);
		rupees.addComparableExchange(silver, 50, 1);
		
		gold.addComparableExchange(silver, 1, 55);
		silver.addComparableExchange(gold, 55, 1);
		
		double goldRateInRupees = gold.getOtherExchangeValue(rupees);
		assertEquals(50*55, (int)goldRateInRupees);
	}

	@Test(expected=RuntimeException.class)
	public void testGetOtherExchangeValueFailure1() {
		gold.addComparableExchange(silver, 1, 55);
		silver.addComparableExchange(gold, 55, 1);
		
		gold.getOtherExchangeValue(rupees);
	}
	
	@Test(expected=RuntimeException.class)
	public void testGetOtherExchangeValueFailure2() {
		gold.addComparableExchange(gold, 1, 1);
		
		gold.getOtherExchangeValue(rupees);
	}
}
