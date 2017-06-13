package com.mivim.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context=getServletContext();
		HttpSession session = request.getSession();
		String itemId=request.getParameter("itemId");
		String itemName=request.getParameter("itemName");
		String itemDescription=request.getParameter("itemDescription");
		String price=request.getParameter("price");
		
		List<AddCartDto> addCartDtos =null;
		if(!addCartDtos.isEmpty()){
			AddCartDto dto=new AddCartDto();
			dto.setId(itemId);
			dto.SetName(itemName);
			dto.setDescription(itemDescription);
			dto.setPrice(price);
			addCartDtos.add(dto);
			session.setAttribute("addcart",addCartDtos);
		}else{
			AddCartDto dto=new AddCartDto();
			dto.setId(itemId);
			dto.SetName(itemName);
			dto.setDescription(itemDescription);
			dto.setPrice(price);
			session.setAttribute("addcart",addCartDtos);
		}
		
		
	}

}
