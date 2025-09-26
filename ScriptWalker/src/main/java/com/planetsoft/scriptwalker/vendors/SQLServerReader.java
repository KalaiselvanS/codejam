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
public class SQLServerReader extends AbstractScriptReader {

	static {
		ReaderManager.registerReader("sqlserver", SQLServerReader.class);
	}

	@Override
	protected String getTableScriptDelim() {
		return "/";
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
		while (true) {
			endIndex = scriptFrag.indexOf(')', offset);
			String col = scriptFrag.substring(offset, endIndex).trim();
			col = col.substring(0,col.indexOf(' '));
			if(col.equalsIgnoreCase("CONSTRAINT"))
				break;
			tableNode.addColumn(col);
			offset = scriptFrag.indexOf(',',offset)+1;
			if(offset <= 0 ) break;
		}
//*		END : Searching columns in scriptFrag

		tableNode.changeCreateScript(scriptFrag);
		return tableNode;
	}
	
	public static void main(String[] args) {
		SQLServerReader reader = new SQLServerReader();
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
	static String scriptFrag = "	CREATE TABLE dbo.condition_t\n" +
		"	(\n" +
		"	    appl_cd                     CHAR(8) NOT NULL,\n" +
		"	    cond_id                     INT NOT NULL,\n" +
		"	    cond_typ_cd                 CHAR(8) NOT NULL,\n" +
		"	    cond_appl_cd                CHAR(8),\n" +
		"	    appl_data_src_cd            CHAR(8),\n" +
		"	    appl_tbl_nm                 CHAR(40),\n" +
		"	    cat_id                      INT NOT NULL,\n" +
		"	    cond_nm                     VARCHAR(100) NOT NULL,\n" +
		"	    cond_dsc                    VARCHAR(400),\n" +
		"	    cond_api_hshmap_ind         CHAR(1),\n" +
		"	    cond_api_java_nm            VARCHAR(100),\n" +
		"	    cond_api_meth_nm            VARCHAR(100),\n" +
		"	    cond_cche_data_ind          CHAR(1),\n" +
		"	    cond_full_view_txt          VARCHAR(4000),\n" +
		"	    is_active_ind               CHAR(1),\n" +
		"	    lst_updt_dtm                dbo.dom_lst_upd_dtm NOT NULL,\n" +
		"	    lst_updt_user_id            dbo.dom_lst_upd_user NOT NULL,\n" +
		"	    CONSTRAINT pk_condition_t PRIMARY KEY (appl_cd, cond_id),\n" +
		"	    CONSTRAINT fk_aptbl2 FOREIGN KEY (cond_appl_cd, appl_data_src_cd, appl_tbl_nm) REFERENCES dbo.appl_table_t (appl_cd, appl_data_src_cd, appl_tbl_nm),\n" +
		"	    CONSTRAINT fk_catg5 FOREIGN KEY (appl_cd, cat_id) REFERENCES dbo.category_t (appl_cd, cat_id),\n" +
		"	    CONSTRAINT fk_cndtp1 FOREIGN KEY (cond_typ_cd) REFERENCES dbo.condition_type_t (cond_typ_cd)\n" +
		"	)";
}
