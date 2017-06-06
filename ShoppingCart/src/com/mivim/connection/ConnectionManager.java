package com.mivim.connection;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionManager {
	
	/*
	 * Connectin Object references
	 */
	private static Connection connection=null;
	private static String url=null;
	private static String username=null;
	private static String password=null;
	private static String driverClass=null;
	
	
	
	
	public static Connection getConnection()
	{
		try{
			FileInputStream fis=new FileInputStream("E:\\E-Commerce\\ShoppingCart\\src\\com\\mivim\\connection\\DB_Config.properties");
			Properties p=new Properties();
			p.load(fis);
			driverClass=p.getProperty("driverClass");
			url=p.getProperty("url");
			username=p.getProperty("username");
			password=p.getProperty("password");
		Class.forName(driverClass);
		connection=DriverManager.getConnection(url,username,password);
		
		}
		catch(IOException e)
		{
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
}
