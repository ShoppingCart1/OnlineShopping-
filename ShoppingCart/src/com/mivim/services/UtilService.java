package com.mivim.services;

import java.sql.SQLException;
import java.util.List;

import com.mivim.dao.UtilDAO;
import com.mivim.dto.AdminDTO;

public class UtilService {

	public static List<AdminDTO> getCategeries(AdminDTO adminDTO) throws SQLException {
		
		List<AdminDTO> listData=UtilDAO.getCategeries(Integer.parseInt(adminDTO.getCategory_id()));
		if(listData.equals(null))
		return null;
		else
		return listData;
		
	}

}
