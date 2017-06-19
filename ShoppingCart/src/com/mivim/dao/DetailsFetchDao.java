package com.mivim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mivim.connection.ConnectionManager;
import com.mivim.dto.DetailsFetchDto;

public class DetailsFetchDao {
	

	private static Connection connection = null;
	private static PreparedStatement preparedStatement = null;
	private static ResultSet resultSet = null;
	private static String orderDetails = "select o.order_id,o.sub_total,oi.item_id,oi.total_price,oi.quantity,item_name"
			+ " from orders o join order_item oi on o.order_id=oi.order_id"
			+ " join item i on i.item_id=oi.item_id where oi.status=1 and o.user_id=?";
	private static String queryAddress = "select address_line1, address_line2, city, state, pincode from address where user_id=?";

	public static List<DetailsFetchDto> getExecuteQuery(DetailsFetchDto detailsFetchDto) throws SQLException {

		List<DetailsFetchDto> listDto = new ArrayList<DetailsFetchDto>();
		String user_id = detailsFetchDto.getUser_id();
		connection = ConnectionManager.getConnection();
		preparedStatement = connection.prepareStatement(orderDetails);
		preparedStatement.setString(1, user_id);
		resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			DetailsFetchDto fetchDto = new DetailsFetchDto();
			fetchDto.setOrderId(resultSet.getString("order_id"));
			fetchDto.setSub_total(resultSet.getString("sub_total"));
			fetchDto.setItem_id(resultSet.getString("item_id"));
			fetchDto.setTotalPrice(resultSet.getString("total_price"));
			fetchDto.setQuantity(resultSet.getString("quantity"));
			fetchDto.setItemName(resultSet.getString("item_name"));
			listDto.add(fetchDto);
		}
		connection.close();
		preparedStatement.close();
		resultSet.close();
		return listDto;

	}

	public static String getAddress(String userId) throws SQLException {
		String addressLine1=null;
		String addressLine2=null;
		String city=null;
		String state=null;
		String pincode=null;
		String address=null;
		System.out.println(userId);
		connection=ConnectionManager.getConnection();
		preparedStatement = connection.prepareStatement(queryAddress);
		preparedStatement.setString(1, userId);
		resultSet= preparedStatement.executeQuery();

		if (resultSet.next()) {
			addressLine1 = resultSet.getString("address_line1");
			addressLine2 = resultSet.getString("address_line2");
			city = resultSet.getString("city");
			state = resultSet.getString("state");
			pincode = resultSet.getString("pincode");
		}
		address=addressLine1+","+addressLine2+","+city+","+state+"-"+pincode;
		return address;

	}

}
