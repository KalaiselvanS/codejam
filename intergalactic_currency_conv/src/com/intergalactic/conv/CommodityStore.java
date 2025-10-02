package com.intergalactic.conv;
import java.util.HashMap;
import java.util.Map;

public class CommodityStore {

    private final Map<String, Double> commodityValues = new HashMap<>();

    public void addCommodity(String name, double unitValue) {
        commodityValues.put(name, unitValue);
    }

    public double getCommodityValue(String name) {
        if (!commodityValues.containsKey(name)) {
            throw new IllegalArgumentException("Unknown commodity: " + name);
        }
        return commodityValues.get(name);
    }
}
