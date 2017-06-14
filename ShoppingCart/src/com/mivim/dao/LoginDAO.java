package com.mivim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mivim.connection.ConnectionManager;
import com.mivim.dto.ItemDto;
import com.mivim.dto.LoginDto;

public class LoginDAO {

	private static String query = "select role,(select username from user"
			+ " where (user_id= ? or email=?) and password= ?) as username,"
			+ "(select user_id from user"
			+ " where (user_id= ? or email=?) and password= ?) as userId from roles "
			+ "where role_id= (select role_id from user_role where user_id="
			+ "(select user_id from user where (user_id=? or email=?) and password=?))";

	private static String queryForItem = "select i.item_id, i.item_name, i.unit_price, " + "i.inventary,"
			+ " i.item_description," + "ic.id," + " ic.sub_category_id"
			+ " from item i join item_category ic using(item_id) where i.status = 1";
	private static Connection connection = null;
	private static PreparedStatement preparedStatement = null;
	private static ResultSet resultSet = null;
	private static String name = null;
	private static String role = null;
	private static String userId=null;

	public static LoginDto getLoginDAO(LoginDto loginDto) throws SQLException {

		String username = loginDto.getUsername();
		String password = loginDto.getPassword();

		System.out.println(username);
		System.out.println(password);

		LoginDto dto = new LoginDto();

		connection = ConnectionManager.getConnection();
		preparedStatement = connection.prepareStatement(query);
		preparedStatement.setString(1, username);
		preparedStatement.setString(2, username);
		preparedStatement.setString(3, password);
		preparedStatement.setString(4, username);
		preparedStatement.setString(5, username);
		preparedStatement.setString(6, password);
		preparedStatement.setString(7, username);
		preparedStatement.setString(8, username);
		preparedStatement.setString(9, password);
		
		resultSet = preparedStatement.executeQuery();
		if (resultSet.next()) {
			System.out.println("resultSet is fine");
			name = resultSet.getString("username");
			role = resultSet.getString("role");
			userId=resultSet.getString("userId");
			dto.setUsername(name);
			dto.setRole(role);
			dto.setUserId(userId);
		}
		connection.close();
		preparedStatement.close();
		resultSet.close();
		return dto;

	}

	public static List<ItemDto> getItemDetailsDAO() throws SQLException {

		List<ItemDto> listDto=new ArrayList<ItemDto>();
		connection = ConnectionManager.getConnection();
		preparedStatement = connection.prepareStatement(queryForItem);
		resultSet=preparedStatement.executeQuery();
		while(resultSet.next())
		{
			ItemDto dto=new ItemDto();
			dto.setItemId(resultSet.getString("item_id"));
			dto.setItemName(resultSet.getString("item_name"));
			dto.setUnitPirce(resultSet.getString("unit_price"));
			dto.setInventary(resultSet.getString("inventary"));
			dto.setItemDescription(resultSet.getString("item_description"));
			dto.setCategoryId(resultSet.getString("id"));
			dto.setSubCategoryId(resultSet.getString("sub_category_id"));
			listDto.add(dto);		
		}

		return listDto;
	}

}
