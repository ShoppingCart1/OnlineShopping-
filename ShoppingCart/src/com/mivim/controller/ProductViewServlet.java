package com.mivim.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mivim.dto.ItemDto;

/**
 * Servlet implementation class ProductViewServlet
 */
public class ProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemId=request.getParameter("itemId");
		String itemName=request.getParameter("itemName");
		String price=request.getParameter("price");
		String itemDescription=request.getParameter("itemDescription");
		String inventary=request.getParameter("inventary");
		
		ItemDto dto=new ItemDto();
		
		dto.setItemId(itemId);
		dto.setItemName(itemName);
		dto.setUnitPirce(price);
		dto.setInventary(inventary);
		dto.setItemDescription(itemDescription);
		
		request.setAttribute("productView", dto);
		
		request.getRequestDispatcher("Product.jsp").forward(request, response);;
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
