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
 	        
 	        String username = request.getParameter("username");  
 	        String password = request.getParameter("password"); 
 	        String loginMode = request.getParameter("loginmode");
 	        HttpSession session = request.getSession();

 
 	        try {
 	        	
 	        	System.out.println("Test");
 	        	String userId = LoginServices.getUserIdService(username, password);
 	        	System.out.println(userId);
				
				if(!(userId==null)){
						
					String roleId = LoginServices.getRoleIdService(userId);
					System.out.println(roleId);
						
						if(roleId.equals("1")){
							
							if(loginMode.equals("admin")){
								session.setAttribute("username", username);
								out.print("Admin logged In sucessfully");
								RequestDispatcher rd=request.getRequestDispatcher("adminhome.jsp");  
								rd.forward(request,response);
							}
						
							else{
								out.println("Login mode error");
								RequestDispatcher rd=request.getRequestDispatcher("user_login.jsp");  
								rd.include(request, response);
							}
						}
						
						else{
							if(loginMode.equals("user")){
								session.setAttribute("username", username);
								out.print("User logged In sucessfully");
								RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");  
								rd.forward(request,response);
							}
							else{
								out.println("Login mode error");
								RequestDispatcher rd=request.getRequestDispatcher("adminlogin.jsp");
								rd.include(request,response);
							}
						}
					
				}
				
				else{
					
					if(loginMode.equals("admin")){
						 out.println("Please check your username or password");
			 	         RequestDispatcher rd=request.getRequestDispatcher("adminlogin.jsp");  
			 	         rd.include(request,response);  	
					}
					
					else{
						out.println("Please check your username or password");
			 	        RequestDispatcher rd=request.getRequestDispatcher("user_login.jsp");  
			 	        rd.include(request,response);  	
					}
					 
					 
				
				}
			
 	        } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
 	        

 	        out.close();  
 	    }  
  }

