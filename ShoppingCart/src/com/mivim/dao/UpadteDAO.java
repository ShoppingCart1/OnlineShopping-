package com.mivim.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

import com.mivim.connection.ConnectionManager;
import com.mivim.dto.AdminDTO;

public class UpadteDAO {

	private static String queryUpdate = "{call itemUpdateProcedure(?,?,?,?,?,?,?)}";

	private static String queryInsert = "insert into item (item_id,item_name, unit_price, inventary, item_description, status) values (?,?,?,?,?,?)";
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
	static String uuid;

	private static Connection connection = null;
	private static PreparedStatement preparedStatement = null;
	private static CallableStatement callableStatement=null;

	/*
	 * This is method for Database Operation
	 */
	public static int getUpdateDAO(AdminDTO dto) throws SQLException {

		/*
		 * Getting updated values uing dto obj
		 */
		operation = dto.getOperation();
		item_id=dto.getItem_id();
		item_name = dto.getItem_name();
		unit_price = dto.getUnit_price();
		inventory = dto.getInventory();
		item_description = dto.getItem_description();
		category_id = dto.getCategory_id();
		sub_category_id = dto.getSub_category();
		statusCode = dto.getStatus();
		uuid=generateUUuid();
		
		System.out.println(operation);
		System.out.println(item_id);
		System.out.println(item_name);
		System.out.println(unit_price);
		System.out.println(inventory);
		System.out.println(item_description);
		System.out.println(category_id);
		System.out.println(sub_category_id);
		System.out.println(statusCode);
		System.out.println(uuid);

		connection = ConnectionManager.getConnection();
		int result=0;
		int result1 = 0;
		int result2 = 0;

		if (operation.equals("AddItem")) {

			result1=addNewItem();
			result2=additemCategory();
			if(result1!=0 && result2!=0)
				result=1;

		} else {
			result=updateItem();
		}

		return result;
	}

	private static int updateItem() throws SQLException {
		
		callableStatement=connection.prepareCall(queryUpdate);
		callableStatement.setString(1, item_id);
		callableStatement.setString(2, item_name);
		callableStatement.setString(3, unit_price);
		callableStatement.setString(4, inventory);
		callableStatement.setString(5, item_description);
		callableStatement.setString(6, category_id);
		callableStatement.setString(7, sub_category_id);
		int result = callableStatement.executeUpdate();
		System.out.println(result);
		return result;
	}

	public static int addNewItem() throws SQLException {
		preparedStatement = connection.prepareStatement(queryInsert);
		
		preparedStatement.setString(1, uuid);
		preparedStatement.setString(2, item_name);
		preparedStatement.setString(3, unit_price);
		preparedStatement.setString(4, inventory);
		preparedStatement.setString(5, item_description);
		preparedStatement.setString(6, statusCode);
	
		int result = preparedStatement.executeUpdate();
		return result;
	}

	private static int additemCategory() throws SQLException {
		preparedStatement = connection.prepareStatement(queryInsertItemCategory);
		
		preparedStatement.setString(1, uuid);
		preparedStatement.setString(2, category_id);
		preparedStatement.setString(3, sub_category_id);
		int result = preparedStatement.executeUpdate();
		return result;
	}
	
	public static String generateUUuid() {
		String uuid = UUID.randomUUID().toString();
		return uuid;
	}

}
