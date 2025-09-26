package com.planetsoft.scriptwalker.api;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.nio.channels.ReadableByteChannel;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 * 
 * @author kalaiselvans
 * 
 */
public abstract class AbstractScriptReader implements ScriptReader {

	private Map<String, TableNode> container = new HashMap<String, TableNode>();

	protected abstract String getTableScriptDelim();

	protected abstract TableNode populateTableNode(String createScript);

	public TableNode lookUpNode(String tableName) {
		// tableName = tableName.toLowerCase().trim();
		TableNode lookingUpNode = null;
		if (container.containsKey(tableName)) {
			lookingUpNode = container.get(tableName);
		} else {
			lookingUpNode = new TableNode(tableName);
			container.put(tableName, lookingUpNode);
		}
		return lookingUpNode;
	}

	private Map<String, TableNode> readScript(Scanner scanner) {
		String delim = getTableScriptDelim();
		scanner.useDelimiter(delim);
		while (scanner.hasNext()) {
			String script = scanner.next().trim();
			if (script.length() <= 0)
				break;
			StringBuilder builder = new StringBuilder();
			Scanner scanner2 = new Scanner(script);
			scanner2.useDelimiter("\n");
			boolean comment = false;
			while (scanner2.hasNext()) {
				String next = scanner2.next();
				if (next.startsWith("--")) {
					comment = true;
					builder.append(next);
				} else {
					builder.append(next);
				}
			}
			if (comment){
				script = builder.toString();
			}
			if (script.length() <= 0){
				break;
			}
			TableNode tableNode = populateTableNode(script);
			if (tableNode != null)
				container.put(tableNode.getTableName(), tableNode);
		}
		return container;
	}

	public Map<String, TableNode> readScript(String file)
			throws FileNotFoundException {
		return readScript(new File(file));
	}

	public Map<String, TableNode> readScript(File file)
			throws FileNotFoundException {
		Scanner scanner = new Scanner(file);
		return readScript(scanner);
	}

	public Map<String, TableNode> readScript(InputStream inputStream) {
		Scanner scanner = new Scanner(inputStream);
		return readScript(scanner);
	}

	public Map<String, TableNode> readScriptContent(String script) {
		Scanner scanner = new Scanner(script);
		return readScript(scanner);
	}

	public Map<String, TableNode> readScript(Readable readable) {
		return readScript(new Scanner(readable));
	}

	public Map<String, TableNode> readScript(
			ReadableByteChannel readableByteChannel) {
		return readScript(new Scanner(readableByteChannel));
	}

	public Map<String, TableNode> readScript(File file, String charsetName)
			throws FileNotFoundException {
		return readScript(new Scanner(file, charsetName));
	}

	public Map<String, TableNode> readScript(InputStream inputStream,
			String charsetName) {
		return readScript(new Scanner(inputStream, charsetName));
	}

	public Map<String, TableNode> readScript(
			ReadableByteChannel readableByteChannel, String charsetName) {
		return readScript(new Scanner(readableByteChannel, charsetName));
	}

}
