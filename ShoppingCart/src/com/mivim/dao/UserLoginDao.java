package com.mivim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mivim.connection.ConnectionManager;

public class UserLoginDao {
   static Connection con;
   
   public static String getUserId(String userName, String passWord) throws SQLException{
	   
	   con = ConnectionManager.getConnection();
	   String sqlgetUserId = "Select user_id from user where user_name=? and password=?";
	   String userid = null;
	   PreparedStatement pstmt= con.prepareStatement(sqlgetUserId);
	   pstmt.setString(1, userName);
	   pstmt.setString(2, passWord);
	   ResultSet rs = pstmt.executeQuery();
	   
	   while(rs.next()){

		    userid = rs.getString(1);
	   }
	   
	   return userid;
   }
   
   public static String getRoleId(String userId) throws SQLException{
	   
	   con = ConnectionManager.getConnection();
	   String sqlgetRoleId = "Select role_id from userrole where user_id=?";
	   String roleid = null;
	   PreparedStatement pstmt= con.prepareStatement(sqlgetRoleId);
	   pstmt.setString(1, userId);
	   ResultSet rs = pstmt.executeQuery();
	   
	   while(rs.next()){

		    roleid = rs.getString(2);
	   }
	   
	   return roleid;	   
   }
}