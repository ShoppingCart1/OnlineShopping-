package com.mivim.services;

import java.sql.SQLException;
import java.util.List;

import com.mivim.dao.UtilDAO;
import com.mivim.dao.UtilUpdateDAO;
import com.mivim.dto.AdminDTO;
import com.mivim.dto.CategoriesDto;

public class UtilUpdateService {

	public static AdminDTO getItemDetails(AdminDTO dto) throws SQLException {
		System.out.println("utilUpdateService");
		AdminDTO listData=UtilUpdateDAO.getUpdateDetails(dto.getItem_id());
		if(listData.equals(null))
		return null;
		else
		return listData;
	}

}
