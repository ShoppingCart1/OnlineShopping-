package com.mivim.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mivim.dto.DetailsFetchDto;
import com.mivim.services.DetailsFetchService;

public class DetailsFetchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
    	String userId=(String)session.getAttribute("userId");
        System.out.println(userId);
        //String user_id="1235";
        DetailsFetchDto  detailsFetchDto= new DetailsFetchDto();
        detailsFetchDto.setUser_id(userId);
        
        try {
			List<DetailsFetchDto> listDto = DetailsFetchService.getDetailsFetchService(detailsFetchDto);
			
		/*	for(DetailsFetchDto dto:listDto)
			{
				System.out.println(dto.getOrderId());
				System.out.println(dto.getItem_id());
				System.out.println(dto.getSub_total());
				System.out.println(dto.getItemName());
				System.out.println(dto.getTotalPrice());
				System.out.println(dto.getQuantity());
			}*/
			
			String address=DetailsFetchService.getAddress(detailsFetchDto);
			
			//System.out.println(address);
			
			request.setAttribute("placeOrderDetails", listDto);
			request.setAttribute("address", address);
			
			request.getRequestDispatcher("ordersView.jsp").forward(request, response);
			
		} catch (SQLException e) {
			
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
