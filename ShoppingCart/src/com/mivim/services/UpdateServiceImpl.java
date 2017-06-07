package com.mivim.services;

import java.sql.SQLException;

import com.mivim.dao.UpadteDAO;
import com.mivim.dto.AdminDTO;


public class UpdateServiceImpl implements UpdateService {

	/*
	 * (non-Javadoc)
	 * @see com.mivim.services.UpdateService#getUpdate(com.mivim.dto.AdminDTO)
	 * 
	 * Here we develop logic for updation
	 */
	public static boolean getUpdateservice(AdminDTO dto) throws SQLException {
		
		int status=UpadteDAO.getUpdateDAO(dto);
		
		if(status==0)
		return false;
		else
		return true;
	}

}
