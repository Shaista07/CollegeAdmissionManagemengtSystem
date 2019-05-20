package com.pack.Util;
import java.sql.Connection;
import java.sql.DriverManager;



public class DBUtil {
public static Connection getConnection(){
	Connection con=null;
	try{  
		Class.forName("com.mysql.jdbc.Driver");  
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/admission","root","password1$");  
	}catch(Exception ex){System.out.println(ex);}
	return con;
}
}