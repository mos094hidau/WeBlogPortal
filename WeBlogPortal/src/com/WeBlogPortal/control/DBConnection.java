package com.WeBlogPortal.control;

import java.sql.Connection;
import java.sql.DriverManager;

public  class DBConnection {
	public static Connection con;
	public static Connection getConnection(){
		
		try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","WeBlogPortal","root");
	    }catch(Exception e){
	        e.printStackTrace();
	        System.out.println(e);
	    }
		return con;	
 }	
}


