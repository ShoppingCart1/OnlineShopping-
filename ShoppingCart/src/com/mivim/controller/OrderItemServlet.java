package com.mivim.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mivim.dto.OrderItemDto;
import com.mivim.services.OrderItemService;

/**
 * Servlet implementation class OrderItemServlet
 */
public class OrderItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
			HttpSession session=request.getSession();
			String userId=(String)session.getAttribute("userId");
			List<OrderItemDto> orderList=(List<OrderItemDto>) request.getAttribute("orders");
			
			 double sub =0;
			for(OrderItemDto dto:orderList)
			{
				sub+=Double.parseDouble(dto.getTotal());
			}
			OrderItemDto orderDto=new OrderItemDto();
			
			orderDto.setSubTotal(sub);
			orderDto.setUserId(userId);
			
			OrderItemService.getOrderService(orderDto,orderList);
			
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
