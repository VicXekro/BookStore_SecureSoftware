<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.bookstore.models.*" %>
<%@page import="java.util.*" %>
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
Date deliveryDate;
int quantity;
User userLogged;
Book bookBought;
%>
<%
quantity = (Integer)request.getAttribute("quantityB");
deliveryDate = (Date)request.getAttribute("deliveryDate_");
userLogged = (User)request.getAttribute("userLogged_");
bookBought = (Book)request.getAttribute("bookBought_");
%>
	<div class="ui grid">
		<div class="four wide column"></div>
		<div class="ten wide column">
		<h2>Order Confirmation</h2>
		<h4>Dear <%= userLogged.getName() %>;</h4>
		<p>Your Order: </p>
		<p><%=bookBought.getTitle() %> by <%=bookBought.getAuthor() %></p>
		<p>Quantity = <%=quantity %></br>
		   Total price = <%double price = quantity * bookBought.getUnitPrice(); out.print("$ "+price); %></br>
		   Is on it's way. ETA: <%=deliveryDate %>
		</p>
			<form action="${pageContext.request.contextPath}/ConfirmationServlet" method="POST">
				<input name="username_" value="<%=userLogged.getUserName()%>"
					type="hidden"> 
					<input type="submit" value="Back to Homepage" name="back" class="ui primary button">
			</form>
		</div>
		<div class="four wide column"></div>
	</div>
</body>
</html>