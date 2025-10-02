package com.intergalactic.conv;
import java.util.HashMap;
import java.util.Map;

public class IntergalacticConverter {

    private final Map<String, String> intergalacticToRoman = new HashMap<>();

    public void addMapping(String word, String roman) {
        intergalacticToRoman.put(word, roman);
    }

    public int convert(String[] words) {
        StringBuilder roman = new StringBuilder();
        for (String word : words) {
            if (!intergalacticToRoman.containsKey(word)) {
                throw new IllegalArgumentException("Unknown intergalactic word: " + word);
            }
            roman.append(intergalacticToRoman.get(word));
        }
        return romanToDecimal(roman.toString());
    }

    private int romanToDecimal(String roman) {
        Map<Character, Integer> map = Map.of(
            'I', 1, 'V', 5, 'X', 10, 'L', 50,
            'C', 100, 'D', 500, 'M', 1000
        );

        int total = 0, prev = 0;
        for (int i = roman.length() - 1; i >= 0; i--) {
            int value = map.get(roman.charAt(i));
            if (value < prev) total -= value;
            else total += value;
            prev = value;
        }
        return total;
    }
}
