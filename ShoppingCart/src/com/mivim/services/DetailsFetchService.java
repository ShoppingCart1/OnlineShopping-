package com.mivim.services;

import java.sql.SQLException;
import java.util.List;

import com.mivim.dao.DetailsFetchDao;
import com.mivim.dto.DetailsFetchDto;

public class DetailsFetchService {
public static List<DetailsFetchDto> getDetailsFetchService(DetailsFetchDto detailsFetchDto) throws SQLException{
	
      List<DetailsFetchDto> listDto = DetailsFetchDao.getExecuteQuery(detailsFetchDto);
	
	return listDto;
		
	}
public static String getAddress(DetailsFetchDto detailsFetchDto) throws SQLException
{
	String userId=detailsFetchDto.getUser_id();
	System.out.println(userId);
	String address=DetailsFetchDao.getAddress(userId);
	return address;
	
}
}
