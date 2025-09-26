package com.planetsoft.scriptwalker;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

/**
 * This is a utility class to create an input stream from resource name It also
 * provides method to copy streams
 * 
 */
public class StreamUtil
{
  public static final String CLASSPATH_PREFIX = "classpath:";

  /**
   * Method to get input stream from name
   * 
   * @param fileName
   *          file name
   * @return input stream
   * @throws IOException
   */
  public static InputStream getInputStream(String fileName) throws IOException
  {

    if (fileName.startsWith(CLASSPATH_PREFIX))
    {
      fileName = fileName.substring(CLASSPATH_PREFIX.length());
      return Thread.currentThread().getContextClassLoader()
          .getResourceAsStream(fileName);
    }
    else if ((fileName.indexOf(":") != -1) || (fileName.indexOf("/") != -1)
        || (fileName.indexOf("\\") != -1))
    {
      return new FileInputStream(fileName);
    }
    else
    {
      return Thread.currentThread().getContextClassLoader()
          .getResourceAsStream(fileName);
    }

  }

  /**
   * Method to read contents of a file
   * 
   * @param fileName
   *          name of file
   * @return String content of file
   * @throws IOException
   */
  public static String getContent(String fileName) throws IOException
  {
    return new String(getContentAsBytes(fileName));
  }

  /**
   * Method to read contents of a stream
   * 
   * @param is
   *          Input Stream
   * @return String content of file
   * @throws IOException
   */
  public static String getContent(InputStream is) throws IOException
  {
    String result = null;
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    copyStream(is, baos, false);
    result = new String(baos.toByteArray());
    baos.close();
    return result;
  }
  
  /**
   * Method to read contents of a file
   * @param fileName name of file
   * @return byte[] content of file
   * @throws IOException
   */
  public static byte[] getContentAsBytes(String fileName) throws IOException 
  {
    InputStream in = null;
    ByteArrayOutputStream baos = null;

    in = getInputStream(fileName);
    baos = new ByteArrayOutputStream();
    copyStream(in, baos, true);

    return baos.toByteArray();
  }  
  
  /**
   * Method to download from a url
   * 
   * @param url
   *          download url
   * @return 
   *          URL contents as string
   * @throws IOException
   */
  public static String getContentFromURL(String url) throws IOException
  {
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    downloadFromURL(url, baos);
    return new String(baos.toByteArray());
  }

  /**
   * Method to download from a url
   * 
   * @param url
   *          download url
   * @param out
   *          output stream to write to
   * @throws IOException
   */
  public static void downloadFromURL(String url, OutputStream out)
      throws IOException
  {
    URL u = new URL(url);
    copyStream(u.openStream(), out, true);
  }

  /**
   * Method set proxy details
   * 
   * @param proxyHost
   *          ip of proxy server
   * @param proxyPort
   *          port of proxy server
   */
  public static void setProxy(String proxyHost, String proxyPort)
  {
    System.setProperty("proxySet", "true");
    System.setProperty("proxyHost", proxyHost);
    System.setProperty("proxyPort", proxyPort);
  }

  /**
   * Method to copy stream
   * 
   * @param in
   *          input stream
   * @param out
   *          output stream
   * @throws IOException
   */
  public static void copyStream(InputStream in, OutputStream out)
      throws IOException
  {
    copyStream(in, out, false);
  }

  /**
   * Method to copy stream
   * 
   * @param in
   *          input stream
   * @param out
   *          output stream
   * @param closeStreams
   *          if true streams will be closed
   * @throws IOException
   */
  public static void copyStream(InputStream in, OutputStream out,
      boolean closeStreams) throws IOException
  {
    byte[] chunk = new byte[1024];
    int bytesRead = 0;
    BufferedInputStream bis = null;
    BufferedOutputStream bos = null;

    try
    {
      bis = new BufferedInputStream(in);
      bos = new BufferedOutputStream(out);

      while ((bytesRead = bis.read(chunk)) > 0)
        bos.write(chunk, 0, bytesRead);

      bos.flush();
    }
    finally
    {
      if (closeStreams)
      {
        if (bis != null)
        {
          bis.close();
        }

        if (bos != null)
        {
          bos.close();
        }
      }// end if close streams

    }

  }

}
