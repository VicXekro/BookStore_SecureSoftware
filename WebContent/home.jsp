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
User user_logged = null;
LinkedList<Book> books = null;
%>
<%
books = DBManager.getAllBooks();
user_logged = (User)request.getAttribute("username_trans");
%>
<!-- Menu -->
	<div class="ui secondary fixed menu" style = "background-color: white;">
		<a class="item"> Home </a> <a class="item"> User Info </a> 
		<div class="right menu">
			<a class="ui item active"> Logout </a>
		</div>
	</div>

<!-- Body -->
<div class="ui grid">
  <div class="three wide column"></div>
  <div class="ten wide column">
  <div class="ui link cards">
  <%
  	for(Book book:books){
  		%><div class="card">
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
				<form action = "${pageContext.request.contextPath}/HomeServlet" method = "post">
					<input name = "user_name" value = "<%= user_logged.getUserName() %>" type = "hidden">
					<input name = "book_id" value = "<%= book.getId()%>" type = "hidden">
					<input class="ui primary button" value = "Buy" type = "submit" name = "buyButton">
				</form>
				</div>
			</div><%
  	}
  %>
  </div>
  </div>
  <div class="three wide column"></div>
</div>
</body>
</html>