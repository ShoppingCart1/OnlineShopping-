package com.mivim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mivim.connection.ConnectionManager;

public class RemoveDAO {

	private static String query="update item set status=0 where item_id=?";
	private static Connection connection = null;
	private static PreparedStatement preparedStatement = null;
	public static int getRemoveItem(String item_id) throws SQLException {
		
		connection =ConnectionManager.getConnection();
		preparedStatement=connection.prepareStatement(query);
		preparedStatement.setString(1, item_id);
		int result=preparedStatement.executeUpdate();
		return result;
	}
	
	

}
