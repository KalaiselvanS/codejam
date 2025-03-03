package com.problems.index_search;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
import java.util.TreeSet;

class CharKey implements Comparable<CharKey> {

	Character thisChar;
	TreeSet<CharKey> crossCharNodes = new TreeSet<>();
	Set<Long> documentInices = new HashSet<>();

	public CharKey(Character thisChar) {
		super();
		this.thisChar = thisChar;
	}

	@Override
	public int hashCode() {
		return Objects.hash(thisChar);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CharKey other = (CharKey) obj;
		return Objects.equals(thisChar, other.thisChar);
	}

	/**
	 * TODO cover -ve cases
	 * 
	 * @param word
	 * @return leaf node
	 */
	public CharKey searchOrAddWordToCharsStructure(int charInd, char[] cWord, CharKey charParentNode) {
		if (cWord.length == charInd) {
			return charParentNode;
		}
		CharKey leafCharNode = new CharKey(cWord[charInd]);
		boolean isNew = true;
		for (CharKey elemNode : charParentNode.crossCharNodes) {
			if (leafCharNode.equals(elemNode)) {
				leafCharNode = elemNode;
				isNew = false;
				break;
			}
		}
		if (isNew) {
			charParentNode.crossCharNodes.add(leafCharNode);
		}
		return searchOrAddWordToCharsStructure(++charInd, cWord, leafCharNode);
	}

	public void addPresenceInDocIndices(long docIndex) {
		this.documentInices.add(docIndex);
	}

	public Set<Long> getRowDocumentIDs() {
		return this.documentInices;
	}

	@Override
	public int compareTo(CharKey o) {
		return thisChar.compareTo(o.thisChar);
	}
}