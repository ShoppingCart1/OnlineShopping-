package com.mivim.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mivim.dto.AddressDto;
import com.mivim.services.AddressService;

/**
 * Servlet implementation class AddressServlet
 */

public class AddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String user_id = request.getParameter("userId");
		String addressline1 = request.getParameter("addressline1");
		String addressline2 = request.getParameter("addressline2");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pincode = request.getParameter("pincode");

		System.out.println(city+" "+state);
		AddressDto adto = new AddressDto();

		adto.setUser_id(user_id);
		adto.setAddressline1(addressline1);
		adto.setAddressline2(addressline2);
		adto.setCity(city);
		adto.setState(state);
		adto.setPincode(pincode);

		try {

			String address = AddressService.getAddressService(adto);
			System.out.println(address);

			if (address != null)
				response.setContentType("application/json");
			new Gson().toJson(address, response.getWriter());

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
