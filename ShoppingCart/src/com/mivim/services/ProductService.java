package com.mivim.services;
 import com.mivim.connection.ConnectionManager;
 import com.mivim.connection.*;
 import com.mivim.dto.*;
 import com.mivim.controller.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
public class ProductService {
	private List<Product> products = null;
	
	public List<Product> getAllProducts() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = ConnectionManager.getConnection();
		sql = "select * from Items";
		products = new ArrayList<Product>();

		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product(rs.getInt("productID"),
						rs.getString("productName"),
						rs.getDouble("productPrice"),
						rs.getString("productInventory"),
						rs.getString("productSummary"),
						rs.getString("productCategory"),
						rs.getString("productSubCategory"));
						
				products.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
	

		}

		return products;

	}

	// Method to get the required Product Details
	public Product getProductDetails(int productId) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql;
		conn = ConnectionManager.getConnection();
		Product p = new Product();
		sql = "select name,price,inventory,description,categoryName,SubCategory from products where id=?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, productId);
			rs = ps.executeQuery();
			while (rs.next()) {
				p.setId(productId);
				p.setName(rs.getString(1));
				p.setPrice(rs.getDouble(2));
				p.setInventory(rs.getString(3));
				p.setDescription(rs.getString(4));
				p.setCategory(rs.getString(5));
				p.setSubCategory(rs.getString(6));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			try {
				if (ps != null) {
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}


		}
		return p;
	}
	
}
