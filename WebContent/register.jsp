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
	private String appName = "Template"; 
	private String name = "";
	private String eMail = "";
	private String phoneNumber = "";
	private String userName = "";
%>
<%
	try{
		name = (String) request.getAttribute("name");
		eMail = (String)request.getAttribute("e_mail");
		phoneNumber = (String)request.getAttribute("phone_number");
		userName = (String)request.getAttribute("username");
	}catch(NullPointerException exp){
		
	}
%>
	<div style="max-width: 1024px; margin: auto;">
		<div
			class="uk-card uk-card-default uk-card-body uk-width-1-2@m uk-position-top-center">
			<a href = "login.jsp"><button class="uk-button uk-button-default uk-button-small">Back to Log-In</button></a>
			<h3 class="uk-card-title">Register</h3>
			<p style ="color:red;">${errorMessage}</p>
			
			<!-- beginning of the form -->
			<form action="/<%out.print(appName);%>/RegistrationServlet" method = "post">
				<div class="uk-margin">
					<input class="uk-input" type="text" placeholder="Name" name = "name" value="<%if(name!=null) out.print(name); %>">
				</div>
				<div class="uk-margin">
					<input class="uk-input" type="text" placeholder="E-mail" name = "e_mail" value="<%if(eMail!=null) out.print(eMail); %>">
					<p style = "color:red;">${errorMessageMail}</p>
				</div>
				<div class="uk-margin">
					<input class="uk-input" type="text" placeholder="Phone Number" name ="phone_number" value="<%if(phoneNumber!=null) out.print(phoneNumber); %>">
					<p style ="color:red;">${errorMessagePhoneNumber}</p>
				</div>
				<div class="uk-margin">
					<input class="uk-input" type="text" placeholder="Username" name = "username" value="<%if(userName!=null) out.print(userName); %>">
				</div>
				<div class="uk-margin">
					<input class="uk-input" type="password" placeholder="Password" name ="password">
				</div>
				<div class="uk-margin">
					<input class="uk-input" type="password" placeholder="Confirm password" name ="re_password">
				</div>
				
				<input type = "submit" value="Validate" class="uk-button uk-button-primary">
			</form>
		</div>
	</div>
</body>
</html>