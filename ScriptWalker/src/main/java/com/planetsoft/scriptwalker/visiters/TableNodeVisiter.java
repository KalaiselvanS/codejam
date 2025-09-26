package com.planetsoft.scriptwalker.visiters;

import java.util.Collection;
import java.util.Map;
import java.util.Set;

import com.planetsoft.scriptwalker.api.TableNode;

/**
 * 
 * @author kalaiselvans
 * 
 *         This enum will be changed to interface once the implementations are
 *         growing bulky.
 */
public enum TableNodeVisiter {

	PARENT_FIRST_TRAVERSAL, CHILD_FIRST_TRAVERSAL, EXTRA;

	public void visit(Map<String, TableNode> nodeMap) {

		Collection<TableNode> nodeCollection = nodeMap.values();

		for (TableNode tableNode : nodeCollection) {

			if (this == PARENT_FIRST_TRAVERSAL) {
				traverseParentFirst(tableNode);
			} else if (this == CHILD_FIRST_TRAVERSAL) {
				traverseChildFirst(tableNode);
			} else if (this == EXTRA) {
				traverseParentFirst(tableNode);
			}
		}
	}

	private void traverseChildFirst(TableNode tableNode) {
		String me = this.name();
		if (tableNode.isVisitedBy(me))
			return;
		tableNode.setVisitedBy(me, true);

		Set<TableNode> children = tableNode.getChildren();
		for (TableNode childNode : children) {
		    String indenttemp = indent;
		    indent += tab;
			traverseChildFirst(childNode);
			indent = indenttemp;
		}
		printTableNode(tableNode);
	}

	private void traverseParentFirst(TableNode tableNode) {
		String me = this.name();
		if (tableNode.isVisitedBy(me))
			return;
		tableNode.setVisitedBy(me, true);

		Set<TableNode> parent = tableNode.getParents();
		for (TableNode childNode : parent) {
		    String indenttemp = indent;
		    indent += tab;
		    traverseParentFirst(childNode);
		    indent = indenttemp;
		}
		printTableNode(tableNode);
	}

	private void printTableNode(TableNode tableNode) {
		if (this == EXTRA) {
			String contentFrag = "\t<table name=\"%s\" key-fields=\"%s\" />\n";
			String keys = "";
			if (tableNode.getPrimaryKeys().size() == 0) {
				contentFrag = "<!--" + contentFrag + "-->";
				keys = ("## not found ## ");
			} else {
				StringBuilder keysBuilder = new StringBuilder();
				for (String key : tableNode.getPrimaryKeys()) {
					keysBuilder.append(key);
					keysBuilder.append(",");
				}
				keys = keysBuilder.substring(0, keysBuilder.length() - 1);
			}
			System.out.format(contentFrag, tableNode.getTableName(), keys
					.toString());

		}else if(this == PARENT_FIRST_TRAVERSAL){
//			System.out.println(tableNode.getCreateScript()+"\nGO\n");
//			System.out.println(tableNode.generateStatScripts());
		}else if(this == CHILD_FIRST_TRAVERSAL){
//			System.out.println("DROP TABLE "+tableNode.getTableName()+"\nGO\n");
		}
		System.out.println(indent+tableNode.getTableName());
	}
	    static String tab = "\t";
	    String indent = "\t";
}
