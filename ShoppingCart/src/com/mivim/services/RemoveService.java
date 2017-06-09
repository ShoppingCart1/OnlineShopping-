package com.mivim.services;

import java.sql.SQLException;

import com.mivim.dao.RemoveDAO;
import com.mivim.dto.AdminDTO;

public class RemoveService {

	public static boolean getRemoveItem(AdminDTO dto) throws SQLException {
		
		int status=RemoveDAO.getRemoveItem(dto.getItem_id());
		if(status!=0)
		return true;
		else
		return false;
	}

}
