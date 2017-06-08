package com.mivim.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mivim.connection.ConnectionManager;
import com.mivim.dto.AdminDTO;

public class UpadteDAO {

	private static String query = "UPDATE item i,item_category ic set " + "i.item_name=?," + "i.unit_price=?,"
			+ "i.item_image=?," + "i.inventory=?," + "i.item_description=?," + "ic.id=?," + "ic.sub_category=?"
			+ "where i.item_id=?" + " and ic.item_id=?";

	private static String queryInsert = "insert into item (item_id, item_name, unit_price, item_image, inventary, item_description, status) values (?,?,?,?,?,?,?)";
	private static String queryInsertItemCategory = "insert into item_category (item_id, id, sub_category_id) values (?,?,?)";

	static String operation;
	static String item_id;
	static String item_name;
	static String unit_price;
	static String inventory;
	static String item_description;
	static String category_id;
	static String sub_category_id;
	static String statusCode;

	static FileInputStream image_stream;
	static File image;

	private static Connection connection = null;
	private static PreparedStatement preparedStatement = null;

	/*
	 * This is method for Database Operation
	 */
	public static int getUpdateDAO(AdminDTO dto) throws SQLException {

		/*
		 * Getting updated values uing dto obj
		 */
		operation = dto.getOperation();
		item_id = dto.getItem_id();
		item_name = dto.getItem_name();
		unit_price = dto.getUnit_price();
		image = dto.getImage();
		image_stream = dto.getImage_stream();
		inventory = dto.getInventory();
		item_description = dto.getItem_description();
		category_id = dto.getCategory_id();
		sub_category_id = dto.getSub_category();
		statusCode = dto.getStatus();
		
		System.out.println(operation);
		System.out.println(item_id);
		System.out.println(item_name);
		System.out.println(unit_price);
		System.out.println(inventory);
		System.out.println(item_description);
		System.out.println(category_id);
		System.out.println(sub_category_id);
		System.out.println(statusCode);

		connection = ConnectionManager.getConnection();
		int result=0;
		int result1 = 0;
		int result2 = 0;

		if (operation.equals("Additem")) {

			result1=addNewItem();
			result2=additemCategory();
			if(result1!=0 && result2!=0)
				result=1;

		} else {
			updateItem();
		}

		return result;
	}

	private static int updateItem() throws SQLException {
		preparedStatement = connection.prepareStatement(query);

		preparedStatement.setString(1, item_name);
		preparedStatement.setString(2, unit_price);
		preparedStatement.setBinaryStream(3, image_stream, (int) image.length());
		preparedStatement.setString(4, inventory);
		preparedStatement.setString(5, item_description);
		preparedStatement.setString(6, category_id);
		preparedStatement.setString(7, sub_category_id);
		preparedStatement.setString(8, item_id);
		preparedStatement.setString(9, item_id);

		int result = preparedStatement.executeUpdate();
		return result;
	}

	public static int addNewItem() throws SQLException {
		preparedStatement = connection.prepareStatement(queryInsert);
		System.out.println(item_id);
		preparedStatement.setString(1, item_id);
		preparedStatement.setString(2, item_name);
		preparedStatement.setString(3, unit_price);
		preparedStatement.setBinaryStream(4, image_stream, (int) image.length());
		preparedStatement.setString(5, inventory);
		preparedStatement.setString(6, item_description);
		preparedStatement.setString(7, statusCode);

		int result = preparedStatement.executeUpdate();
		return result;
	}

	private static int additemCategory() throws SQLException {
		preparedStatement = connection.prepareStatement(queryInsertItemCategory);
		System.out.println(item_id);
		preparedStatement.setString(1, item_id);
		preparedStatement.setString(2, category_id);
		preparedStatement.setString(3, sub_category_id);
		
		

		int result = preparedStatement.executeUpdate();
		return result;
	}

}
