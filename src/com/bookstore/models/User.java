package com.bookstore.models;

import java.sql.Date;

public class User {
	private int id;
	private String userName;
	private String name;
	private String phoneNumber;
	private String email;
	private String password;
	private String address1;
	private String address2;
	private String state;
	private String country;
	private int zipcode;
	private long cardNumber;
	private int cardExpirationMonth;
	private int cardExpirationYear;
	private int csv;
	
	public User() {}
	
	public User(String userName, String name, String phoneNumber, String email, String password) {
		super();
		this.userName = userName;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public long getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(long cardNumber) {
		this.cardNumber = cardNumber;
	}

	public int getCsv() {
		return csv;
	}

	public void setCsv(int csv) {
		this.csv = csv;
	}

	public int getCardExpirationMonth() {
		return cardExpirationMonth;
	}

	public void setCardExpirationMonth(int cardExpirationMonth) {
		this.cardExpirationMonth = cardExpirationMonth;
	}

	public int getCardExpirationYear() {
		return cardExpirationYear;
	}

	public void setCardExpirationYear(int cardExpirationYear) {
		this.cardExpirationYear = cardExpirationYear;
	}
	
	
}
