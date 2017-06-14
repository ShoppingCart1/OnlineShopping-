package com.mivim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.UUID;

import com.mivim.connection.ConnectionManager;
import com.mivim.dto.OrderItemDto;

public class OrderItemDAO {
	private static Connection connection=null;
	private static PreparedStatement preparedStatement=null;
	private static ResultSet resultSet=null;
	
	public static void getOrderDAO(OrderItemDto orderDto, List<OrderItemDto> orderList) {
		
		connection = ConnectionManager.getConnection();
		 
		
	}

	public static String generateUUuid() {
		String uuid = UUID.randomUUID().toString();
		return uuid;
	}
}
