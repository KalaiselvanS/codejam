package com.planetsoft.scriptwalker;

import java.io.BufferedOutputStream;
import java.io.FileDescriptor;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import com.planetsoft.scriptwalker.api.ReaderManager;
import com.planetsoft.scriptwalker.api.ScriptReader;
import com.planetsoft.scriptwalker.api.TableNode;
import com.planetsoft.scriptwalker.visiters.TableNodeVisiter;

/**
 * 
 * @author kalaiselvans
 * 
 */
public class OneExecute {

	/**
	 * @param args
	 * @throws ClassNotFoundException
	 * @throws FileNotFoundException
	 */
	public static void main(String[] args) throws ClassNotFoundException,
			FileNotFoundException {
		Class.forName("com.planetsoft.scriptwalker.vendors.SQLServerReader");
		Class.forName("com.planetsoft.scriptwalker.vendors.MySQLReader");
		Class.forName("com.planetsoft.scriptwalker.vendors.H2Reader");
		Class.forName("com.planetsoft.scriptwalker.vendors.OracleReader");		
		ScriptReader reader = ReaderManager.getReader("oracle");
		
		Map<String, TableNode> allTbls = reader.readScript("C:/Documents and Settings/kalaiselvans/Desktop/toThenu/sbi_dev_cms_prod_6_chn.sql");
		Map<String, TableNode> tbls = filter(allTbls,"C:/Documents and Settings/kalaiselvans/Desktop/toThenu/doTheseFilesOnly.txt");
		
		int unkown = 0;
		int tot = 0;
		for (Map.Entry<String, TableNode> entry : tbls.entrySet()) {
			TableNode node = entry.getValue();
			 sysout(node);
			String str = node.getCreateScript();
			if (str == null || str.length() <= 0)
				unkown++;
			tot++;
		}

		System.out.println("============================================");
		System.out.println("Total tables are in the script : " + tot + ":");
		System.out.println("Unkown tables are : " + unkown);

		TableNodeVisiter parentFirstVisiter = TableNodeVisiter.PARENT_FIRST_TRAVERSAL;
		TableNodeVisiter childFirstVisiter = TableNodeVisiter.CHILD_FIRST_TRAVERSAL;
		
		 System.out.println("============================================");
		 System.out.println("========== CHILD_FIRST_TRAVERSAL ===========");
		 System.out.println("============================================");
		 System.setOut(new PrintStream("C:/Documents and Settings/kalaiselvans/Desktop/toThenu/CHILD_FIRST_TRAVERSAL.txt"));
		 childFirstVisiter.visit(tbls);
		 setSysOut();
		 System.out.println("============================================");
		 System.out.println("========== PARENT_FIRST_TRAVERSAL ==========");
		 System.out.println("============================================");
		 System.out.println(tbls.size());
		 System.out.println("============================================");
		 System.setOut(new PrintStream("C:/Documents and Settings/kalaiselvans/Desktop/toThenu/PARENT_FIRST_TRAVERSAL.txt"));
		 parentFirstVisiter.visit(tbls);
		 
		 
	}

	private static void setSysOut() {
        	FileOutputStream fdOut = new FileOutputStream(FileDescriptor.out);
        	System.setOut(new PrintStream(new BufferedOutputStream(fdOut, 128), true));
       	}

	private static void sysout(TableNode node) {
		System.out.println(" Table Name\t:\t" + node.getTableName());
		System.out.println("    Parents\t:\t" + node.getParents());
		System.out.println("   Children\t:\t" + node.getChildren());
		System.out.println("---------------------------------------------------------");
	}

	private static Map<String, TableNode> filter(Map<String, TableNode> allTbls, String filterFile) {
		List<String> tbls = null;
		try {
			tbls = getTokensFrom(StreamUtil.getContent(filterFile), "\n", "", "");
		} catch (IOException e2) {
			e2.printStackTrace();
		}

		Map<String, TableNode> newTbls = new HashMap<String, TableNode>();
		if (tbls == null || tbls.size() == 0)
			return allTbls;
		for (String string : tbls) {
			newTbls.put(string, allTbls.get(string));
		}
		return newTbls;
	}

	public static List<String> getTokensFrom(String content, String delim,
			String prefix, String suffix) {
		StringTokenizer stringTokenizer = new StringTokenizer(content, delim);
		List<String> list = new ArrayList<String>();
		while (stringTokenizer.hasMoreTokens()) {
			String tok = stringTokenizer.nextToken().trim();
			if (tok.length() > 0)
				list.add(tok);
		}
		return list;
	}
}
