package com.planetsoft.scriptwalker;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class StringUtil {
    
    static String fileName = "test.txt";
    
    public static void main(String[] args) throws IOException {
	String contentScript = StreamUtil.getContent(fileName);
	
	for (String string : searchHrefLinks(contentScript)) {
	    System.out.println(string);
	}
	
	System.err.println(searchHrefLinks(contentScript));
    }
    
    public static List<String> searchHrefLinks(String contentScript) throws IOException {
	List<String> list = new ArrayList<String>();
	int endIndex = contentScript.length();	
	for (int fromIndex = 0; fromIndex < endIndex; fromIndex++) {
	    fromIndex = indexOfIgnoreCase(contentScript, "href", fromIndex);
	    if(fromIndex < 0)return list;
	    int toIndex = indexOfIgnoreCase(contentScript, ">", fromIndex);;
	    String urlString = subStringOfIgnoreTagCase(contentScript, "\"", "\"", fromIndex, toIndex);
	    if(urlString == null)
		urlString = subStringOfIgnoreTagCase(contentScript, "'", "'", fromIndex, toIndex);
	    list.add(urlString);
	}
	return list;
    }

    public static String subStringOfIgnoreTagCase(String contentScript, String startTag,
	    String endTag, int fromIndex, int toIndex) {
	int beginIndex = 0;
	int endIndex = 0;
	String subString = null;
	beginIndex = indexOfIgnoreCase(contentScript, startTag, fromIndex, toIndex);
	if(beginIndex < 0) return subString;
	endIndex = indexOfIgnoreCase(contentScript, endTag, beginIndex+1, toIndex);
	if(endIndex < 0) return subString;
	return contentScript.substring(beginIndex+1, endIndex);
    }
    
    public static int indexOfIgnoreCase(String contentScript, String search,
	    int fromIndex, int toIndex) {
	int n1 = contentScript.length(), n2 = search.length();
	for (int i = fromIndex; i < n1 && i < toIndex; i++) {
	    int i2 = 0;
	    int i1 = i;
	    for (i2 = 0; i2 < n2 && i1 < n1; i2++, i1++) {
		char c1 = contentScript.charAt(i1);
		char c2 = search.charAt(i2);
		if (c1 == c2)
		    continue;
		c1 = Character.toLowerCase(c1);
		c2 = Character.toLowerCase(c2);
		if (c1 != c2) {
		    break;
		}
	    }
	    if (i2 == n2)
		return i;
	}
	return -1;
    }
    
    public static int indexOfIgnoreCase(String contentScript, String search,
	    int fromIndex) {
	return indexOfIgnoreCase(contentScript, search, fromIndex, contentScript.length());
    }

    public static int indexOfIgnoreCase(String contentScript, String string) {
	return indexOfIgnoreCase(contentScript, string, 0);
    }
}
