package com.problems.index_search;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.StringTokenizer;
import java.util.stream.Stream;

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
		StringTokenizer tokenizer = new StringTokenizer(document.getLine(), ",;:!_ ");
		while (tokenizer.hasMoreTokens()) {
			String token = tokenizer.nextToken();
			token = token.replaceAll("[^a-zA-Z]", "");
			if (token.isEmpty()) {
				continue;
			}

			shard.indexInRootNode(token, document.getUniqueKey());
		}
	}
}