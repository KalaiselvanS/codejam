package com.problems.index_search;

import java.nio.file.Path;
import java.util.Set;
import java.util.TreeSet;

public class SearchMain {

	public static void main(String[] args) {
		Shard shard = new Shard();
		DocumentRepo repo = new DocumentRepo();
		DocumentCompositeVisiter docCompositeVisiter = new DocumentCompositeVisiter(shard, repo);
		Path path = Path.of("ecom_data");
		docCompositeVisiter.visitForIndexing(path);
//		print(shard.rootCharNode, "");
		System.out.println(MyUUID.getUUID());

		Set<Long> docIDs = shard.searchByWord("Keyboard");// search from ecom_data file
//		Set<Long> docIDs = shard.searchByWord("Technology");// After running the above copy the result into ecom_data1
		// and run again for further search from that
		repo.getRowDocs(docIDs).forEach(System.out::println);
	}

	private static void print(CharKey rootCharNode, String ind) {
		CharKey c = rootCharNode;
		System.out.println(ind + c.thisChar + "-" + c.documentInices.size());
		TreeSet<CharKey> stream = c.crossCharNodes;
		stream.stream().forEach(n -> print(n, ind + "  "));
	}
}