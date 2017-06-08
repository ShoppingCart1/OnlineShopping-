package com.mivim.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mivim.dto.AdminDTO;
import com.mivim.services.UpdateServiceImpl;



public class ItemUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("test");
		
		System.out.println("Test");
		String operation = request.getParameter("operation");
		String item_id=request.getParameter("item_id");
		String item_name=request.getParameter("item_name");
		String unit_price=request.getParameter("unit_price");
		String image_path=request.getParameter("image_path");
		String inventory=request.getParameter("inventory");
		String item_description=request.getParameter("item_description");
		String category_id=request.getParameter("category_id");
		String sub_category_id=request.getParameter("sub_category_id");
		String status = request.getParameter("status");
//		
//		System.out.println(operation+" "+item_id+""+""+item_name+""+unit_price+""+inventory+""+item_description+""+category_id+""+sub_category_id+""+status+"");
//		/*
//		 * Image Converted to stream
//		 */
		FileInputStream image_stream= new FileInputStream(image_path);
		//System.out.println(image+" "+image_stream);
//		/*
//		 * Here create object for AdminDTO class
//		 * 
//		 */
		File image = new File(image_path);
		AdminDTO dto=new AdminDTO();
		
		dto.setStatus(status);
		dto.setOperation(operation);
		dto.setItem_id(item_id);
		dto.setItem_name(item_name);
		dto.setUnit_price(unit_price);
		dto.setImage(image);
		dto.setImage_stream(image_stream);
		dto.setInventory(inventory);
		dto.setItem_description(item_description);
		dto.setCategory_id(category_id);
		dto.setSub_category(sub_category_id);
		
		/*
		 * DTO object send to services
		 */
		try {
			boolean flag=UpdateServiceImpl.getUpdateservice(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

	
}
