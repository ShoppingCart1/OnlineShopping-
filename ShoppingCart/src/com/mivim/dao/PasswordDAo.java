package com.mivim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mivim.connection.ConnectionManager;
import com.mivim.dto.PasswordDto;

public class PasswordDAo {
	
	private static Connection connection=null;
	private static PreparedStatement preparedStatement=null;
	private static ResultSet resultSet=null;
	private static String query="Select user_id,password,email from user where email=?";
	private static String password=null;
	private static String userId=null;
	private static String email=null;

	public static PasswordDto getPasswordDAO(String email) throws SQLException {
		
		PasswordDto passwordDto=new PasswordDto();
		connection=ConnectionManager.getConnection();
		preparedStatement=connection.prepareStatement(query);
		preparedStatement.setString(1, email);
		resultSet=preparedStatement.executeQuery();
		if(resultSet.next())
		{
			userId=resultSet.getString(1);
			password=resultSet.getString(2);
			email=resultSet.getString(3);
			passwordDto.setUserId(userId);
			passwordDto.setPassword(password);
			passwordDto.setEmail(email);
			
		}
		return passwordDto;
	}

}
