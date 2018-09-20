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
<%! private String appName = "Template"; %>
	<div style="max-width: 1024px; margin: auto;">
		<div class="uk-card uk-card-default uk-card-body uk-width-1-2@m uk-position-top-center">
			<h3 class="uk-card-title">Log-In</h3>
			<p style="color:red;">${errorMessage}</p>
			<!-- beginning of the form -->
			<form action = "/<%out.print(appName); %>/LoginServlet" method="post">
				<div  class="uk-margin">
					<input class="uk-input" type="text" placeholder="Username" name = "Username">
				</div>
				<div  class="uk-margin">
					<input class="uk-input" type="password" placeholder="Password" name = "Password">
				</div>
				<input type = "submit" value="Connect" class="uk-button uk-button-primary">
				<a href="register.jsp">Not an account yet?</a>
			</form>
		</div>
	</div>
</body>
</html>