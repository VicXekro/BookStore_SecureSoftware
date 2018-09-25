package com.bookstore.controls;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.models.*;

import javax.mail.*;
import javax.mail.internet.*;

/**
 * Servlet implementation class Email
 */
public class Email extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private String message;
    public Email() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() throws ServletException {
        // Do required initialization
        message = "Hello World";
    }
    
    public void doGet(HttpServletRequest request, HttpServletResponse response/*User myUser, Order order*/) throws ServletException, IOException {
    	response.setContentType("text/html");

        // Actual logic goes here.
        PrintWriter out = response.getWriter();
        out.println("<h1>" + message + "</h1>");
        final String userName = "email";
        final String password = "password";
 
        // outgoing message information
        String toAddress = "alexander.cardin@gmail.com";//myUser.getEmail();
        String subject = "Thank You For Your Purchase!";
        String message = "Hello,\nThe following is a copy of your reciept from your latest purchase.\n";
        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "outlook.office365.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
 
        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };
 
        Session session = Session.getInstance(properties, auth);
 
        // creates a new e-mail message
        Message msg = new MimeMessage(session);
        try {
        	msg.setFrom(new InternetAddress(userName));
        	InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
			msg.setRecipients(Message.RecipientType.TO, toAddresses);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        try {
        	msg.setSubject(subject);
			msg.setSentDate(new Date());
			// set plain text message
			msg.setText(message);
			// sends the e-mail
			Transport.send(msg);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
 
    /**
     * Test the send e-mail method
     *
     */
    public static void main(String[] args) {
        // SMTP server information
        
    }

}
