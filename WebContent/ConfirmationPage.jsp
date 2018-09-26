<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.bookstore.models.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thank you!</title>
<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="semantic/dist/jquery-3.1.1.min.js"></script>
<script src="semantic/dist/semantic.min.js"></script>
</head>
<body>
<%!
String deliveryDate = "";
User userLogged;
Book bookBought;
%>
<%
userLogged = (User)request.getAttribute("userLogged");
bookBought = (Book)request.getAttribute("bookBought");
%>
<div class="section">
    <p class ="Shipped">Your order has been shipped!</p>
    
    <p class="Delivery">Delivery Data: Will arrive in 4 days.</p>
</div>
<div class="returnhome">
    <button onclick ="location.href='{homepageurl}';">Return Home</button>
    
</div>
</body>
</html>