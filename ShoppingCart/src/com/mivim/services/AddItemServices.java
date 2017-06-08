package com.mivim.services;
import com.mivim.*;
import com.mivim.dao.AddItemDB;
import com.mivim.dto.AdminDTO;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

public class AddItemServices {
	public static void addServices(AdminDTO admindto) throws IOException, SQLException{	
		AddItemDB.executeQuery(admindto);
	}
}
