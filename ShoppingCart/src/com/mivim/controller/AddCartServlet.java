package com.mivim.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mivim.dto.AddCartDto;

/**
 * Servlet implementation class AddCartServlet
 */
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int count;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddCartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession session = request.getSession();
		String itemId = request.getParameter("itemId");
		String itemName = request.getParameter("itemName");
		String itemDescription = request.getParameter("itemDescription");
		String price = request.getParameter("price");
		String inventory = request.getParameter("inventary");
		Set<AddCartDto> addCartDtos = null;

		addCartDtos = (Set<AddCartDto>) session.getAttribute("cart");
		if (addCartDtos == null) {
			addCartDtos = new HashSet<AddCartDto>();
			session.setAttribute("cart", addCartDtos);
		}

		AddCartDto dto = new AddCartDto();
		dto.setItemId(itemId);
		dto.setItemName(itemName);
		dto.setItemDescription(itemDescription);
		dto.setUnitPirce(price);
		dto.setInventary(inventory);
		addCartDtos.add(dto);
		session.setAttribute("addcart", addCartDtos);

		request.getRequestDispatcher("CartItems.jsp").forward(request, response);

	}

}