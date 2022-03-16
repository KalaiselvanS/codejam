package com.mycom.galmerguid.engine;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

public class Exchange {

	private String name;
	private Map<Exchange, Double> comparableExchanges = new HashMap<Exchange, Double>();

	public Exchange(String name) {
		setName(name);
	}

	private void setName(String name) {
		this.name = name;
		Session.addExchange(this);
	}

	public String getName() {
		return name;
	}

	public void addComparableExchange(Exchange otherExchange, Double othersValue){
		comparableExchanges.put(otherExchange, othersValue);
		otherExchange.comparableExchanges.put(this, 1.0D/othersValue);
	}

	public void addComparableExchange(Exchange otherExchange, int noOfThis, int equvalentNoOfOthers){
		System.out.format("%d %s is equal to %d %s\n", noOfThis, name, equvalentNoOfOthers, otherExchange.getName());
		Double othersCalculatedValue = ((double)equvalentNoOfOthers) / noOfThis;
		addComparableExchange(otherExchange, othersCalculatedValue);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Exchange other = (Exchange) obj;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append("Exchange{").append(name).append(" is ");
		for (Entry<Exchange, Double> entry : comparableExchanges.entrySet()) {
			sb.append("[").append(entry.getValue()).append(" X ").append(
					entry.getKey().getName()).append("]");
		}
		sb.append("}");
		return sb.toString();
	}
	
	public double getOtherExchangeValue(Exchange otherExchange) {
		return getOtherExchangeValue(otherExchange, this);
	}

	private double getOtherExchangeValue(Exchange otherExchange, Exchange root) {
		if (otherExchange.equals(root)) {
			return 1;
		}
		Double otherVal = comparableExchanges.get(otherExchange);
		if (otherVal == null) {
			for (Exchange other : comparableExchanges.keySet()) {
				if (other.equals(root)) {
					continue;
				}
				otherVal = other.getOtherExchangeValue(otherExchange, this);
				if (otherVal != null) {
					return otherVal * comparableExchanges.get(other);
				}
			}
		} else {
			return otherVal;
		}
		
		throw new RuntimeException(String.format(
				"%s does not meet the relation with %s", root.name, otherExchange.name));
	}
}
