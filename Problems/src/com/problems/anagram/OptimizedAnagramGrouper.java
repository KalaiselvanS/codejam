package com.problems.anagram;
import java.util.*;

/**
 * Type in chaGPT "Group the anagrams from the list of words in java"
 * It will return the AnagramGrouper.java
 * And further type in chaGPT "How will you optimize it for million of words given as input"
 * You will get the below code
 * 
 * What else the developer required? ;-)
 * 
 */

public class OptimizedAnagramGrouper {

    // Method to group anagrams from a list of words using character frequency counts
    public static Map<String, List<String>> groupAnagrams(List<String> words) {
        Map<String, List<String>> anagramGroups = new HashMap<>();

        // Iterate through each word in the list
        for (String word : words) {
            // Remove spaces and convert the word to lowercase
            String cleanedWord = word.replaceAll("\\s", "").toLowerCase();

            // Create a frequency array for the characters (26 lowercase English letters)
            int[] frequency = new int[26];

            // Populate the frequency array based on the cleaned word
            for (char c : cleanedWord.toCharArray()) {
                frequency[c - 'a']++;
            }

            // Use the frequency array as the key (convert it to a string for hashing)
            String key = Arrays.toString(frequency);

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
        Map<String, List<String>> anagramGroups = groupAnagrams(words);

        // Print the anagram groups
        for (Map.Entry<String, List<String>> entry : anagramGroups.entrySet()) {
            System.out.println(entry.getValue());
        }
    }
}
