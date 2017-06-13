package com.mivim.services;

import java.sql.SQLException;

import com.mivim.dao.UserLoginDao;

public class LoginServices  {
	
	public static String getUserIdService(String username, String password) throws SQLException{
		String userId = UserLoginDao.getUserId(username, password);
		return userId;
	}
	
	public static String getRoleIdService(String userId) throws SQLException{
		String roleId = UserLoginDao.getRoleId(userId);
		return roleId;
	}
}