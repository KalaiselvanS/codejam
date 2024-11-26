package com.problems;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
/**
 * This is same task done in https://github.com/KalaiselvanS/codejam/blob/master/Problems/src/com/problems/SortWords.java
 * But reduced code using java 8
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
public class SortWordsMultiSortingByComparatorChain {
	public static void main1(String[] args) {
		String[] words = new String[] { "a", "a", "aa", "b", "a", "bb", "bbc", "ba", "ab", "b", "b", "aa", "am", "am" };

		WordsCounter counter = new WordsCounter(words);

		System.out.println("Find word count and then sorting the words as per their count."
				+ "\nIf count is same then sort the words with same count in alphabetical order.");
		counter.ascending().sortCount().desending().sortWords().process();
	}
	
	public static void main(String[] args) {
		String[] words = new String[] { "a", "a", "aa", "b", "a", "bb", "bbc", "ba", "ab", "b", "b", "aa", "am", "am" };

		WordsCounter counter = new WordsCounter(words);

		System.out.println("Find word count and then sorting the words as per their count."
				+ "\nIf count is same then sort the words with same count in alphabetical order.");
	
		List<Word> wordList = new ArrayList<>(counter.wordsMap.values());
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
}

class WordsCounter {

	HashMap<String, Word> wordsMap = new HashMap<>();
	private Comparator associateComparator;
	private ComparatorChain comparatorChain;
	private static final Comparator<Comparable> ASCENDING_ORDER =  (Comparable front, Comparable back) -> front.compareTo(back);
	private static final Comparator<Comparable> DESCENDING_ORDER = (Comparable front, Comparable back) -> back.compareTo(front);

	public WordsCounter(String[] words) {
		for (String w : words) {
			addWord(w);
		}
		associateComparator = ASCENDING_ORDER;
		comparatorChain = new ComparatorChain(null);
	}

	public WordsCounter process() {
		List<Word> words = new ArrayList<>(wordsMap.values());
		Collections.sort(words, comparatorChain);
		System.out.println(words);
		comparatorChain = new ComparatorChain(null);
		return this;
	}

	public void addWord(String w) {
		Word word = wordsMap.get(w);
		if (word == null) {
			word = new Word(w);
			wordsMap.put(w, word);
		}
		word.increase();
	}

	public WordsCounter ascending() {
		associateComparator = ASCENDING_ORDER;
		return this;
	}

	public WordsCounter desending() {
		associateComparator = DESCENDING_ORDER;
		return this;
	}

	public WordsCounter sortWords() {
		Comparator<Word> word_comparator_by_word = (Word front, Word back) -> associateComparator.compare(front.count, back.count);
		ComparatorChain chain = new ComparatorChain(word_comparator_by_word);
		comparatorChain.addLeaf(chain);
		return this;
	}

	public WordsCounter sortCount() {
		Comparator<Word> word_comparator_by_count = (Word front, Word back) -> associateComparator.compare(front.count, back.count);
		ComparatorChain<Word> c = new ComparatorChain(word_comparator_by_count);
		comparatorChain.addLeaf(c);
		return this;
	}
}

class ComparatorChain<T> implements Comparator<T> {
	private ComparatorChain<T> next;
	private Comparator<T> comparator;

	public ComparatorChain(Comparator<T> comparator) {
		this.comparator = comparator;
	}

	public void addLeaf(ComparatorChain<T> next) {
		if (this.next != null) {
			this.next.addLeaf(next);
		} else {
			this.next = next;
		}
	}

	public int compare(T front, T back) {
		int rs = 0;
		if (comparator != null) {
			rs = comparator.compare(front, back);
		}
		if (rs == 0 && next != null) {
			rs = next.compare(front, back);
		}
		return rs;
	}
}

class Word {
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