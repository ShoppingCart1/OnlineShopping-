package com.mivim.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mivim.services.AddItemServices;
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
		String filePath = request.getParameter("file");
		String dropDown = request.getParameter("category");
		
		String[] paramList=new String[8];
		paramList[0]=item_id;
		paramList[1]=item_name;
		paramList[2]=unit_price;
		paramList[3]=inventory;
		paramList[4]=item_description;
		paramList[5]=status;
		paramList[6]=filePath;
		paramList[7]=dropDown;
		
		
		try {
			AddItemServices.paramList(paramList);
		} catch (SQLException e) {
			RequestDispatcher rd=request.getRequestDispatcher("AddItem.jsp");
			out.println("The item with the item id is already added in database.");
			rd.include(request, response);
		}
		
	}
	

}
