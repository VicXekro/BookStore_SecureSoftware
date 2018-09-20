<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/uikit.min.css" />
<script src="js/uikit.min.js"></script>
<script src="js/uikit-icons.min.js"></script>
</head>
<body>
<%!

%>
<!-- Navigation bar -->
	<div
		uk-sticky="sel-target: .uk-navbar-container; cls-active: uk-navbar-sticky; bottom: #transparent-sticky-navbar">
		<nav class="uk-navbar-container" uk-navbar
			style="position: relative; z-index: 980;">
			<div class = "uk-navbar-left">
				<ul class="uk-navbar-nav">
				<li><a ><button class="uk-button uk-button-default">Back Home</button></a>
				</ul>
			</div>
			<div class="uk-navbar-right">

				<ul class="uk-navbar-nav">
					<li><button  class="uk-button uk-button-default">User_name</button></li>
					<li><button class="uk-button uk-button-danger">Log Out</button></li>
				</ul>
			</div>
		</nav>
	</div>
	
	<div style="max-width: 1024px; margin: auto;">
	<!-- body -->
		<!-- User info -->
		<div class="uk-grid-small uk-grid-match" uk-grid>

			<div class="uk-card uk-card-default uk-card-body ">
				<h3 class="uk-card-title">User Information</h3><button class = "uk-button uk-button-primary uk-button-small uk-width-small">Edit</button>
				<div class="uk-margin">
					<label class="uk-form-label" for="form-stacked-text">Username</label>
					<input class="uk-input" type="text" placeholder="disabled"
						value="disabled" disabled>
				</div>
				<div class="uk-margin">
					<label class="uk-form-label" for="form-stacked-text">Name</label> <input
						class="uk-input" type="text" placeholder="disabled"
						value="disabled" disabled>
				</div>
				<div class="uk-margin">
					<label class="uk-form-label" for="form-stacked-text">E-mail</label>
					<input class="uk-input" type="text" placeholder="disabled"
						value="disabled" disabled>
				</div>
				<div class="uk-margin">
					<label class="uk-form-label" for="form-stacked-text">Phone-number</label>
					<input class="uk-input" type="text" placeholder="disabled"
						value="disabled" disabled>
				</div>
			</div>

			<!-- Address Info -->
			<div class="uk-card uk-card-default uk-card-body ">
				<h3 class="uk-card-title">Address Information</h3>
				<p uk-margin>
					<button
						class="uk-button uk-button-primary uk-button-small uk-width-small">Edit</button>
					<button
						class="uk-button uk-button-danger uk-button-small uk-width-small">Delete</button>
				</p>
				<div class="uk-margin">
					<label class="uk-form-label" for="form-stacked-text">Address 1</label>
					<input class="uk-input" type="text" placeholder="disabled"
						value="disabled" disabled>
				</div>
				<div class="uk-margin">
					<label class="uk-form-label" for="form-stacked-text">Address 2</label>
					 <input class="uk-input" type="text"
						placeholder="disabled" value="disabled" disabled>
				</div>
				
				<div class="uk-margin">
					<label class="uk-form-label" for="form-stacked-text">Town</label>
					 <input class="uk-input" type="text"
						placeholder="disabled" value="disabled" disabled>
				</div>
				
				<div class="uk-margin">
					<label class="uk-form-label" for="form-stacked-text">State</label>
					 <input class="uk-input" type="text"
						placeholder="disabled" value="disabled" disabled>
				</div>
				
				<div class="uk-margin">
					<label class="uk-form-label" for="form-stacked-text">Country</label>
					 <input class="uk-input" type="text"
						placeholder="disabled" value="disabled" disabled>
				</div>
			</div>

			<!-- credit card info -->
			<div class="uk-card uk-card-default uk-card-body">
				<h3 class="uk-card-title">Default</h3>
				<p>
					Lorem ipsum <a href="#">dolor</a> sit amet, consectetur adipiscing
					elit, sed do eiusmod tempor incididunt ut labore et dolore magna
					aliqua.
				</p>
			</div>
		</div>
	</div>
</body>
</html>