package com.mivim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mivim.connection.ConnectionManager;
import com.mivim.dto.AdminDTO;
import com.mivim.dto.CategoriesDto;

public class UtilDAO {
	
	private static String query="Select id,category_name,parent_id from category where parent_id=?";
	private static String query1="Select id,category_name,parent_id from category where parent_id='0'";
	private static Connection connection=null;
	private static PreparedStatement preparedStatement=null;
	private static Statement statement=null;
	private static ResultSet resultSet=null;
	

	public static List<CategoriesDto> getCategeries(Integer categeoryId) throws SQLException {
		
		List<CategoriesDto> adminDTOs = new ArrayList<>();
		//String category_id=dto.getCategory_id();
		connection=ConnectionManager.getConnection();
		preparedStatement=connection.prepareStatement(query);
		preparedStatement.setInt(1, categeoryId);
		resultSet=preparedStatement.executeQuery();
		while(resultSet.next())
		{
			CategoriesDto adminDTO = new CategoriesDto();
			String id = resultSet.getString(1);
			String category_name=resultSet.getString(2);
			String parent_id=resultSet.getString(3);
			adminDTO.setId(id);
			adminDTO.setCategoryName(category_name);
			adminDTO.setParentId(parent_id);
			
			adminDTOs.add(adminDTO);
			//System.out.println(adminDTOs);
		}
		
		return adminDTOs;
	}
	
	public static List<CategoriesDto> getElements() throws SQLException
	{
		List<CategoriesDto> adminDTOs = new ArrayList<>();
	
		connection=ConnectionManager.getConnection();
		statement=connection.createStatement();		
		resultSet=statement.executeQuery(query1);
		while(resultSet.next())
		{
			CategoriesDto adminDTO = new CategoriesDto();
			String id = resultSet.getString(1);
			String category_name=resultSet.getString(2);
			//String parent_id=resultSet.getString(3);
			adminDTO.setId(id);
			adminDTO.setCategoryName(category_name);
			//adminDTO.setParent_id(parent_id);
			adminDTOs.add(adminDTO);
			//System.out.println(adminDTOs);
		}
		
		return adminDTOs;
	}
		
}


