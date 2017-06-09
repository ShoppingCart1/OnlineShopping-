package com.mivim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mivim.connection.ConnectionManager;
import com.mivim.dto.AdminDTO;

public class UtilUpdateDAO {

	private static String query="Select i.item_id,i.item_name,i.unit_price,i.inventary,i.item_description,ic.id,ic.sub_category_id from item i join item_category ic using(item_id) where i.item_id=?";

	private static Connection connection=null;
	private static PreparedStatement preparedStatement=null;
	private static ResultSet resultSet=null;
	public static AdminDTO getUpdateDetails(String item_id) throws SQLException {
		
		System.out.println("utilUpdateDao");
		
		AdminDTO adminDTO = new AdminDTO();
		connection=ConnectionManager.getConnection();
		preparedStatement=connection.prepareStatement(query);
		preparedStatement.setString(1, item_id);
		resultSet=preparedStatement.executeQuery();
		
		if(resultSet.next())
		{

			String itemId=resultSet.getString("item_id");
			String itemName=resultSet.getString("item_name");
			String unitPrice=resultSet.getString("unit_price");
			String inventary=resultSet.getString("inventary");
			String itemDescription=resultSet.getString("item_description");
			String categoryId=resultSet.getString("id");
			String subCategoryId=resultSet.getString("sub_category_id");
			
			adminDTO.setItem_id(itemId);
			adminDTO.setItem_name(itemName);
			adminDTO.setUnit_price(unitPrice);
			adminDTO.setInventory(inventary);
			adminDTO.setItem_description(itemDescription);
			adminDTO.setCategory_id(categoryId);
			adminDTO.setSub_category(subCategoryId);

		}
		
		return adminDTO;
	}

}
