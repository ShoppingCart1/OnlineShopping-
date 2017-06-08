package com.mivim.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mivim.dto.AdminDTO;
import com.mivim.services.*;
public class AddItemServlet extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String item_id = request.getParameter("item_id");
		String item_name = request.getParameter("item_name");
		String unit_price = request.getParameter("unit_price");
		String inventory = request.getParameter("inventory");
		String item_description = request.getParameter("item_description");
		String status = request.getParameter("status");
		String imgfilePath = request.getParameter("file");
		String category_name = request.getParameter("category");
		String subCategory_Id = request.getParameter("subcategory");

		AdminDTO admindto = new AdminDTO();
		admindto.setItem_id(item_id);
		admindto.setItem_name(item_name);
		admindto.setUnit_price(unit_price);
		admindto.setInventory(inventory);
		admindto.setItem_description(item_description);
		admindto.setStatus(status);
		admindto.setImage_path(imgfilePath);
		admindto.setCategory_name(category_name);
		admindto.setSub_category(subCategory_Id);
		
		
		
		
		try {
			AddItemServices.addServices(admindto);
			out.println("The Item added successfully..");

		} catch (SQLException e) {
//			RequestDispatcher rd=request.getRequestDispatcher("AddItem.jsp");
//			out.println("The item with the item id is already added in database.");
//			rd.include(request, response);
			e.printStackTrace();
		}
		
	}
	
	
	

}
