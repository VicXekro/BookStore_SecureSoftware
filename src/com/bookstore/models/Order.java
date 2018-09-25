package com.bookstore.models;

import java.sql.Timestamp;;

public class Order {
	private Timestamp dateTime;
	private User user;
	private Book book;
	private int quantityOrdered;
	private String deliveryDate;

	public Order() {}

	public Order(Timestamp dateTime, User user, Book book, int quantityOrdered) {
		super();
		this.dateTime = dateTime;
		this.user = user;
		this.book = book;
		this.quantityOrdered = quantityOrdered;
	}

	public Timestamp getDateTime() {
		return dateTime;
	}

	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getQuantityOrdered() {
		return quantityOrdered;
	}

	public void setQuantityOrdered(int quantityOrdered) {
		this.quantityOrdered = quantityOrdered;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

}
