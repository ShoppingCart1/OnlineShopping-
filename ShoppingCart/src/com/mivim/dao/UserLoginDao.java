package com.mivim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mivim.connection.ConnectionManager;

public class UserLoginDao {
	static Connection con;
   public static boolean loginCheck(String userName, String passWord) throws SQLException{
	   con = ConnectionManager.getConnection();
	   String sqlLogin = "Select * from user where user_name=? and password=?";
	   PreparedStatement pstmt= con.prepareStatement(sqlLogin);
	   pstmt.setString(1, userName);
	   pstmt.setString(2, passWord);
	   ResultSet rs = pstmt.executeQuery();
	   while(rs.next()){
		   String usrName = rs.getString(2);
		   String pasWord = rs.getString(3);
		   if((usrName.equals(userName))&&(pasWord.equals(passWord))){
			   return true;
		   }
	   }
	   
	   //...................both are working........................
	   
//	   String sqlLogin = "Select * from user_login";
//
//	   Statement stmt=con.createStatement();
//	   ResultSet rs = stmt.executeQuery(sqlLogin);
//	   while(rs.next()){
//		   String usrNamedb = rs.getString(1);
//		   String pasWorddb = rs.getString(2);
//		   if((usrNamedb.equals(userName))&&(pasWorddb.equals(passWord))){
//			   return true;
//		   }
//	   }
	   
	   return false;
	   
   }
}
