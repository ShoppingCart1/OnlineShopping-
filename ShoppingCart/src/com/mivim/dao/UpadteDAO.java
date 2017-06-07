package com.mivim.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mivim.connection.ConnectionManager;
import com.mivim.dto.AdminDTO;

public class UpadteDAO {

	private static String query = "UPDATE item i,item_category ic set "
									+ "i.item_name=?,"
									+ "i.unit_price=?,"
									+ "i.item_image=?,"
									+ "i.inventory=?,"
									+ "i.item_description=?,"
									+ "ic.id=?,"
									+ "ic.sub_category=?"
									+ "where i.item_id=?"
									+ " and ic.item_id=?";
	

	private static Connection connection = null;
	private static PreparedStatement preparedStatement = null;

	/*
	 * This is method for Database Operation
	 */
	public static int getUpdateDAO(AdminDTO dto) throws SQLException {
		
		/*
		 * Getting updated values uing dto obj
		 */
		String item_id=dto.getItem_id();
		String item_name=dto.getItem_name();
		String unit_price=dto.getUnit_price();
		File image=dto.getImage();
		FileInputStream image_stream=dto.getImage_stream();
		String inventory=dto.getInventory();
		String item_description=dto.getItem_description();
		String category_id=dto.getCategory_id();
		String sub_category_id=dto.getSub_category();
		
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
