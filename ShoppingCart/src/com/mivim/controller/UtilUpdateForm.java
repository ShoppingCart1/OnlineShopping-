package com.mivim.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mivim.dto.AdminDTO;
import com.mivim.services.UtilUpdateService;

/**
 * Servlet implementation class UtilUpdateForm
 */
public class UtilUpdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UtilUpdateForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String item_id = request.getParameter("itemId");
		
		System.out.println(item_id);

		// PrintWriter pw=response.getWriter();

		// String category_id="0";
	
		AdminDTO dto = new AdminDTO();

		dto.setItem_id(item_id);

		try {
			
			AdminDTO listDto = UtilUpdateService.getItemDetails(dto);
			System.out.println(listDto.getItem_id());
			request.setAttribute("updateFormDetails", listDto);
			if(listDto.getItem_id()!=null)
				request.getRequestDispatcher("item_update.jsp").forward(request, response);
			else
				request.getRequestDispatcher("sample.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
