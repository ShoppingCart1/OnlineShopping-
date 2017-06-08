package com.mivim.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mivim.connection.ConnectionManager;
import com.mivim.dto.AdminDTO;

public class UpadteDAO {

	private static String query = "";
	

	private static Connection connection = null;
	private static PreparedStatement preparedStatement = null;

	/*
	 * This is method for Database Operation
	 */
	public static int getUpdateDAO(AdminDTO dto) throws SQLException {
		
		/*
		 * Getting updated values uing dto obj
		 */
		String item_id=dto.getItemId();
		String item_name=dto.getItemName();
		String unit_price=dto.getUnitPrice();
		File image=dto.getImage();
		FileInputStream image_stream=dto.getImageStream();
		String inventory=dto.getInventory();
		String item_description=dto.getItemDescription();
		String category_id=dto.getCategoryId();
		String sub_category_id=dto.getSubCategoryId();
		String statusCode=dto.getStatusCode();
		
		int result = 0;
		
		/*
		 * Here Execute SQL queries
		 */
		connection = ConnectionManager.getConnection();
		preparedStatement = connection.prepareStatement(query);
		
		preparedStatement.setString(1, item_name);
		preparedStatement.setString(2, unit_price);
		preparedStatement.setBinaryStream(3, image_stream,(int)image.length());
		preparedStatement.setString(4, inventory);
		preparedStatement.setString(5, item_description);
		preparedStatement.setString(6, category_id);
		preparedStatement.setString(7, sub_category_id);
		preparedStatement.setString(8, item_id);
		preparedStatement.setString(9, item_id);
		result = preparedStatement.executeUpdate();

		return result;
	}

}
