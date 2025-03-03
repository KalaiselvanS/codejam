package com.problems.index_search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

class DocumentRepo {
	Map<Long, RowDocument> repo = new HashMap<>();

	public List<RowDocument> getRowDocs(Set<Long> docIDs) {
		List<RowDocument> ssearchResult = docIDs.stream().map(repo::get).filter(Objects::nonNull)
				.collect(Collectors.toList());
		return ssearchResult;
	}

	public void push(RowDocument document) {
		repo.put(document.getUniqueKey(), document);
	}
}