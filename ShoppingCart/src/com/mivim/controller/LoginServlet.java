package com.mivim.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mivim.dto.ItemDto;
import com.mivim.dto.LoginDto;
import com.mivim.services.LoginService;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		response.setContentType("text/html");  
 	        PrintWriter out = response.getWriter();  
 	        
 	        String username=request.getParameter("username");  
 	        String password=request.getParameter("password");
 	        String userRole =request.getParameter("userRole");
 	        
 	        System.out.println(username);
 	        System.out.println(password);
 	        System.out.println(userRole);

 	        LoginDto loginDto=new LoginDto();
 	        
 	        loginDto.setUsername(username);
 	        loginDto.setPassword(password);
 	        

 	        try {
				LoginDto dto= LoginService.getLoginService(loginDto);
				
				String role=dto.getRole();
				String name=dto.getUsername();
				String userId=dto.getUserId();
				
				HttpSession session=request.getSession();
				RequestDispatcher requestDispatcher;
				System.out.println(name);
				System.out.println(role);
				System.out.println(userId);
				
					if(name!=null && role.equals("admin") && userRole.equals("admin")){
					session.setAttribute("adminName", name);
					
					List<ItemDto> itemDto=LoginService.getItemDetailsService();
					
					requestDispatcher=request.getRequestDispatcher("adminHome.jsp");
					requestDispatcher.forward(request, response);
					}
					else if(name!=null && role.equals("customer") && userRole.equals("customer"))
					{
						session.setAttribute("customerName", name);
						session.setAttribute("userId", userId);
						requestDispatcher=request.getRequestDispatcher("index.jsp");
						requestDispatcher.forward(request, response);
					}
					else if(userRole.equals("admin"))
					{
						
						request.setAttribute("errorMessage", "You giving wrong credentials");
						requestDispatcher=request.getRequestDispatcher("adminlogin.jsp");
						requestDispatcher.forward(request, response);
					}
					else if(userRole.equals("customer"))
					{
						request.setAttribute("errorMessage", "You giving wrong credentials");
						requestDispatcher=request.getRequestDispatcher("user_login.jsp");
						requestDispatcher.forward(request, response);
					}

				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
 	       
 	    }  
  }


