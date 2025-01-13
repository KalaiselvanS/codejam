package com.problems.anagram;
import java.util.*;

/**
 * Developer is a developer. AI is a servant for a developer.
 */

public class MoreOptimizedByDeveloper {
	
	public static void main1(String[] args) {
		int i = 1;
//		00000000000000000000000000;
//		10000000000000000000000000
		int z = 0B10000000000000000000000000;
		i <<= 'z'-'a';
//		i |= z;
		System.out.println(i + " : " + Integer.toBinaryString(i));
	}

    // Method to group anagrams from a list of words using character frequency counts
    public static Map<Integer, List<String>> groupAnagrams(List<String> words) {
        Map<Integer, List<String>> anagramGroups = new HashMap<>();

        // Iterate through each word in the list
        for (String word : words) {
            // Remove spaces and convert the word to lowercase
            String cleanedWord = word.replaceAll("\\s", "").toLowerCase();

            // Create a integer variable to the index of characters (26 lower case English letters)
            int key = 0;

            // Populate the frequency array based on the cleaned word
            for (char c : cleanedWord.toCharArray()) {
            	key |= (1 << c - 'a');
            }

            // Add the word to the corresponding anagram group
            anagramGroups.putIfAbsent(key, new ArrayList<>());
            anagramGroups.get(key).add(word);
        }

        return anagramGroups;
    }

    public static void main(String[] args) {
        // Example list of words
        List<String> words = Arrays.asList(
            "listen", "silent", "enlist", "rat", "tar", "art", "god", "dog", "odg",
            "evil", "vile", "live"
        );

        // Group the anagrams
        Map<Integer, List<String>> anagramGroups = groupAnagrams(words);

        // Print the anagram groups
        for (Map.Entry<Integer, List<String>> entry : anagramGroups.entrySet()) {
            System.out.println(entry.getValue());
        }
    }
}
