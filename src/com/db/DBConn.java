package com.db;
import java.sql.*;
public class DBConn{
	public DBConn(){}
	private static Connection conn = null;
	private static ResultSet rs = null;
	private static String server = "localhost"; 
	private static String port = "3306";  
	private static String db = "view";  
	private static String user = "root"; 
	private static String pass = "123456";
	private static String drivername="com.mysql.jdbc.Driver"; //mysql driver
	private static String URL="jdbc:mysql://"+server+":"+port+"/"+db+"?useUnicode=true&characterEncoding=GBK&user="+user+"&password="+pass;

	public static Connection getConn(){  //get database connection
	   try{
	    Class.forName(drivername); //载入驱动器
	    conn = DriverManager.getConnection(URL);
	   }
	   catch(Exception e){
	    e.printStackTrace();
	   }
	    return conn ;
	  }
	 public static ResultSet executeSQL(String str) {
		   try{
		    Statement stmt = conn.createStatement(); //语句接口
		    rs = stmt.executeQuery(str);  //获得结果集
		  }
		   catch(Exception e){
		    e.printStackTrace();
		   }
		    return rs;
		  } 
	 }