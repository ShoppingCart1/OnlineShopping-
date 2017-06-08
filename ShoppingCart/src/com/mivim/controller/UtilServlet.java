package com.mivim.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mivim.dto.AdminDTO;
import com.mivim.dto.CategoriesDto;
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
		
		String category_id=request.getParameter("category_id");
		
		//PrintWriter pw=response.getWriter();
		
		//String category_id="0";
		
		CategoriesDto dto=new CategoriesDto();
		
		dto.setId(category_id);
		
		
		try {
			
			List<CategoriesDto> listDto=UtilService.getCategeries(dto);
            String json = null;
            List<String> list=new ArrayList<String>();
			/*for(AdminDTO dt:listDto)
			{
				list.add(dt.getCategory_name());
			}	

			
			System.out.println(list);
*/			response.setContentType("application/json");
             new Gson().toJson(listDto,response.getWriter());
            
           /* response.getWriter().write(json);
            request.setAttribute("categeries", listDto);*/
		
		//	request.setAttribute("categeries", list);
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
