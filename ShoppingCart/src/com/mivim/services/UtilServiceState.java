package com.mivim.services;

import java.sql.SQLException;
import java.util.List;

import com.mivim.dao.UtilDAO;
import com.mivim.dto.StateDto;

public class UtilServiceState {
public static List<StateDto> getCities(StateDto dto) throws SQLException {
		
		List<StateDto> listData=UtilDAO.getCities(dto.getCity_id());
		if(listData.equals(null))
		return null;
		else
		return listData;
		
	}
}
