package com.mivim.services;

import java.sql.SQLException;
import java.util.List;

import com.mivim.dao.LoginDAO;
import com.mivim.dto.ItemDto;
import com.mivim.dto.LoginDto;

public class LoginService {

	public static LoginDto getLoginService(LoginDto loginDto) throws SQLException {
		
		System.out.println("This is Test for Service");
		LoginDto dto=LoginDAO.getLoginDAO(loginDto);
		System.out.println(dto.getUserId());
		return dto;
	}

	public static List<ItemDto> getItemDetailsService() throws SQLException {
		
		List<ItemDto> listDto=LoginDAO.getItemDetailsDAO();
		return listDto;
	}

}
