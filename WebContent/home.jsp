<%@page import="com.bookstore.controls.DBManager"%>
<%@page import="com.bookstore.models.*" %>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Store</title>

<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="semantic/dist/jquery-3.1.1.min.js"></script>
<script src="semantic/dist/semantic.min.js"></script>

</head>
<body>
<%!
String username = "";
LinkedList<Book> books = null;
%>
<%
books = DBManager.getAllBooks();
username = request.getParameter("username_trans");
%>
<!-- Menu -->
	<div class="ui secondary fixed menu">
		<a class="item"> Home </a> <a class="item"> User Info </a> 
		<div class="right menu">
			<div class="item">
				<div class="ui icon input">
					<input type="text" placeholder="Search..."> <i
						class="search link icon"></i>
				</div>
			</div>
			<a class="ui item active"> Logout </a>
		</div>
	</div>

<!-- Body -->
<div class="ui grid">
  <div class="three wide column"></div>
  <div class="ten wide column">
  <%
  	for(Book book:books){
  		%><div class="ui card">
				<div class="image">
					<img src="bookImages/<%= book.getIsbn()%>.jpg">
				</div>
				<div class="content">
					<a class="header"><%= book.getTitle() %></a>
					<div class="meta">
						<span class="date">Author: <%= book.getAuthor()%></span>
					</div>
					<div class="description">
						ISBN: <%= book.getIsbn() %></br>
						In Stock: <%=book.getQuantity() %></br>
						Price: $<%= book.getUnitPrice() %></br>
						<%if (book.getEdition()== 0 || book.getEdition()== 1)
							out.println("Edition: 1 </br>");
						else
							out.println("Edition: "+book.getEdition());
						%></br>
					</div>
				</div>
				<div class="extra content">
					<button class="ui primary button">Buy</button>
				</div>
			</div><%
  	}
  %>
  </div>
  <div class="three wide column"></div>
</div>
</body>
</html>