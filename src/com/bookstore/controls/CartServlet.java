package com.bookstore.controls;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.models.Book;
import com.bookstore.models.Order;
import com.bookstore.models.User;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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
		try {
			
			Book bookOrdered = DBManager.getBookById(Integer.parseInt(request.getParameter("book_id")));
			User userlogged = DBManager.getUserByUserName(request.getParameter("user_name"));
			String address1 = request.getParameter("shipping[address]");
			String address2 = request.getParameter("shipping[address-2]");
			String state = request.getParameter("state");
			String country = request.getParameter("country");
			int zipCode = Integer.parseInt(request.getParameter("zip_code"));
			long cardNumber = Long.parseLong(request.getParameter("card[number]"));
			int csv = Integer.parseInt(request.getParameter("card[cvc]"));
			int cardExpYear = Integer.parseInt(request.getParameter("card[expire-year]"));
			int cardExpMonth = Integer.parseInt(request.getParameter("card[expire-month]"));
			int quantityBought = Integer.parseInt(request.getParameter("quantityOrdered"));
			
			setUserAddressAndCard(address1, address2, zipCode, state, country, cardNumber, csv, cardExpMonth, cardExpYear, userlogged);
			DBManager.updateUserInfoAtCheckout(userlogged);
			if(quantityBought<=0) {
				System.out.println("Hello");
				request.setAttribute("bookSelected", bookOrdered);
				request.setAttribute("userLogged", userlogged);
				request.setAttribute("quantityEntered", quantityBought);
				request.setAttribute("errorMessage", "Quantity can only be a positive integer greater than 0");
				request.getRequestDispatcher("/cart.jsp").forward(request, response);
			}else if(quantityBought>bookOrdered.getQuantity()) {
				System.out.println("Hello");
				request.setAttribute("bookSelected", bookOrdered);
				request.setAttribute("userLogged", userlogged);
				request.setAttribute("quantityEntered", quantityBought);
				request.setAttribute("errorMessage", "Quantity cannot be greater than what is in stock");
				request.getRequestDispatcher("/cart.jsp").forward(request, response);
			}else {
				Timestamp dateTime = new Timestamp(System.currentTimeMillis());
				Date deliveryDate = incrementDate();
				Order order = new Order(dateTime, userlogged, bookOrdered, quantityBought, deliveryDate);
				DBManager.registerOrder(order);
				Email.sendEmail(order);
				request.setAttribute("quantityB", quantityBought);
				request.setAttribute("userLogged_", userlogged);
				request.setAttribute("bookBought_", bookOrdered);
				request.setAttribute("deliveryDate_", deliveryDate);
				request.getRequestDispatcher("/confirmationPage.jsp").forward(request, response);
			}
			
			
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void setUserAddressAndCard(String address1, String address2, int zip_code, String state, String
			country, long cardNumber, int cvc, int month, int year, User user) {
		user.setAddress1(address1);
		user.setAddress2(address2);
		user.setState(state);
		user.setCountry(country);
		user.setZipcode(zip_code);
		user.setCardNumber(cardNumber);
		user.setCsv(cvc);
		user.setCardExpirationMonth(month);
		user.setCardExpirationYear(year);
	}
	
	private Date incrementDate() {
		Date currentDate = new Date();
		
        // convert date to calendar
        Calendar c = Calendar.getInstance();
        c.setTime(currentDate);

        // manipulate date
        c.add(Calendar.DATE, 4); //same with c.add(Calendar.DAY_OF_MONTH, 1);

        // convert calendar to date
        Date currentDatePlusfour = c.getTime();
        return currentDatePlusfour;
	}

}
