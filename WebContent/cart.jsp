<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.bookstore.controls.DBManager"%>
<%@page import="com.bookstore.models.*" %>
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
<%!Book bookOrdered = new Book();
	User userLogged = new User();
%>
<%
bookOrdered = (Book)request.getAttribute("bookSelected");
userLogged = (User)request.getAttribute("userLogged");
%>
<!-- Menu -->
	<div class="ui secondary fixed menu" style = "background-color: white;">
		<div class="right menu">
			<a class="ui item active"> Cancel Order </a>
			<a class="ui item active"> Logout </a>
		</div>
	</div>
<div class="ui grid">
	<div class="three wide column"></div>
  	<div class="ten wide column">
			<form class="ui form" method="post" action = "${pageContext.request.contextPath}/CartServlet">
				<h4 class="ui dividing header">Product Information</h4>
				<div class="field">
					<label><%=bookOrdered.getTitle() %> by <%= bookOrdered.getAuthor() %></label>
					<input type="image" src ="bookImages/<%= bookOrdered.getIsbn()%>.jpg" width="100px">
					<label>Unit Price: $<%= bookOrdered.getUnitPrice()%></label>
					<label>In Stock: <%= bookOrdered.getQuantity()%></label>
				</div>
				<div class="two fields">
					<div class="field">
						<label>Quantity</label> 
						<input type="number" name = "quantityOrdered" placeholder="Qantity Ordered" onkeyup="updatePrice()">
					</div>
					<div class="field">
						<label>Total Price</label>
						<input type="text" name = "totalPrice" placeholder="Total Price" disabled>
					</div>
				</div>
				<h4 class="ui dividing header">Shipping Information</h4>
				<div class="field">
					<label>Name</label>
						<div class="field">
							<input type="text" name="name"
								placeholder="Name" value = "<%= userLogged.getName()%>">
						</div>
				</div>
				<div class="field">
					<label>Contact info</label>
					<div class = "fields">
						<div class="eight wide field">
							<input type="text" name="phoneNumber"
								placeholder="Phone Number" value = "<%= userLogged.getPhoneNumber()%>">
						</div>
						<div class="eight wide field">
							<input type="text" name="eMail"
								placeholder="E-mail" value = "<%= userLogged.getEmail()%>">
						</div>
					</div>
				</div>
				<div class="field">
					<label>Billing Address</label>
					<div class="fields">
						<div class="twelve wide field">
							<input type="text" name="shipping[address]"
								placeholder="Street Address" value = "<%if(userLogged.getAddress1()!=null) out.print(userLogged.getAddress1());%>">
						</div>
						<div class="four wide field">
							<input type="text" name="shipping[address-2]" placeholder="Apt #" value = "<%if(userLogged.getAddress2()!=null) out.print(userLogged.getAddress2());%>">
						</div>
					</div>
				</div>
				<div class="three fields">
					<div class="field">
						<label>State</label> 
						<input type="text" name = "state" placeholder="State" value ="<%if(userLogged.getState()!=null) out.print(userLogged.getState());%>">
					</div>
					<div class="field">
						<label>Zip Code</label>
						<input type="number" name = "zip_code" placeholder="Zip Code" value = "<%if(userLogged.getZipcode()!=0) out.print(userLogged.getZipcode());%>">
					</div>
					<div class="field">
						<label>Country</label>
						<input type = "text" name = "country" placeholder="Country" value = "<%if(userLogged.getCountry()!=null) out.print(userLogged.getCountry());%>">
					</div>
				</div>
				<h4 class="ui dividing header">Billing Information</h4>
				<div class="fields">
					<div class="seven wide field">
						<label>Card Number</label> <input type="number" name="card[number]"
							maxlength="16" placeholder="Card #" value = "<%if(userLogged.getCardNumber()!=0) out.print(userLogged.getCardNumber());%>">
					</div>
					<div class="three wide field">
						<label>CVC</label> <input type="number" name="card[cvc]"
							maxlength="3" placeholder="CVC" value = "<%if(userLogged.getCsv()!=0) out.print(userLogged.getCsv());%>">
					</div>
					<div class="six wide field">
						<label>Expiration</label>
						<div class="two fields">
							<div class="field">
								<select class="ui fluid search dropdown"
									name="card[expire-month]">
									<option value="">Month</option>
									<option value="1">January</option>
									<option value="2">February</option>
									<option value="3">March</option>
									<option value="4">April</option>
									<option value="5">May</option>
									<option value="6">June</option>
									<option value="7">July</option>
									<option value="8">August</option>
									<option value="9">September</option>
									<option value="10">October</option>
									<option value="11">November</option>
									<option value="12">December</option>
								</select>
							</div>
							<div class="field">
								<input type="text" name="card[expire-year]" maxlength="4"
									placeholder="Year">
							</div>
						</div>
					</div>
				</div>
				<div class="ui button" tabindex="0">Submit Order</div>
			</form>
		</div>
  	<div class="three wide column"></div>
 </div>
 
 <script type="text/javascript">
 	function updatePrice() {
		var quantity_str = document.getElementsByName('quantityOrdered')[0].value;
		if(quantity_str != ""){
			var quantity = parseInt(quantity_str);
			var price = <%=bookOrdered.getUnitPrice()%> * quantity;
			document.getElementsByName('totalPrice')[0].value ="$"+ price;
		}else{
			document.getElementsByName('totalPrice')[0].value ="";
		}
	}
 </script>
</body>
</html>