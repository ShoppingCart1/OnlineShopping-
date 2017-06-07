package com.mivim.dao;

import java.sql.SQLException;
import java.util.List;

import com.mivim.dto.AdminDTO;

public class Test {

	public static void main(String[] args) {
	
		try {
			List<AdminDTO> list=UtilDAO.getElements();
			for(AdminDTO dt:list)
			{
				System.out.println(dt.getCategory_id()+" "+dt.getCategory_name()+"\n");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
