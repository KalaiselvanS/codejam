package com.planetsoft.scriptwalker.api;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.nio.channels.ReadableByteChannel;
import java.util.Map;
/**
 * 
 * @author kalaiselvans
 *
 */
public interface ScriptReader {

    public Map<String,TableNode> readScriptContent(String script);
    
    public Map<String,TableNode> readScript(String fileName) throws FileNotFoundException;
    public Map<String,TableNode> readScript(Readable readable);
    public Map<String,TableNode> readScript(File file) throws FileNotFoundException;
    public Map<String,TableNode> readScript(InputStream inputStream);
    public Map<String,TableNode> readScript(ReadableByteChannel readableByteChannel);
    public Map<String,TableNode> readScript(File file, String charsetName) throws FileNotFoundException;
    public Map<String,TableNode> readScript(InputStream inputStream, String charsetName);
    public Map<String,TableNode> readScript(ReadableByteChannel readableByteChannel, String charsetName);
    
}
