package com.bookstore.controls;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.models.Book;
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
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			
			Book bookOrdered = DBManager.getBookById(Integer.parseInt(request.getParameter("book_id")));
			User userlogged = DBManager.getUserByUserName(request.getParameter("user_name"));
			String address1 = request.getParameter("shipping[address]");
			String address2 = request.getParameter("shipping[address-2]");
			String zipCode = request.getParameter("zip_code");
			String cardNumber = request.getParameter("card[number]");
			String csv = request.getParameter("card[cvc]");
			String cardExpYear = request.getParameter("card[expire-year]");
			String cardExpMonth = request.getParameter("card[expire-month]");
			String quantityBought = request.getParameter("quantityOrdered");
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
