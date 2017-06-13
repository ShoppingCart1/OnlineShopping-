package com.mivim.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mivim.dto.AdminDTO;
import com.mivim.services.UpdateServiceImpl;



public class ItemUpdateServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		ServletContext context=getServletContext();
		PrintWriter out =response.getWriter();	
		String item_id = null;
		String operation = request.getParameter("operation");
		if(operation.equals("UpdateItem")){
			item_id = request.getParameter("itemId");
		}
		String item_name=request.getParameter("itemName");
		String unit_price=request.getParameter("unitPrice");
		
		//String image_path=request.getParameter("imagePath");
		
		String inventary=request.getParameter("inventary");
		String item_description=request.getParameter("itemDescription");
		String category_id=request.getParameter("categoryId");
		String sub_category_id=request.getParameter("subCategoryId");
		String statusCode = request.getParameter("statusCode");
//		
		
		
		System.out.println(item_id);
		//context.log(image_path);
//		System.out.println(operation+" "+item_id+""+""+item_name+""+unit_price+""+inventory+""+item_description+""+category_id+""+sub_category_id+""+status+"");
//		/*
//		 * Image Converted to stream
//		 */
		//FileInputStream image_stream= new FileInputStream(image_path);
		//System.out.println(image+" "+image_stream);
//		/*
//		 * Here create object for AdminDTO class
//		 * 
//		 */
		//File image = new File(image_path);
		//context.log(image.getAbsolutePath());
		AdminDTO dto=new AdminDTO();
		
		dto.setStatus(statusCode);
		dto.setOperation(operation);
		dto.setItem_id(item_id);
		dto.setItem_name(item_name);
		dto.setUnit_price(unit_price);
		//dto.setImage(image);
		//dto.setImage_stream(image_stream);
		dto.setInventory(inventary);
		dto.setItem_description(item_description);
		dto.setCategory_id(category_id);
		dto.setSub_category(sub_category_id);
		
		/*
		 * DTO object send to services
		 */
		try {
			boolean flag=UpdateServiceImpl.getUpdateservice(dto);
			
			if(flag)
			{
				out.print("success");
			}
			else
			{
				out.println("fail");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
}
