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
	
	private static String queryInsert = "insert into item (item_id, item_name, unit_price, item_image, inventary, item_desription, status) values (?,?,?,?,?,?,?)";
	private static String queryInsertItemCategory = "insert into item_category (item_id, category_id, sub_category_id) values (?,?,?)";
	
	static String operation, item_id, item_name, unit_price, inventory, item_description, category_id, sub_category_id, status;
	
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
		 item_id=dto.getItem_id();
		 item_name=dto.getItem_name();
		 unit_price=dto.getUnit_price();
		 //image=dto.getImage();
		// image_stream = dto.getImage_stream();
		 inventory=dto.getInventory();
		 item_description=dto.getItem_description();
		 category_id=dto.getCategory_id();
		 sub_category_id=dto.getSub_category();
		 status = dto.getStatus();
		
		connection = ConnectionManager.getConnection();
		int result = 0;

			
		if(operation.equals("Add New Product")){
		
			addNewProd();
			additemCategory();
			
		}
		else{
			updateProduct();
		}
		

		return result;
	}
	
	
	private static int updateProduct() throws SQLException {
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
		
		int result = preparedStatement.executeUpdate();
		return result;
	}

	public static int addNewProd() throws SQLException{
		preparedStatement = connection.prepareStatement(queryInsert);
		
		preparedStatement.setString(1, item_id);
		preparedStatement.setString(2, item_name);
		preparedStatement.setString(3, unit_price);
		preparedStatement.setBinaryStream(4, image_stream,(int)image.length());
		preparedStatement.setString(5, inventory);
		preparedStatement.setString(6, item_description);
		preparedStatement.setString(7, status);
		
		int result = preparedStatement.executeUpdate();
		return result;
	}
	
	private static int additemCategory() throws SQLException {
		preparedStatement = connection.prepareStatement(queryInsertItemCategory);
		
		preparedStatement.setString(1, category_id);
		preparedStatement.setString(2, sub_category_id);
		preparedStatement.setString(3, item_id);
		preparedStatement.executeUpdate();
		
		int result = preparedStatement.executeUpdate();
		return result;
	}


}
