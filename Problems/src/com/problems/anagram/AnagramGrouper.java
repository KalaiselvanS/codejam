package com.problems.anagram;
import java.util.*;

/**
 * Type in chaGPT "Group the anagrams from the list of words in java"
 * You will get the below code
 */
public class AnagramGrouper {

    // Method to group anagrams from a list of words
    public static Map<String, List<String>> groupAnagrams(List<String> words) {
        Map<String, List<String>> anagramGroups = new HashMap<>();

        // Iterate through each word in the list
        for (String word : words) {
            // Remove spaces and convert the word to lowercase for case-insensitive comparison
            String cleanedWord = word.replaceAll("\\s", "").toLowerCase();

            // Sort the characters of the word
            char[] charArray = cleanedWord.toCharArray();
            Arrays.sort(charArray);
            String sortedWord = new String(charArray);

            // If the sorted word already exists in the map, add the word to the corresponding list
            anagramGroups.putIfAbsent(sortedWord, new ArrayList<>());
            anagramGroups.get(sortedWord).add(word);
        }

        return anagramGroups;
    }

    public static void main(String[] args) {
        // Example list of words
        List<String> words = Arrays.asList("listen", "silent", "enlist", "rat", "tar", "art", "god", "dog", "odg");

        // Group the anagrams
        Map<String, List<String>> anagramGroups = groupAnagrams(words);

        // Print the anagram groups
        for (Map.Entry<String, List<String>> entry : anagramGroups.entrySet()) {
            System.out.println(entry.getValue());
        }
    }
}
