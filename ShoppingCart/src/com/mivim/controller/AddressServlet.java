package com.mivim.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mivim.dto.AddressDto;
import com.mivim.services.AddressService;

/**
 * Servlet implementation class AddressServlet
 */
public class AddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
          response.setContentType("text/html");
          PrintWriter out = response.getWriter();
          
          String user_id = request.getParameter("user_id");
          String addressline1 = request.getParameter("addressline1");
          String addressline2 = request.getParameter("addressline2");
          String city = request.getParameter("city");
          String state = request.getParameter("stateId");
          String pincode = request.getParameter("pincode");
          int status = Integer.parseInt(request.getParameter("status"));  //need to check here
                    
          System.out.println(city+" "+state);
          AddressDto adto = new AddressDto();
          
          adto.setUser_id(user_id);
          adto.setAddressline1(addressline1);
          adto.setAddressline2(addressline2);
          adto.setCity(city);
          adto.setState(state);
          adto.setPincode(pincode);
          adto.setStatus(status);
          
          try {
			
        	  int checkExecute = AddressService.getAddressService(adto);
        	  
        	  if(checkExecute == 1){
        		  out.println("Success");
        	  }
        	  
        	  else{
        		  out.println("fail");
        	  }
		
          
          } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
          }
          
          
	}
}
