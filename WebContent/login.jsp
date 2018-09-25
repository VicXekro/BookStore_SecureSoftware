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
<%! private String appName = "website"; %>
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
=======
<title>Book Store</title>

<link rel="stylesheet" type="text/css" href="semantic/dist/semantic.min.css">
<script src="semantic/dist/jquery-3.1.1.min.js"></script>
<script src="semantic/dist/semantic.min.js"></script>

 <style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: -100px;
    }
    .column {
      max-width: 450px;
    }
  </style>
  <script>
  $(document)
    .ready(function() {
      $('.ui.form')
        .form({
          fields: {
            email: {
              identifier  : 'username',
              rules: [
                {
                  type   : 'empty',
                  prompt : '- Please enter a username'
                }
              ]
            },
            password: {
              identifier  : 'password',
              rules: [
                {
                  type   : 'empty',
                  prompt : '- Please enter your password'
                }
              ]
            }
          }
        })
      ;
    })
  ;
  </script>
  
</head>
<body>
<%!String appName = "/BookStore_"; %>
	<div class="ui middle aligned center aligned grid">
		<div class="column">
			<h2 class="ui teal image header">
				<div class="content">Log-in to your account</div>
			</h2>
			<form class="ui large form" method = "post" action = "<%out.print(appName);%>/LoginServlet">
				<div class="ui stacked segment">
					<div class="field">
						<div class="ui left icon input">
							<i class="user icon"></i> <input type="text" name="username"
								placeholder="Username">
						</div>
					</div>
					<div class="field">
						<div class="ui left icon input">
							<i class="lock icon"></i> <input type="password" name="password"
								placeholder="Password">
						</div>
					</div>
					<div class="ui fluid large teal submit button">Login</div>
				</div>

				<div class="ui error message"></div>

			</form>
			<div class="ui error message"><ul><li>${errorMessage}</li></ul></div>
			<div class="ui message">
				New to us? <a href="register.jsp">Sign Up</a>
			</div>
>>>>>>> 1971583539dd244dda1ec0ab41cec290672510fd
		</div>
	</div>
</body>
</html>