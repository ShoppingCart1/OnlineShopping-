package com.mivim.services;
import com.mivim.*;
import com.mivim.dao.AddItemDB;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

public class AddItemServices {
	public static void paramList(String[] paramList) throws IOException, SQLException{	
		AddItemDB.executeQuery(paramList);
	}
}
