package com.planetsoft.scriptwalker.vendors;

import java.util.Scanner;
import java.util.Set;

import com.planetsoft.scriptwalker.StringUtil;
import com.planetsoft.scriptwalker.api.AbstractScriptReader;
import com.planetsoft.scriptwalker.api.ReaderManager;
import com.planetsoft.scriptwalker.api.TableNode;

/**
 * 
 * @author kalaiselvans
 * 
 */
public class OracleReader extends AbstractScriptReader {

	static {
		ReaderManager.registerReader("oracle", OracleReader.class);
	}

	@Override
	protected String getTableScriptDelim() {
		return ";";
	}
	@Override
	protected TableNode populateTableNode(String scriptFrag) {		
		String tableName = "";
		String parent = null;
		TableNode parentNode = null;
		
//*		START : Searching Table name in scriptFrag
		int offset = StringUtil.indexOfIgnoreCase(scriptFrag," TABLE ")+ " TABLE ".length();
		int endIndex = scriptFrag.indexOf("(");
		if (endIndex < 0)
			return null;
		tableName = scriptFrag.substring(offset, endIndex).trim();
		//tableName = tableName.substring(tableName.indexOf('.'));// to skip dbo.
//*		END : Searching Table name in scriptFrag
		
		TableNode tableNode = super.lookUpNode(tableName.toLowerCase());

//*		START : Searching ParentTable names in scriptFrag
		offset = StringUtil.indexOfIgnoreCase(scriptFrag,"REFERENCES");
		endIndex = 0;
		while (offset != -1) {
			offset += "REFERENCES".length();
			endIndex = scriptFrag.indexOf("(", offset);
			parent = scriptFrag.substring(offset, endIndex).trim();
			// parent = parent.substring(tableName.indexOf('.'));// to skip dbo.
			parentNode = super.lookUpNode(parent.toLowerCase());
			tableNode.addParent(parentNode);
			offset = scriptFrag.indexOf("REFERENCES", endIndex);
		}
//*		END : Searching ParentTable names in scriptFrag
		
//*		START : Searching primary keys in scriptFrag
		offset = 0;
		final String PRI_KEY_ST_IND = "PRIMARY KEY (";
		offset = StringUtil.indexOfIgnoreCase(scriptFrag, PRI_KEY_ST_IND);
		while (offset > 0) {
//			offset = scriptFrag.indexOf("primary key (", offset) + 1;
			endIndex = scriptFrag.indexOf(")", offset);
			String keys = scriptFrag.substring(offset, endIndex);
			
			Scanner scanner = new Scanner(keys);
			scanner.useDelimiter(",");
			while (scanner.hasNext()) {
				String key = (String) scanner.next();
				if(key.indexOf(PRI_KEY_ST_IND) > -1){
					key = key.replace(PRI_KEY_ST_IND, "");
				}
				tableNode.addPrimaryKey(key.trim());
			}
			offset = StringUtil.indexOfIgnoreCase(scriptFrag, PRI_KEY_ST_IND,endIndex);
		}
//*		END : Searching primary keys in scriptFrag

//*		START : Searching columns in scriptFrag
		offset = 0;
		offset = scriptFrag.indexOf('(') + 1;
		if(scriptFrag.startsWith("CREATE TABLE ADM_PAYMT_CATEGORY")){
		   System.out.println("");
		}
		
		while (true) {
			endIndex = scriptFrag.indexOf(')', offset);
			if (endIndex < 0)
				break;
			String col = scriptFrag.substring(offset, endIndex).trim();
			if(col.trim().startsWith("CONSTRAINT"))
				break;
			col = col.substring(0,col.indexOf(' '));
			tableNode.addColumn(col);
			offset = scriptFrag.indexOf(',',endIndex)+1;
			if(offset <= 0 ) break;
		}
//*		END : Searching columns in scriptFrag

		tableNode.changeCreateScript(scriptFrag);
		return tableNode;
	}
	
	public static void main(String[] args) {
		OracleReader reader = new OracleReader();
		TableNode node = reader.populateTableNode(scriptFrag);

		Set<String> keys = node.getPrimaryKeys();
		Set<String> cols = node.getColumns();
		cols.removeAll(keys);
		
		System.out.println("<========== Cols ===========>");
		for (String string : cols) {
			System.out.println(string);
		}
		System.out.println("<========== Primary Keys ===========>");
		for (String string : keys) {
			System.out.println(string);
		}
		
		
		
	}
	static String scriptFrag = "CREATE TABLE SCREEN_LAYOUT_ASSOC"+
                                    "(" +
                                    "  SCRN_LAYOUT_ASSOC_ID  NUMBER(9)               NOT NULL," +
                                    "  LAYOUT_ID             NUMBER(9)               NOT NULL," +
                                    "  ASSOC_LAYOUT_ID       NUMBER(9)," +
                                    "  TAB_ID                NUMBER(9)               NOT NULL," +
                                    "  TAB_ORD_NUM           NUMBER," +
                                    "  IS_DELETED_IND        CHAR(1 BYTE)            DEFAULT ('N')," +
                                    "  LST_UPDT_USRID        VARCHAR2(20 BYTE)," +
                                    "  LST_UPDT_DTM          DATE," +
                                    "  CONSTRAINT PK_SCREEN_LAYOUT_ASSOC" +
                                    " PRIMARY KEY" +
                                    " (SCRN_LAYOUT_ASSOC_ID)," +
                                    "  CONSTRAINT FK_SCREEN_LAYOUT_ASSOC_TAB5" +
                                    " FOREIGN KEY (TAB_ID)" +
                                    " REFERENCES TAB (TAB_ID)," +
                                    "  CONSTRAINT FK_SCREEN_LAYOUT_ASSOC_SCREE4" +
                                    " FOREIGN KEY (LAYOUT_ID)" +
                                    " REFERENCES SCREEN_LAYOUT (LAYOUT_ID)" +
                                    ")" +
                                    ";";
}
