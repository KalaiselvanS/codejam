package com.problems.indexing;

import java.io.IOException;
import java.nio.file.*;
import java.util.*;
import java.util.stream.*;

public class SearchMain {

	public static void main(String[] args) {
		Shard shard = new Shard();
		DocumentRepo repo = new DocumentRepo();
		DocumentCompositeVisiter docCompositeVisiter = new DocumentCompositeVisiter(shard, repo);
		Path path = Path.of("ecom_data1");
		docCompositeVisiter.visitForIndexing(path);
		//////////////////////////////////////
//		Set<Long> docIDs = shard.searchByWord("Wireless");//search from ecom_data file
		Set<Long> docIDs = shard.searchByWord("Technology");//After running the above copy the result into ecom_data1 and run again for further search from that
		repo.getRowDocs(docIDs).forEach(System.out::println);
	}
}

class DocumentCompositeVisiter {

	private Shard shard;
	private DocumentRepo repo;

	public DocumentCompositeVisiter(Shard shard, DocumentRepo repo) {
		this.shard = shard;
		this.repo = repo;
	}

	public void visitForIndexing(Path path) {
		try (Stream<String> lines = Files.lines(path)) {
			lines.forEach(line -> {
				long uniqueKey = MyUUID.getUUID();
				RowDocument document = new RowDocument(uniqueKey, line);
				repo.push(document);
				visitForIndexing(document);
			});
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void visitForIndexing(RowDocument document) {
		StringTokenizer tokenizer = new StringTokenizer(document.getLine(), ",;:! ");
		while (tokenizer.hasMoreTokens()) {
			String token = tokenizer.nextToken();
			shard.indexInRootNode(token, document.getUniqueKey());
		}
	}
}

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

class DocumentRepo {
	Map<Long, RowDocument> repo = new HashMap<>();

	public List<RowDocument> getRowDocs(Set<Long> docIDs) {
		List<RowDocument> ssearchResult = docIDs.stream()
				.map(repo::get).filter(Objects::nonNull)
				.collect(Collectors.toList());
		return ssearchResult;
	}
	public void push(RowDocument document) {
		repo.put(document.getUniqueKey(), document);
	}
}

class MyUUID {
	private static long nextID;
	public static long getUUID() {
		return nextID++;
	}
}

class Shard {

	private CharNode rootCharNode = null;

	public Shard() {
		rootCharNode = new CharNode(null);
	}
	
	public void indexInRootNode (String word, long l) {
		word = word.toLowerCase();
		CharNode leafCharNode = rootCharNode.searchOrAddWordToCharsStructure(0, word.toCharArray());
		leafCharNode.addPresenceInDocIndices(l);
	}

	public  Set<Long> searchByWord(String word) {
		word = word.toLowerCase();
		CharNode leafCharNode = rootCharNode.searchOrAddWordToCharsStructure(0, word.toCharArray());
		Set<Long> idList = leafCharNode.getRowDocumentIDs();
		return idList;
	}
}

class CharNode {
	
	Character thisChar;
	List<CharNode> crossCharNodes = new LinkedList<>();
	private Set<Long> documentInices = new HashSet<>();
	
	public CharNode(Character thisChar) {
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
		CharNode other = (CharNode) obj;
		return Objects.equals(thisChar, other.thisChar);
	}

	/**
	 * TODO cover -ve cases
	 * @param word
	 * @return leaf node
	 */
	public CharNode searchOrAddWordToCharsStructure(int charInd, char[] cWord) {
		CharNode charNode = this.searchOrAdd(new CharNode(cWord[charInd]));
		if (cWord.length == ++charInd) {
			return charNode;
		}
		return searchOrAddWordToCharsStructure(charInd, cWord);
	}

	private CharNode searchOrAdd(CharNode leafCharNode) {
		for (CharNode elemNode : crossCharNodes) {
			if (leafCharNode.equals(elemNode)) {
				return elemNode;
			}
		}
		crossCharNodes.add(leafCharNode);
		return leafCharNode;
	}

	public void addPresenceInDocIndices(long docIndex) {
		this.documentInices.add(docIndex);
	}

	public Set<Long> getRowDocumentIDs() {
		return this.documentInices;
	}
}
