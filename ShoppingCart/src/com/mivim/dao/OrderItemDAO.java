package com.mivim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.mivim.connection.ConnectionManager;
import com.mivim.dto.OrderItemDto;

public class OrderItemDAO {
	
	private static final DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	private static Date date = new Date();
	private static Connection connection=null;
	private static PreparedStatement preparedStatement=null;
	private static ResultSet resultSet=null;
	
	private static String orderQuery="insert into orders(order_id,user_id,sub_total,grand_total)"
										+ " values(?,?,?,?)";
	
	private static String orderItemQuery="insert into order_item "
											+ "(id,order_id,item_id,order_date,total_price,quantity,status)"
											+ "values(?,?,?,?,?,?,?)";
	private static String inventaryUpdateQuery="Update item set inventary=inventary-? where item_id=?";
	private static String orderId=generateUUuid();

	public static boolean getOrderDAO(OrderItemDto orderDto) throws SQLException {
		
		String userId=orderDto.getUserId();
		String subTotal=Double.toString(orderDto.getSubTotal());

		connection = ConnectionManager.getConnection();
		preparedStatement=connection.prepareStatement(orderQuery);
		preparedStatement.setString(1,orderId );
		preparedStatement.setString(2,userId );
		preparedStatement.setString(3,subTotal );
		preparedStatement.setString(4,subTotal );
		int state=preparedStatement.executeUpdate();
		
		connection.close();
		preparedStatement.close();
		
		if(state!=0)
		return true;
		else
		return false;	
	}

	public static String generateUUuid() {
		String uuid = UUID.randomUUID().toString();
		return uuid;
	}

	public static boolean getOrderItemDAO(List<OrderItemDto> listItems) throws SQLException {
		
		boolean flag=true;
		connection=ConnectionManager.getConnection();
		int status=0;
		for(OrderItemDto dto:listItems)
		{
			System.out.println("loop");
			preparedStatement=connection.prepareStatement(orderItemQuery);
			preparedStatement.setString(1, generateUUuid());
			preparedStatement.setString(2, orderId);
			preparedStatement.setString(3, dto.getItemId());
			preparedStatement.setString(4, sdf.format(date).toString());
			preparedStatement.setString(5, dto.getTotal());
			preparedStatement.setString(6, dto.getQuantiy());
			preparedStatement.setInt(7, 1);
			status=preparedStatement.executeUpdate();
		}
		if(status==0)
			flag=false;
		connection.close();
		preparedStatement.close();
		return flag;
	}

	public static boolean getInventary(List<OrderItemDto> listItems) throws SQLException {
		
		boolean flag=true;
		connection=ConnectionManager.getConnection();
		int status=0;
		for(OrderItemDto dto:listItems)
		{
			preparedStatement=connection.prepareStatement(inventaryUpdateQuery);
			preparedStatement.setString(1, dto.getQuantiy());
			preparedStatement.setString(2, dto.getItemId());			
			status=preparedStatement.executeUpdate();
		}
		if(status==0)
			flag=false;
		connection.close();
		preparedStatement.close();
		return flag;
	}
}
