package com.mivim.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mivim.connection.ConnectionManager;
import com.mivim.dto.AdminDTO;

public class AddItemDB {
	static Connection con = null;
	static String item_id, item_name, unit_price, inventory, item_description, status, filePath, categoryname, categoryid, subcategory;

	public static void executeQuery(AdminDTO admindto) throws IOException, SQLException{	


		item_id = admindto.getItem_id();
		item_name = admindto.getItem_name();
		unit_price = admindto.getUnit_price();
		inventory = admindto.getInventory();
		item_description = admindto.getItem_description();
		status = admindto.getStatus();
		filePath = admindto.getImage_path();
		categoryid = admindto.getCategory_id();
		categoryname = admindto.getCategory_name();
		subcategory = admindto.getSub_category();
 
		String sqlAddProduct="insert into item (item_id, item_name, unit_price, item_image, inventary, item_description, status) values(?,?,?,?,?,?,?)";
		String sqlRetCategory="select id, parent_cat_id from category where category_name=?";
		
		executeAddProduct(sqlAddProduct); //To add products in Item table
		executeRetrieve(sqlRetCategory); //To retrieve the id and parent_cat_id from category table
	}
	
	public static void executeAddProduct(String sqlAddProduct) throws FileNotFoundException, SQLException {
		
		System.out.println(categoryname);
		File file=new File(filePath);
		InputStream is=new FileInputStream (file);
		con = ConnectionManager.getConnection();
		PreparedStatement ps = con.prepareStatement(sqlAddProduct);
		ps.setString(1, item_id);
		ps.setString(2, item_name);
		ps.setString(3, unit_price);
		ps.setBinaryStream(4, is, (int)file.length());
		ps.setString(5, inventory);
		ps.setString(6, item_description);
		ps.setInt(7, Integer.parseInt(status));
		int i = ps.executeUpdate();
		
		
		System.out.println("Successfully written..");
	
	}
	
	public static void executeRetrieve(String sqlRetCategory) throws SQLException {
		System.out.println("Test1");

		String categoryId=null,parentId=null, sqlAddItemCategory="insert into item_category (item_id, parent_cat_id, id) values(?,?,?)";
		
		PreparedStatement ps1 = con.prepareStatement(sqlRetCategory);
		System.out.println("Test2");
		System.out.println(ps1);
		System.out.println(con);

		ps1.setString(1, categoryname);	
		System.out.println("Test3");

		ResultSet rs=ps1.executeQuery();
		System.out.println("Test4");
		
		while(rs.next()){
			categoryId = rs.getString(1);
			parentId = rs.getString(2);
			System.out.println("Test5");
			System.out.println("Successfully retrieved.."+ categoryId+" "+parentId);
		}
		
		
		executeAddItemcategory(categoryId, parentId, sqlAddItemCategory); //To add itemid, parent_cat_id, id in the item_category table.

	}
	
	public static void executeAddItemcategory(String categoryId, String parentId, String sqlAddItemCategory) throws SQLException {
		System.out.println("Test6");

		PreparedStatement ps2 = con.prepareStatement(sqlAddItemCategory);
		System.out.println("Test7");

		ps2.setString(1, item_id);
		ps2.setString(2, parentId);
		ps2.setString(3, categoryId);
		System.out.println("Test8");

		
		int j = ps2.executeUpdate();
		System.out.println("Test9");

		
		System.out.println("Successfully updated in itemcategory table..");
	}
	
	
	
}
