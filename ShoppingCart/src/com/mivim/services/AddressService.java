package com.mivim.services;

import java.sql.SQLException;

import com.mivim.dao.AddressDao;
import com.mivim.dto.AddressDto;

public class AddressService {
 
	public static int getAddressService(AddressDto adto) throws SQLException{
		int checkExecute = AddressDao.executeAddressQuery(adto);
		return checkExecute;
		
	}
}
