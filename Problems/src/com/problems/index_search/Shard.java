package com.problems.index_search;

import java.util.Set;

class Shard {

	CharKey rootCharNode = null;

	public Shard() {
		rootCharNode = new CharKey(null);
	}

	public void indexInRootNode(String word, long l) {
		word = word.toLowerCase();
		CharKey leafCharNode = rootCharNode.searchOrAddWordToCharsStructure(0, word.toCharArray(), rootCharNode);
		leafCharNode.addPresenceInDocIndices(l);
	}

	public Set<Long> searchByWord(String word) {
		word = word.toLowerCase();
		CharKey leafCharNode = rootCharNode.searchOrAddWordToCharsStructure(0, word.toCharArray(), rootCharNode);
		Set<Long> idList = leafCharNode.getRowDocumentIDs();
		return idList;
	}
}