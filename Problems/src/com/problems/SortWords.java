package com.problems;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
/**
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
	bbc 	: 1	]
 *
 */
public class SortWords {
	public static void main(String[] args) {
		String[] words = new String[] { "a", "a", "aa", "b", "a", "bb", "bbc", "ba", "ab", "b", "b", "aa", "am", "am" };

		WordsCounter counter = new WordsCounter(words);
		counter.desending().sortCount().desending().sortWords().process().desending().sortCount().ascending()
				.sortWords().process().ascending().sortCount().desending().sortWords().process().ascending().sortCount()
				.ascending().sortWords().process().desending().sortWords().desending().sortCount().process().desending()
				.sortWords().ascending().sortCount().process().ascending().sortWords().desending().sortCount().process()
				.ascending().sortWords().ascending().sortCount().process().ascending().sortWords().process().desending()
				.sortWords().process().ascending().sortCount().process().desending().sortCount().process();

		System.out.println("Find word count and then sorting the words as per their count."
				+ "\nIf count is same then sort the words with same count in alphabetical order.");
		counter.desending().sortCount().ascending().sortWords().process();
	}
}

class WordsCounter {

	public WordsCounter process() {
		List<Word> words = new ArrayList<>(wordsMap.values());
		Collections.sort(words, comparatorChain);
		System.out.println(words);
		comparatorChain = new ComparatorChain(null);
		return this;
	}

	private Comparator associateComparator;
	private ComparatorChain comparatorChain;
	private HashMap<String, Word> wordsMap = new HashMap<>();

	private static final Comparator ASCENDING_ORDER = new Comparator() {
		@Override
		public int compare(Object front, Object back) {
			return ((Comparable) front).compareTo(back);
		}

		public String toString() {
			return "ASCENDING_ORDER";
		}
	};
	private static final Comparator DESCENDING_ORDER = new Comparator() {
		@Override
		public int compare(Object front, Object back) {
			return ((Comparable) back).compareTo(front);
		}

		public String toString() {
			return "DESCENDING_ORDER";
		}
	};

	public WordsCounter(String[] words) {
		for (String w : words) {
			addWord(w);
		}
		associateComparator = ASCENDING_ORDER;
		comparatorChain = new ComparatorChain(null);
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
		WordComparator wordComparator = new WordComparator(associateComparator);
		ComparatorChain chain = new ComparatorChain(wordComparator);
		comparatorChain.addLeaf(chain);
		return this;
	}

	public WordsCounter sortCount() {
		comparatorChain.addLeaf(new ComparatorChain(new CountComparator(associateComparator)));
		return this;
	}

	public static class CountComparator implements Comparator<Word> {
		Comparator<Integer> comparator;

		public CountComparator(Comparator<Integer> comparator) {
			this.comparator = comparator;
		}

		public int compare(Word front, Word back) {
			return comparator.compare(front.count, back.count);
		}

		public String toString() {
			return "CountComparator";
		}
	}

	public static class WordComparator implements Comparator<Word> {
		Comparator<String> comparator;

		public WordComparator(Comparator<String> comparator) {
			this.comparator = comparator;
		}

		public int compare(Word front, Word back) {
			return comparator.compare(front.word, back.word);
		}

		public String toString() {
			return "WordComparator";
		}
	}

	public static class ComparatorChain<T> implements Comparator<T> {
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

	public class Word {
		private String word;
		private Integer count;

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