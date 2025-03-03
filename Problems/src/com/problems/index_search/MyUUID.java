package com.problems.index_search;

class MyUUID {
	private static long nextID;

	public static long getUUID() {
		return nextID++;
	}
}