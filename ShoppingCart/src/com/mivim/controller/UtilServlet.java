package com.mivim.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mivim.dto.AdminDTO;
import com.mivim.services.UtilService;

/**
 * Servlet implementation class UtilServlet
 */

public class UtilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UtilServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String category_id=request.getParameter("category_id");
		
		PrintWriter pw=response.getWriter();
		
		String category_id="0";
		
		AdminDTO dto=new AdminDTO();
		
		dto.setCategory_id(category_id);
		
		
		try {
			
			List<AdminDTO> list=UtilService.getCategeries(dto);
			
			/*for(AdminDTO dt:list)
			{
				pw.println(dt.getCategory_id()+" "+dt.getCategory_name()+"  "+dt.getParent_id()+"\n");
			}*/
			
			request.setAttribute("categeries", list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
