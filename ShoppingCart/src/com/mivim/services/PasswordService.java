package com.mivim.services;

import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.mivim.dao.PasswordDAo;
import com.mivim.dto.PasswordDto;

public class PasswordService {
	private static String email;
	private static String userId;
	private static String password;
	public static boolean getPasswordService(PasswordDto passwordDto) throws SQLException {
		boolean flag=false;
		email=passwordDto.getEmail();
		PasswordDto dto=PasswordDAo.getPasswordDAO(email);
		
		userId=dto.getUserId();
		password=dto.getPassword();
		email=dto.getEmail();
		if(!dto.equals(null))
		{
			flag=getMailService();
		}
		return flag;
		
	}
	
	public static boolean getMailService()
	{
		 // Create all the needed properties
        Properties connectionProperties = new Properties();
        // SMTP host
        connectionProperties.put("mail.smtp.host", "smtp.gmail.com");
        // Is authentication enabled
        connectionProperties.put("mail.smtp.auth", "true");
        // Is StartTLS enabled
        connectionProperties.put("mail.smtp.starttls.enable", "true");
        // SSL Port
        connectionProperties.put("mail.smtp.socketFactory.port", "465");
        // SSL Socket Factory class
        connectionProperties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        // SMTP port, the same as SSL port :)
        connectionProperties.put("mail.smtp.port", "465");
         
        System.out.print("Creating the session...");
         
        // Create the session
        Session session = Session.getDefaultInstance(connectionProperties,
                new javax.mail.Authenticator() {    // Define the authenticator
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("srireddy110@gmail.com","9701469923");
                    }
                });
         
        System.out.println("done!");
        if(password!=null){
        // Create and send the message
        try {
            // Create the message 
            Message message = new MimeMessage(session);
            // Set sender
            message.setFrom(new InternetAddress("srireddy110@gmail.com"));
            // Set the recipients
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            // Set message subject
            message.setSubject("Getting Forgot password");
            // Set message text
            
            message.setText("Hi user....\n"
            		+"Your User ID is"+userId
            		
            		+ "\nYour Password is"+password);
            
            System.out.print("Sending message...");
            // Send the message
            Transport.send(message);
             
            System.out.println("done!");
             
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
        }
        else
		return false;
         
	}

}
