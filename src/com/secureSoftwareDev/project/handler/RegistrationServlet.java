package com.secureSoftwareDev.project.handler;

import java.awt.SystemTray;
import java.io.IOException;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String eMail = request.getParameter("e_mail");
		String phoneNumber = request.getParameter("phone_number");
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String rePassword = request.getParameter("re_password");
		
		if(name.equals("") || eMail.equals("") || phoneNumber.equals("") || userName.equals("")
				|| password.equals("") || rePassword.equals("")) {
			request.setAttribute("errorMessage", "Please fill all the fields");
			reFillArguments(request, name, eMail, phoneNumber, userName, response);
		}else if(!isEmailValid(eMail)){
			request.setAttribute("errorMessageMail", "Please enter a valid email address");
			reFillArguments(request, name, eMail, phoneNumber, userName,response);
		}else if(!isPhoneNumberValid(phoneNumber)) {
			request.setAttribute("errorMessagePhoneNumber", "Please enter a valid phone number ( - , / and space are not authorized)");
			reFillArguments(request, name, eMail, phoneNumber, userName,response);
		}else {
			
		}
		
	}
	
	private static void reFillArguments(HttpServletRequest request, String name,String eMail, 
			String phoneNumber, String userName, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("name", name);
		request.setAttribute("e_mail", eMail);
		request.setAttribute("phone_number", phoneNumber);
		request.setAttribute("username", userName);
		request.getRequestDispatcher("/register.jsp").forward(request, response);
	}
	
	private static boolean isEmailValid(String email) 
    { 
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+ 
                            "[a-zA-Z0-9_+&*-]+)*@" + 
                            "(?:[a-zA-Z0-9-]+\\.)+[a-z" + 
                            "A-Z]{2,7}$"; 
                              
        Pattern pat = Pattern.compile(emailRegex); 
        if (email == null) 
            return false; 
        return pat.matcher(email).matches(); 
    } 
	
	private static boolean isPhoneNumberValid(String phoneNumber) {
		if (phoneNumber == null)
			return false;
		else if (phoneNumber.startsWith("+")) {
			String phone = phoneNumber.substring(1);
			try {
				Integer.parseInt(phone);
				return true;
			}catch(NumberFormatException ex) {
				return false;
			}
		}else {
			try {
				Integer.parseInt(phoneNumber);
				return true;
			}catch(NumberFormatException ex) {
				return false;
			}
		}
			
	}

}
