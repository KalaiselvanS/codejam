package com.mycom.galmerguid.engine;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

public class Earning {

	private String name;
	private Map<Earning, Double> comparableEarnings = new HashMap<Earning, Double>();

	public Earning(String name) {
		setName(name);
	}

	private void setName(String name) {
		this.name = name;
		Session.addEarning(this);
	}

	public String getName() {
		return name;
	}

	public void addComparableEarning(Earning otherEarning, Double othersValue){
		comparableEarnings.put(otherEarning, othersValue);
		otherEarning.comparableEarnings.put(this, 1.0D/othersValue);
	}

	public void addComparableEarning(Earning otherEarning, int noOfThis, int equvalentNoOfOthers){
		System.out.format("%d %s is equal to %d %s\n", noOfThis, name, equvalentNoOfOthers, otherEarning.getName());
		Double othersCalculatedValue = ((double)equvalentNoOfOthers) / noOfThis;
		addComparableEarning(otherEarning, othersCalculatedValue);
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
		Earning other = (Earning) obj;
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
		sb.append("Earning{").append(name).append(" is ");
		for (Entry<Earning, Double> entry : comparableEarnings.entrySet()) {
			sb.append("[").append(entry.getValue()).append(" X ").append(
					entry.getKey().getName()).append("]");
		}
		sb.append("}");
		return sb.toString();
	}
	
	public double getOtherEarningValue(Earning otherEarning) {
		return getOtherEarningValue(otherEarning, this);
	}

	private double getOtherEarningValue(Earning otherEarning, Earning root) {
		if (otherEarning.equals(root)) {
			return 1;
		}
		Double otherVal = comparableEarnings.get(otherEarning);
		if (otherVal == null) {
			for (Earning other : comparableEarnings.keySet()) {
				if (other.equals(root)) {
					continue;
				}
				otherVal = other.getOtherEarningValue(otherEarning, this);
				if (otherVal != null) {
					return otherVal * comparableEarnings.get(other);
				}
			}
		} else {
			return otherVal;
		}
		
		throw new RuntimeException(String.format(
				"%s does not meet the relation with %s", root.name, otherEarning.name));
	}
}
