package com.mivim.services;

import java.sql.SQLException;

import com.mivim.dao.AddressDao;
import com.mivim.dto.AddressDto;

public class AddressService {
 
	public static String getAddressService(AddressDto adto) throws SQLException{
		int status = AddressDao.executeAddressQuery(adto);
		String address=null;
		if(status!=0)
		{
			address=adto.getAddressline1()+","+adto.getAddressline2()+","+adto.getCity()+","+adto.getState()+"-"+adto.getPincode();
		}
		
		return address;
		
	}
}
