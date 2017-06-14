package com.mivim.services;

import java.util.List;

import com.mivim.dao.OrderItemDAO;
import com.mivim.dto.OrderItemDto;

public class OrderItemService {

	public static void getOrderService(OrderItemDto orderDto, List<OrderItemDto> orderList) {
		
	OrderItemDAO.getOrderDAO(orderDto,orderList);
		
	}

}
