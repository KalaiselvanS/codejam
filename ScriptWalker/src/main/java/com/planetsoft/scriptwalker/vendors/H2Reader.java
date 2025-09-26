package com.planetsoft.scriptwalker.vendors;

import com.planetsoft.scriptwalker.StringUtil;
import com.planetsoft.scriptwalker.api.AbstractScriptReader;
import com.planetsoft.scriptwalker.api.ReaderManager;
import com.planetsoft.scriptwalker.api.TableNode;

/**
 * 
 * @author kalaiselvans
 * 
 */
public class H2Reader extends AbstractScriptReader {

	static {
		ReaderManager.registerReader("h2", H2Reader.class);
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
		int offset = StringUtil.indexOfIgnoreCase(scriptFrag, "TABLE");
		if (offset < 0)
			return null;
		offset += 5;
		int endIndex = scriptFrag.indexOf("add ", offset);
		if (endIndex < 0)
			endIndex = scriptFrag.indexOf("(", offset);
		if (endIndex < 0)
			endIndex = scriptFrag.indexOf("\n", offset);
		if (endIndex < 0)
			return null;
		tableName = scriptFrag.substring(offset, endIndex).replace('`', ' ')
				.trim();
		TableNode tableNode = super.lookUpNode(tableName.toLowerCase());

		offset = StringUtil.indexOfIgnoreCase(scriptFrag, "references");
		while (offset > 0) {
			endIndex = 0;
			offset += 10;
			endIndex = scriptFrag.indexOf("(", offset);
			parent = scriptFrag.substring(offset, endIndex).replace('`', ' ')
					.trim();
			parentNode = super.lookUpNode(parent.toLowerCase());
			tableNode.addParent(parentNode);
			offset = StringUtil.indexOfIgnoreCase(scriptFrag, "references",
					endIndex);
		}

		// 
		offset = 0;
		offset = StringUtil.indexOfIgnoreCase(scriptFrag, "primary key");
		while (offset > 0) {
			offset = scriptFrag.indexOf("(", offset) + 1;
			endIndex = scriptFrag.indexOf(")", offset);
			String key = scriptFrag.substring(offset, endIndex).replace('`',
					' ').replace(" ", "");
			tableNode.addPrimaryKey(key);
		}
		tableNode.changeCreateScript(scriptFrag);
		return tableNode;
	}

	public static void main(String[] args) {
		int offset = createScript.indexOf("REFERENCES");
		int endIndex;
		while (offset != -1) {
			offset += 10;
			endIndex = createScript.indexOf("(", offset);
			String parent = createScript.substring(offset, endIndex).replace(
					'`', ' ').trim();
			System.out.println(parent);
			offset = createScript.indexOf("REFERENCES", endIndex);
		}
	}

	static String createScript = "CREATE TABLE `case_reqt` ("
			+ "\nCONSTRAINT `fk_case_reqt_app_case` FOREIGN KEY (`case_id`) REFERENCES `app_case` (`case_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,"
			+ "\nCONSTRAINT `fk_case_reqt_collection_method` FOREIGN KEY (`coll_meth_cd`) REFERENCES `collection_method` (`coll_meth_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,"
			+ "\nCONSTRAINT `fk_case_reqt_pclient` FOREIGN KEY (`pcli_id`) REFERENCES `pclient` (`pcli_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,"
			+ "\nCONSTRAINT `fk_case_reqt_vendor_mgmt` FOREIGN KEY (`vendor_mgmt_id`) REFERENCES `vendor_mgmt` (`vendor_mgmt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,"
			+ "\nCONSTRAINT `fk__case_reqt__gen_c__615232dc` FOREIGN KEY (`gen_catpro_cd`) REFERENCES `gen_from_cat` (`gen_catpro_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,"
			+ "\nCONSTRAINT `fk__case_reqt__reqt___633a7b4e` FOREIGN KEY (`reqt_id`) REFERENCES `requirement` (`reqt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,"
			+ "\nCONSTRAINT `fk__case_reqt__reqt___642e9f87` FOREIGN KEY (`reqt_stat_cd`) REFERENCES `reqt_status` (`reqt_stat_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION,"
			+ "\nCONSTRAINT `fk__case_reqt__reqt___6522c3c0` FOREIGN KEY (`reqt_cat_cd`) REFERENCES `reqt_category` (`reqt_cat_cd`) ON DELETE NO ACTION ON UPDATE NO ACTION"
			+ "\n) ENGINE=InnoDB DEFAULT CHARSET=latin1";

}
