package com.mivim.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mivim.dto.AdminDTO;
import com.mivim.services.UpdateService;

/**
 * Servlet implementation class ItemUpdateServlet
 */
public class ItemUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String item_id=request.getParameter("item_id");
		String item_name=request.getParameter("item_name");
		String unit_price=request.getParameter("unit_price");
		String image_path=request.getParameter("item_image");
		String inventory=request.getParameter("inventory");
		String item_description=request.getParameter("item_description");
		String category_id=request.getParameter("category_id");
		String sub_category_id=request.getParameter("sub_category_id");
		
		/*
		 * Image Converted to stream
		 */
		File image=new File(image_path);
		FileInputStream image_stream= new FileInputStream(image);
		
		/*
		 * Here create object for AdminDTO class
		 */
		AdminDTO dto=new AdminDTO();
	
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
		boolean flag=UpdateService.getUpdateservice(dto);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
