package com.mivim.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mivim.dao.UserLoginDao;
import com.mivim.services.LoginServices;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		response.setContentType("text/html");  
 	        PrintWriter out = response.getWriter();  
 	        
 	        String name=request.getParameter("username");  
 	        String password=request.getParameter("password"); 
		HttpSession session = request.getSession();

 
 	        try {
				
 	        	String userId = LoginServices.getUserIdService(name, password);
				
				if(!userId.equals(null)){
						
					String roleId = LoginServices.getRoleIdService(userId);
						
						if(roleId.equals("admin")){
							session.setAttribute("username", name);
							out.print("Admin logged In sucessfully");
							RequestDispatcher rd=request.getRequestDispatcher("AdminHome.jsp");  
							rd.forward(request,response);
						}
						
						else{
							session.setAttribute("username", name);
							out.print("User logged In sucessfully");
							RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");  
			 	            rd.forward(request,response);
						}
					
				}
				else{
					 
				 request.setAttribute("errormessage", "invalid user or password");
		 	         RequestDispatcher rd=request.getRequestDispatcher("invalid.jsp");  
		 	         rd.include(request,response);  
				
				}
			
 	        } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
 	        

 	        out.close();  
 	    }  
  }


