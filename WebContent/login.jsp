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
	<div class="ui middle aligned center aligned grid">
		<div class="column">
			<h2 class="ui teal image header">
				<div class="content">Log-in to your account</div>
			</h2>
			<form class="ui large form" method = "post" action = "${pageContext.request.contextPath}/LoginServlet">
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
		</div>
	</div>
</body>
</html>