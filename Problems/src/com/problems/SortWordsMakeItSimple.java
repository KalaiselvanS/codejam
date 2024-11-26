package com.problems;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
/**
 * This is same task done in https://github.com/KalaiselvanS/codejam/blob/master/Problems/src/com/problems/SortWordsMultiSortingByComparatorChain.java
 * But made it very simple why do you think complex?
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
public class SortWordsMakeItSimple {
	
	static HashMap<String, Word> wordsMap = new HashMap<>();
	
	public static void main(String[] args) {
		String[] words = new String[] { "a", "a", "aa", "b", "a", "bb", "bbc", "ba", "ab", "b", "b", "aa", "am", "am" };

		System.out.println("Find word count and then sorting the words as per their count."
				+ "\nIf count is same then sort the words with same count in alphabetical order.");
	
		for (String w : words) {
			addWord(w);
		}
		List<Word> wordList = new ArrayList<>(wordsMap.values());
		System.out.println(wordList);
		Collections.sort(wordList, new Comparator<Word>() {
			public int compare(Word o1, Word o2) {
				int i = o2.count.compareTo(o1.count);
				if (i == 0) {
					i = o1.word.compareTo(o2.word);
				}
				return i;
			}
		});
		System.out.println(wordList);
	}

	public static void addWord(String w) {
		Word word = wordsMap.get(w);
		if (word == null) {
			word = new Word(w);
			wordsMap.put(w, word);
		}
		word.increase();
	}
	
	static class Word {
		public String word;
		public Integer count;

		public Word(String word) {
			this.word = word;
			count = 0;
		}

		public void increase() {
			count++;
		}

		@Override
		public String toString() {
			return String.format("\n\t%s \t: %s\t", word, count);
		}
	}
}
