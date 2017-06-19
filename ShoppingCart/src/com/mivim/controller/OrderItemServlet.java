package com.mivim.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mivim.dto.OrderDto;
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
		
			PrintWriter out =response.getWriter();
		
			HttpSession session=request.getSession();
			String userId=(String)session.getAttribute("userId");
			
			System.out.println(userId);
			
			OrderDto dto=new OrderDto();
			
			String itemId[]=request.getParameterValues("itemId");
			String quantity[]=request.getParameterValues("quantity");
			String totalPrice[]=request.getParameterValues("totalPrice");
			
			dto.setItemId(itemId);
			dto.setQuantity(quantity);
			dto.setTotal(totalPrice);
			
			double subTotal=0;
			
			for(String tp:totalPrice){
				subTotal=subTotal+Double.parseDouble(tp);
			}
				System.out.println(subTotal);
			
			
		
			OrderItemDto orderDto=new OrderItemDto();
			
			orderDto.setSubTotal(subTotal);
			orderDto.setUserId(userId);
			
			try {
				
			
				
				boolean flag=OrderItemService.getOrderService(orderDto,dto);
				System.out.println(flag);
				if(flag)
				{
					System.out.println("abc");
					session.removeAttribute("addcart");
					request.getRequestDispatcher("DetailsFetchServlet").forward(request, response);
				}
				else
				{
					out.print("sorry");
				}
			
			
			} 
			
			
			catch (SQLException e) {
				
				e.printStackTrace();
			}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
