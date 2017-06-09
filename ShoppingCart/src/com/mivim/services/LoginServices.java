package com.mivim.services;

import java.sql.SQLException;

import com.mivim.dao.UserLoginDao;

public class LoginServices {
	
	public static String getUserIdService(String name, String password) throws SQLException{
		String userId = UserLoginDao.getUserId(name, password);
		return userId;
	}
	
	public static String getRoleIdService(String userId) throws SQLException{
		String roleId = UserLoginDao.getRoleId(userId);
		return roleId;
	}
}
