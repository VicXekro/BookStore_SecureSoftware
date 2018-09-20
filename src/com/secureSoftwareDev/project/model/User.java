package com.secureSoftwareDev.project.model;

public class User {
	private int id;
	private String name;
	private String eMail;
	private String phoneNumber;
	private String userName;
	private String password;
	
	public User(String name, String eMail, String phoneNumber, String userName, String password) {
		super();
		this.name = name;
		this.eMail = eMail;
		this.phoneNumber = phoneNumber;
		this.userName = userName;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
