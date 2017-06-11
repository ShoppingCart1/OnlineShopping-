package com.mivim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mivim.connection.ConnectionManager;

public class UserLoginDao {
	
	static Connection con;
	
	
  
	public static String getUserId(String userName, String passWord) throws SQLException {
	   String getUserIdQueury = "select * from users where user_name=? and pass_word=?";
		
	   String user_id = null;
	   con = ConnectionManager.getConnection();
	   PreparedStatement pstmt= con.prepareStatement(getUserIdQueury);
	   pstmt.setString(1, userName);
	   pstmt.setString(2, passWord);
	   ResultSet rs = pstmt.executeQuery();
	   
	   while(rs.next()){
		   
		   user_id = rs.getString(1);
		   
	   }

	   return user_id;   
	}

   public static String getRoleId(String userId) throws SQLException {
	   String getRoleIdQueury = "select role_id from user_roles where user_id=?";
	   String role_id = null;
	   con = ConnectionManager.getConnection();
	   PreparedStatement pstmt= con.prepareStatement(getRoleIdQueury);
	   pstmt.setString(1, userId);
	   ResultSet rs = pstmt.executeQuery();
	   
	   while(rs.next()){
		   
		   role_id = rs.getString(1);
		   
	   }

	   return role_id;   
   }
}
