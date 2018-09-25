<<<<<<< HEAD
=======
<%@page import="com.bookstore.controls.DBManager"%>
<%@page import="com.bookstore.models.*" %>
<%@page import="java.util.LinkedList"%>
>>>>>>> 1971583539dd244dda1ec0ab41cec290672510fd
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<<<<<<< HEAD
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/uikit.min.css" />
<script src="js/uikit.min.js"></script>
<script src="js/uikit-icons.min.js"></script>
</head>
<body>
<%!
private String userName;
%>
	<!-- Navigation bar -->
	<div
		uk-sticky="sel-target: .uk-navbar-container; cls-active: uk-navbar-sticky; bottom: #transparent-sticky-navbar">
		<nav class="uk-navbar-container" uk-navbar
			style="position: relative; z-index: 980;">
			<div class="uk-navbar-right">

				<ul class="uk-navbar-nav">
					<li><button  class="uk-button uk-button-default"><%out.println(userName); %></button></li>
					<li><button class="uk-button uk-button-danger">Log Out</button></li>
				</ul>
			</div>
		</nav>
	</div>
	
	<div style="max-width: 1024px; margin: auto;">

		<!-- body -->
		<table class="uk-table">
			<caption></caption>
			<thead>
				<tr>
					<th></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td></td>
				</tr>
			</tfoot>
			<tbody>
				<tr>
					<td>
						<div>
							<div class="uk-card uk-card-default">
								<div class="uk-card-media-top">
									<img src="images/light.jpg" alt="">
								</div>
								<div class="uk-card-body">
									<h3 class="uk-card-title">Media Top</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
										sed do eiusmod tempor incididunt.</p>
								</div>
							</div>
						</div>
					</td>

					<td>
						<div>
							<div class="uk-card uk-card-default">
								<div class="uk-card-media-top">
									<img src="images/light.jpg" alt="">
								</div>
								<div class="uk-card-body">
									<h3 class="uk-card-title">Media Top</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
										sed do eiusmod tempor incididunt.</p>
								</div>
							</div>
						</div>
					</td>
					<td>
						<div>
							<div class="uk-card uk-card-default">
								<div class="uk-card-media-top">
									<img src="images/light.jpg" alt="">
								</div>
								<div class="uk-card-body">
									<h3 class="uk-card-title">Media Top</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
										sed do eiusmod tempor incididunt.</p>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
=======
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
>>>>>>> 1971583539dd244dda1ec0ab41cec290672510fd
</body>
</html>