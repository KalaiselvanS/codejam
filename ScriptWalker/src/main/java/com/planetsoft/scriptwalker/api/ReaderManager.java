package com.planetsoft.scriptwalker.api;

import java.util.HashMap;
import java.util.Map;
/**
 * 
 * @author kalaiselvans
 *
 */
public class ReaderManager {

    private static Map<String, Class<? extends ScriptReader>> readers = new HashMap<String, Class<? extends ScriptReader>>();

    public static void registerReader(
	    String readerLocator, Class<? extends ScriptReader> scriptReader) {
	readers.put(readerLocator, scriptReader);
    }

    public static ScriptReader getReader(String dbType){
	try {
	    return readers.get(dbType).newInstance();
	} catch (InstantiationException e) {
	    e.printStackTrace();
	} catch (IllegalAccessException e) {
	    e.printStackTrace();
	}
	return null;
    }
    
}
