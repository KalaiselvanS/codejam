package com.problems.index_search;

class RowDocument {

	private String line;
	private long uniqueKey;

	public RowDocument(long uniqueKey, String line) {
		this.uniqueKey = uniqueKey;
		this.line = line;
	}

	public String getLine() {
		return line;
	}

	public long getUniqueKey() {
		return uniqueKey;
	}

	public String toString() {
		return line;
	}

}