package com.bookstore.controls;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.models.*;

import javax.mail.*;
import javax.mail.internet.*;

/**
 * Servlet implementation class Email
 */
@WebServlet("/Email")
public class Email extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    private static final String userName = "johndoe9252018@gmail.com";
    private static final String password = "Password27!";
    public Email() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @SuppressWarnings("deprecation")
	public static void sendEmail(Order order) {
        // outgoing message information
        String toAddress = order.getUser().getEmail();
        String subject = "Thank You For Your Purchase!";
        Date date = order.getDeliveryDate();
        int month = date.getMonth();
        int day = date.getDate();
        int year = date.getYear();
        String test = month +  "/" + day + "/" + year;
		String message = "Hello,\nThe following is a copy of your reciept from your latest purchase.\n"
        		+ "Book Purchased: " + order.getBook().getTitle() + "\n"
        		+ "Quantity Purchased: "+ order.getQuantityOrdered() + "\n"
        		+ "Total Price: " + (order.getQuantityOrdered() * order.getBook().getUnitPrice())
        		+ "Expected Delivery: " + test;
        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smpt.gmail.com");
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

}
