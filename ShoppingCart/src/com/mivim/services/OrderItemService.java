package com.mivim.services;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mivim.dao.OrderItemDAO;
import com.mivim.dto.OrderDto;
import com.mivim.dto.OrderItemDto;

public class OrderItemService {

	public static boolean getOrderService(OrderItemDto orderDto, OrderDto dto) throws SQLException {
		
	List<OrderItemDto> listItems=new ArrayList<OrderItemDto>();
	
		int length=dto.getItemId().length;
		
		String itemId[]=dto.getItemId();
		String quantity[]=dto.getQuantity();
		String totalPrice[]=dto.getTotal();
		
		for(int i=0;i<length;i++)
		{
			OrderItemDto orderValues=new OrderItemDto();
			orderValues.setItemId(itemId[i]);
			orderValues.setTotal(totalPrice[i]);
			orderValues.setQuantity(quantity[i]);
			listItems.add(orderValues);
		}
		
		
		boolean flag1=OrderItemDAO.getOrderDAO(orderDto);
		boolean flag2=OrderItemDAO.getOrderItemDAO(listItems);
		System.out.println(flag1);
		System.out.println(flag2);
		if(flag1 && flag2)
		{
			boolean flag=OrderItemDAO.getInventary(listItems);
			System.out.println(flag);
			if(flag)
			return true;
			else
			return false;
		}
		else
			return false;	
	}

}
