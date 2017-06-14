package com.mivim.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

import com.mivim.connection.ConnectionManager;
import com.mivim.dto.AddressDto;

public class AddressDao {
	
	static String user_id ;
	static String addressline1 ;
	static String addressline2 ;
	static String city ;
	static String state ;
	static String pincode ;
	static String uuid;
    static int status ;
    
    static String queryAddAddress = "insert into address (id, user_id, address_line1, address_line2, city, state, pincode, status) values(?,?,?,?,?,?,?,?)";

    static Connection connection = null;
 
	public static int executeAddressQuery(AddressDto adto) throws SQLException{
		  
		  user_id = adto.getUser_id();
          addressline1 = adto.getAddressline1();
          addressline2 = adto.getAddressline2();
          city = adto.getCity();
          state = adto.getState();
          pincode = adto.getPincode();
          status = adto.getStatus();
          uuid = generateUUuid();
          
          connection = ConnectionManager.getConnection();
          PreparedStatement preparedStatement = connection.prepareStatement(queryAddAddress);
          
          preparedStatement.setString(1, uuid);
          preparedStatement.setString(2, user_id);
          preparedStatement.setString(3, addressline1);
          preparedStatement.setString(4,addressline2);
          preparedStatement.setString(5, city);
          preparedStatement.setString(6, state);
          preparedStatement.setString(7, pincode);
          preparedStatement.setInt(8, status);
          
          int checkExecute = preparedStatement.executeUpdate();
          
          
          
		return checkExecute;
		
	}
	
	public static String generateUUuid() {
		String uuid = UUID.randomUUID().toString();
		return uuid;
	}
}
