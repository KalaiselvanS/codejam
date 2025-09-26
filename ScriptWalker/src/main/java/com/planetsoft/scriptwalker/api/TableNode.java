package com.planetsoft.scriptwalker.api;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * 
 * @author kalaiselvans
 * 
 */
public class TableNode implements Comparable<TableNode> {

	private static final String NEW_LINE = System.getProperty("line.separator");
	private Set<TableNode> parents = new TreeSet<TableNode>();
	private Set<TableNode> children = new TreeSet<TableNode>();
	private String createScript;// "";
	private String tableName;// "";
	private Map<String, Boolean> visitedBy = new HashMap<String, Boolean>();
	private Set<String> primaryKeys = new LinkedHashSet<String>();
	private Set<String> columns = new LinkedHashSet<String>();
	private Set<String>nonKeyColumns = new LinkedHashSet<String>();

	public TableNode() {
	}

	public TableNode(String tableName) {
		this.tableName = tableName;
	}

	public void addParent(TableNode parentNode) {
		parents.add(parentNode);
		parentNode.addChild(this);
	}

	public Set<TableNode> getParents() {
		return parents;
	}

	protected void addChild(TableNode childNode) {
		children.add(childNode);
	}

	public Set<TableNode> getChildren() {
		return children;
	}

	public void changeCreateScript(String createScript) {
		this.createScript = createScript;
	}

	public String getCreateScript() {
		return createScript;
	}

	protected void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getTableName() {
		return tableName;
	}

	public boolean isVisitedBy(String me) {
		if (visitedBy.containsKey(me))
			return visitedBy.get(me);
		return false;
	}

	public void setVisitedBy(String me, boolean isVisited) {
		this.visitedBy.put(me, isVisited);
	}

	public int compareTo(TableNode peerNode) {
		return this.tableName.compareToIgnoreCase(peerNode.tableName);
	}

	@Override
	public boolean equals(Object other) {
		if (other != null && other instanceof TableNode) {
			TableNode otherNode = (TableNode) other;
			return compareTo(otherNode) == 0;
		}
		return false;
	}

	@Override
	public int hashCode() {
		if (tableName == null || tableName.length() <= 0)
			return 0;
		return this.tableName.hashCode();
	}

	@Override
	public String toString() {
		return this.tableName;
	}

	public void addPrimaryKey(String key) {
		primaryKeys.add(key);
	}

	public Set<String> getPrimaryKeys() {
		return primaryKeys;
	}

	public boolean addColumn(String columnName) {
		if(!primaryKeys.contains(columnName)){
			nonKeyColumns.add(columnName);
		}
		return columns.add(columnName);
	}
	
	public Set<String> getColumns() {
		return columns;
	}

	public Set<String>getNonKeyColumns(){
		return nonKeyColumns;
	}
	
	public String generatePrimaryKeyStats(){
		Iterator<String> priKeyColIter = primaryKeys.iterator();
		StringBuffer sb = new StringBuffer();
		boolean firstColumnParsed = false;
		while(priKeyColIter.hasNext()){
			String statColName = priKeyColIter.next();
			if(!firstColumnParsed){
				firstColumnParsed = true;
				continue;
			}
			sb.append("CREATE STATISTICS ").append(statColName).append(" ON ").append(tableName).
			append("(")	
			.append(statColName);
			Iterator<String> priKeyColIterInner = primaryKeys.iterator();
			while(priKeyColIterInner.hasNext()){
				//CREATE STATISTICS [appl_api_filter_jar_nm] ON [dbo].[appl_api_filter_t]([appl_api_filter_jar_nm], [appl_cd], [appl_api_filter_seq_num])
				String priKeyColName = priKeyColIterInner.next();
				if(statColName.equalsIgnoreCase(priKeyColName)){
					//Skip the current column
					continue;
				}
				sb.append(", ").append(priKeyColName);
			}
			sb.append(")");
			sb.append(NEW_LINE);
			sb.append("GO");
			sb.append(NEW_LINE);
		}
		
		return sb.toString();
	}

//	
//	CREATE STATISTICS [appl_api_filter_jar_nm] ON [dbo].[appl_api_filter_t]([appl_api_filter_jar_nm], [appl_cd], [appl_api_filter_seq_num])
//	GO
//	/****** Object:  Statistic [appl_api_filter_seq_num]    Script Date: 10/23/2009 14:07:23 ******/
//	CREATE STATISTICS [appl_api_filter_seq_num] ON [dbo].[appl_api_filter_t]([appl_api_filter_seq_num], [appl_cd])
//	GO
//	/****** Object:  Statistic [appl_api_filter_txt]    Script Date: 10/23/2009 14:07:23 ******/
//	CREATE STATISTICS [appl_api_filter_txt] ON [dbo].[appl_api_filter_t]([appl_api_filter_txt], [appl_cd], [appl_api_filter_seq_num])
//	GO
//	/****** Object:  Statistic [lst_updt_dtm]    Script Date: 10/23/2009 14:07:23 ******/
//	CREATE STATISTICS [lst_updt_dtm] ON [dbo].[appl_api_filter_t]([lst_updt_dtm], [appl_cd], [appl_api_filter_seq_num])
//	GO
//	/****** Object:  Statistic [lst_updt_user_id]    Script Date: 10/23/2009 14:07:23 ******/
//	CREATE STATISTICS [lst_updt_user_id] ON [dbo].[appl_api_filter_t]([lst_updt_user_id], [appl_cd], [appl_api_filter_seq_num])
//	GO	
	
	private String generateStats(String columnName){
		StringBuffer sb = new StringBuffer();
		sb.append("CREATE STATISTICS ").append(columnName).append(" ON ").append(tableName).
		append("(")
		.append(columnName);
		Iterator<String> priKeyColIter = primaryKeys.iterator();
		while(priKeyColIter.hasNext()){
			sb.append(", ").append(priKeyColIter.next());
		}
		
		sb.append(")");
		sb.append(NEW_LINE);
		sb.append("GO");
		sb.append(NEW_LINE);
		return sb.toString();
	}

	public String generateNonKeyColStats(){
		StringBuffer sb = new StringBuffer();
		Iterator<String> nonKeyColIter = nonKeyColumns.iterator();
		while(nonKeyColIter.hasNext()){
			sb.append(generateStats(nonKeyColIter.next()));
		}
		return sb.toString();
	}
	
	public String generateStatScripts(){
		return generatePrimaryKeyStats()+generateNonKeyColStats();
	}
}