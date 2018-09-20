package com.secureSoftwareDev.project.model;

public class Book {
	private int id;
	private String title;
	private String author;
	private int unitPrice;
	private int quantity;
	private int isbn;	
	
	public Book(String title, String author, int unitPrice, int quantity, int isbn) {
		super();
		this.title = title;
		this.author = author;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.isbn = isbn;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getIsbn() {
		return isbn;
	}
	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}
	
	
}
