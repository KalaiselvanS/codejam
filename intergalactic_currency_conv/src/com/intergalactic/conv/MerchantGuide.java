package com.intergalactic.conv;
public class MerchantGuide {

    private final IntergalacticConverter converter = new IntergalacticConverter();
    private final CommodityStore store = new CommodityStore();

    public void addMapping(String word, String roman) {
        converter.addMapping(word, roman);
    }

    public void addCommodity(String[] intergalacticWords, String commodity, double totalCredits) {
        int quantity = converter.convert(intergalacticWords);
        double unitValue = totalCredits / quantity;
        store.addCommodity(commodity, unitValue);
    }

    public String queryHowMuch(String[] intergalacticWords) {
        int value = converter.convert(intergalacticWords);
        String joinedWords = String.join(" ", intergalacticWords);
        return joinedWords + " is " + value;
    }

    public String queryHowManyCredits(String[] intergalacticWords, String commodity) {
        int quantity = converter.convert(intergalacticWords);
        double credits = quantity * store.getCommodityValue(commodity);
        String joinedWords = String.join(" ", intergalacticWords);
        return joinedWords + " " + commodity + " is " + (int) credits + " Credits";
    }
}
