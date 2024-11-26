package com.problems;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.SortedMap;
import java.util.stream.Collectors;
import java.util.stream.Stream;
/**
 * This is same task done in https://github.com/KalaiselvanS/codejam/blob/master/Problems/src/com/problems/SortWordsMultiSortingByComparatorChain.java
 * But made it very simple by Java 8
 * 
Find word count and then sorting the words as per their count.
If count is same then sort the words with same count in alphabetical order.

Input: ["a", "a", "aa", "b", "a", "bb", "bbc", "ba", "ab", "b", "b", "aa", "am", "am" ]
Output:
[
	a 	: 3	, 
	b 	: 3	, 
	aa 	: 2	, 
	am 	: 2	, 
	ab 	: 1	, 
	ba 	: 1	, 
	bb 	: 1	, 
	bbc : 1	]
 *
 */
public class SortWordsMakeItVerySimple {
	
	static HashMap<String, Word> wordsMap = new HashMap<>();
	
	public static void main(String[] args) {
		
		String[] words = new String[] { "a", "a", "aa", "b", "a", "bb", "bbc", "ba", "ab", "b", "b", "aa", "am", "am" };

		System.out.println("Find word count and then sorting the words as per their count."
				+ "\nIf count is same then sort the words with same count in alphabetical order.");
//		Stream.of(words)
//			.collect(Collectors.groupingBy(s -> s, Collectors.counting()))// Map<String, Long>
//			.entrySet().stream()// Stream<Entry<String, Long>>
//			.sorted((f, b) -> f.getKey().compareTo(b.getKey()))// Stream<Entry<String, Long>>
//			.sorted((f, b) -> b.getValue().compareTo(f.getValue()))// Stream<Entry<String, Long>>
//			.forEach(System.out::println);
//		 Or
		Stream.of(words)
			.collect(Collectors.groupingBy(s -> s, Collectors.counting()))// Map<String, Long>
			.entrySet().stream()// Stream<Entry<String, Long>>
			.sorted(Map.Entry.comparingByKey())// Stream<Entry<String, Long>>
			.sorted(Map.Entry.comparingByValue(Comparator.reverseOrder()))// Stream<Entry<String, Long>>
			.forEach(System.out::println);
	}
}
