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

<script>
  $(document)
    .ready(function() {
      $('.ui.form')
        .form({
          fields: {
        	  quantityOrdered: {
              identifier  : 'quantityOrdered',
              rules: [
                {
                  type   : 'empty',
                  prompt : '- Please enter a quantity'
                }
              ]
            },
            shipping_address: {
              identifier  : 'shipping[address]',
              rules: [
                {
                  type   : 'empty',
                  prompt : '- Please enter your address'
                }
              ]
            },
            state:{
            	identifier  : 'state',
                rules: [
                  {
                    type   : 'empty',
                    prompt : '- Please enter your State'
                  }
                ]
            },
            zip_code:{
            	identifier  : 'zip_code',
                rules: [
                  {
                    type   : 'empty',
                    prompt : '- Please enter your Zip Code'
                  }
                ]
            },
            country:{
            	identifier  : 'country',
                rules: [
                  {
                    type   : 'empty',
                    prompt : '- Please enter your Country'
                  }
                ]
            },
            card_number:{
            	identifier  : 'card[number]',
                rules: [
                  {
                    type   : 'empty',
                    prompt : '- Please enter your card number'
                  },
                  {
                      type   : 'length[16]',
                      prompt : '- Your card number should be 16 digits'
                    }
                ]
            },
            cvc:{
            	identifier  : 'card[cvc]',
                rules: [
                  {
                    type   : 'empty',
                    prompt : '- Please enter your CVC number. It\'s a 3 digits number at the back of your card'
                  },
                  {
                      type   : 'length[3]',
                      prompt : '- Your cvc should be 3 digits'
                    }
                ]
            },
            card_exp_month:{
            	identifier  : 'card[expire-month]' ,
                rules: [
                  {
                    type   : 'empty',
                    prompt : '- Please enter the expiration month of your card'
                  },
                  {
                      type   : 'length[2]',
                      prompt : '- month is 2 digits'
                    }
                ]
            },
            card_exp_year:{
            	identifier  : 'card[expire-year]',
                rules: [
                  {
                    type   : 'empty',
                    prompt : '- Please enter the expiration year of your card'
                  },
                  {
                      type   : 'length[4]',
                      prompt : '- month is 4 digits'
                    }
                ]
            }
          }
        })
      ;
    })
  ;
  </script>
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
			<button onclick ="callBack()" class="ui button">Cancel Order</button>
			<button onclick ="logOut()" class="ui button">Logout </button>
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
						<label>Quantity*</label> 
						<input type="number" name = "quantityOrdered" placeholder="Quantity Ordered" onkeyup="updatePrice()">
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
								placeholder="Name" value = "<%= userLogged.getName()%> " disabled>
						</div>
				</div>
				<div class="field">
					<label>Contact info</label>
					<div class = "fields">
						<div class="eight wide field">
							<input type="text" name="phoneNumber"
								placeholder="Phone Number" value = "<%= userLogged.getPhoneNumber()%>" disabled>
						</div>
						<div class="eight wide field">
							<input type="text" name="eMail"
								placeholder="E-mail" value = "<%= userLogged.getEmail()%>" disabled>
						</div>
					</div>
				</div>
				<div class="field">
					<label>Billing Address*</label>
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
						<label>State*</label> 
						<input type="text" name = "state" placeholder="State" value ="<%if(userLogged.getState()!=null) out.print(userLogged.getState());%>">
					</div>
					<div class="field">
						<label>Zip Code*</label>
						<input type="number" maxlength = "5" name = "zip_code" placeholder="Zip Code" value = "<%if(userLogged.getZipcode()!=0) out.print(userLogged.getZipcode());%>">
					</div>
					<div class="field">
						<label>Country*</label>
						<input type = "text" name = "country" placeholder="Country" value = "<%if(userLogged.getCountry()!=null) out.print(userLogged.getCountry());%>">
					</div>
				</div>
				<h4 class="ui dividing header">Billing Information</h4>
				<div class="fields">
					<div class="seven wide field">
						<label>Card Number*</label> <input type="number" name="card[number]"
							maxlength="16" placeholder="Card #" value = "<%if(userLogged.getCardNumber()!=0) out.print(userLogged.getCardNumber());%>">
					</div>
					<div class="three wide field">
						<label>CVC*</label> <input type="number" name="card[cvc]"
							maxlength="3" placeholder="CVC" value = "<%if(userLogged.getCsv()!=0) out.print(userLogged.getCsv());%>">
					</div>
					<div class="six wide field">
						<label>Expiration*</label>
						<div class="two fields">
							<div class="field">
								<input type = "number" name="card[expire-month] " maxlength = "2" placeholder="Month">
							</div>
							/
							<div class="field">
								<input type="number" name="card[expire-year]" maxlength="4"
									placeholder="Year">
							</div>
						</div>
					</div>
				</div>
				<input name="book_id" value = "<%= bookOrdered.getId() %>" type = "hidden">
				<input name="user_name" value ="<%= userLogged.getUserName() %>" type="hidden">
				<div class="ui error message"></div>
				<input type = "submit" value = "Submit Order" class = "ui primary button">
			</form>
			<p style = "color:red;">${errorMessage}</p>
		</div>
  	<div class="three wide column"></div>
 </div>

	<script type="text/javascript">
		function updatePrice() {
			var quantity_str = document.getElementsByName("quantityOrdered")[0].value;
			if (quantity_str != "") {
				var quantity = parseInt(quantity_str);
				var price =
	<%=bookOrdered.getUnitPrice()%>
		* quantity;
				document.getElementsByName("totalPrice")[0].value = "$" + price;
			} else {
				document.getElementsByName("totalPrice")[0].value = "";
			}
		}
	</script>
	<script type="text/javascript">
		function callBack() {
			if (confirm("Do you really want to cancel this order?")) {
				window.history.back();
	<%bookOrdered = null;
			userLogged = null;%>
		}
		}
	</script>
	<script type="text/javascript">
		function logOut() {
			if (confirm("Do you really want to log out?")) {
				location.href = $
				{
					pageContext.request.contextPath
				}
				;
				window.onbeforeunload = function() {
					var input_elems = document.getElementByTagName('input');
					for (var i = 0; i < input_elems.length; i++) {
						if (input_elems[i].type === 'hidden') {
							input_elems[i].innerHTML = "reset_value";
						}
					}
				}
			}
		}
	</script>
</body>
</html>