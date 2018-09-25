package com.bookstore.controls;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.naming.NamingException;

import com.bookstore.models.Book;
import com.bookstore.models.Order;
import com.bookstore.models.User;

public class DBManager {
	
	private static final String SECRET_KEY = "VfGm7DRIvVTyIKDMrmP8";
	public static void createUser(User user) throws SQLException {
		String sql = "insert into user (username,name,phoneNumber,email,password) "
				+ "values (?,?,?,?,AES_ENCRYPT(?,?));";
		
		Connection conn = Connector.getConnection();
		PreparedStatement prepStatement = conn.prepareStatement(sql);
		prepStatement.setString(1,user.getUserName());
		prepStatement.setString(2, user.getName());
		prepStatement.setString(3, user.getPhoneNumber());
		prepStatement.setString(4, user.getEmail());
		prepStatement.setString(5, user.getPassword());
		prepStatement.setString(6, SECRET_KEY);
		prepStatement.executeUpdate();
		
		prepStatement.close();
		conn.close();
	}
	
	public static User getUserByUserName(String username) throws SQLException {
		String sql = "Select iduser, username, name, phoneNumber, email, AES_DECRYPT(password, ?), address1,"
				+ "address2, state, country, zip_code, card_number, card_expiration_date, csv from user where username = ?;";
		User user = new User();
		
		Connection conn = Connector.getConnection();
		PreparedStatement prepStatement = conn.prepareStatement(sql);
		prepStatement.setString(1, SECRET_KEY);
		prepStatement.setString(2,username);
		ResultSet resultSet = prepStatement.executeQuery();
		resultSet.next();
		
		user.setId(resultSet.getInt(1));
		user.setUserName(resultSet.getString(2));
		user.setName(resultSet.getString(3));
		user.setPhoneNumber(resultSet.getString(4));
		user.setEmail(resultSet.getString(5));
		user.setPassword(resultSet.getString(6));
		user.setAddress1(resultSet.getString(7));
		user.setAddress2(resultSet.getString(8));
		user.setState(resultSet.getString(9));
		user.setCountry(resultSet.getString(10));
		user.setZipcode(resultSet.getInt(11));
		user.setCardNumber(resultSet.getLong(12));
		user.setCardExpirationDate(resultSet.getDate(13));
		user.setCsv(resultSet.getInt(14));
		
		
		conn.close();
		return user;
	}
	public static boolean checkUser(String username, String password) throws SQLException, NamingException {
		String sql = "select username, AES_DECRYPT(password, ?) from user where (username= ? and password = AES_ENCRYPT(?,?))";
		
		Connection conn = Connector.getConnection();
		PreparedStatement prepStatement = conn.prepareStatement(sql);
		prepStatement.setString(1, SECRET_KEY);
		prepStatement.setString(2, username);
		prepStatement.setString(3, password);
		prepStatement.setString(4, SECRET_KEY);
		ResultSet resultSet = prepStatement.executeQuery();
		if(resultSet.next()) {
			return true;
		}
		else
			return false;
	}
	
	public static LinkedList<Book> getAllBooks() throws  SQLException{
		String sql = "Select * from book;";
		LinkedList<Book> store = new LinkedList<>();
		
		Connection conn = Connector.getConnection();
		PreparedStatement prepStatement = conn.prepareStatement(sql);
		ResultSet result = prepStatement.executeQuery();
		while (result.next()) {
			Book book = new Book(result.getString(2), result.getString(3), result.getInt(4), 
					result.getDouble(5), result.getLong(6));
			book.setId(result.getInt(1));
			book.setEdition(result.getInt(7));
			
			store.add(book);
		}
		
		prepStatement.close();
		result.close();
		conn.close();
		return store;
	}
	
	public static Book getBookById(int id) throws SQLException {
		String sql = "select * from book where idbook = ?;";
		
		Connection conn = Connector.getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setInt(1, id);
		ResultSet resultSet = preparedStatement.executeQuery();
		resultSet.next();
		
		Book book = new Book(resultSet.getString(2), resultSet.getString(3), resultSet.getInt(4), resultSet.getDouble(5), resultSet.getLong(6));
		book.setId(id);
		book.setEdition(resultSet.getInt(7));
		
		preparedStatement.close();
		resultSet.close();
		conn.close();
		
		return book;
	}
	
	public static boolean isUserNameAvailable(String username) throws SQLException {
		String sql = "select * from user where username = ?;";
		
		Connection conn = Connector.getConnection();
		PreparedStatement preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, username);
		ResultSet resultSet = preparedStatement.executeQuery();
		boolean b = resultSet.next();
		
		resultSet.close();
		preparedStatement.close();
		conn.close();
		
		return b;
	}
	
	public static void registerOrder(Order order) throws SQLException {
		String sqlOrder = "insert into order (book_id, user_id, date, quantity_bought)"
				+ "values(?,?,?,?)";
		String sqlUpdateBookQt = "update book set quantity = ?-? where idBook = ?;";
		
		Connection conn = Connector.getConnection();
		PreparedStatement preparedStatement_1 = conn.prepareStatement(sqlOrder);
		preparedStatement_1.setInt(1, order.getBook().getId());
		preparedStatement_1.setInt(2, order.getUser().getId());
		preparedStatement_1.setInt(3, order.getQuantityOrdered());
		preparedStatement_1.setTimestamp(4, order.getDateTime());
		
		preparedStatement_1.executeUpdate();
		preparedStatement_1.close();
		
		PreparedStatement preparedStatement_2 = conn.prepareStatement(sqlUpdateBookQt);
		preparedStatement_2.setInt(1, order.getBook().getQuantity());
		preparedStatement_2.setInt(2, order.getQuantityOrdered());
		preparedStatement_2.setInt(3, order.getBook().getId());
		
		preparedStatement_2.executeUpdate();
		preparedStatement_2.close();
	}
	
}
