package com.mivim.services;

import java.sql.SQLException;
import java.util.List;

import com.mivim.dao.UtilDAO;
import com.mivim.dto.AdminDTO;
import com.mivim.dto.CategoriesDto;

public class UtilService {

	public static List<CategoriesDto> getCategeries(CategoriesDto dto) throws SQLException {
		
		List<CategoriesDto> listData=UtilDAO.getCategeries(Integer.parseInt(dto.getId()));
		if(listData.equals(null))
		return null;
		else
		return listData;
		
	}

}
