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
	private String appName = "website"; 
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
					<input class="uk-input" type="text" placeholder="Phone Number" name ="phoneNumber" value="<%if(phoneNumber!=null) out.print(phoneNumber); %>">
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
					<p style = "color:red;">${errorPassword}</p>
				</div>
				
				<input type = "submit" value="Validate" class="uk-button uk-button-primary">
			</form>
		</div>
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
        	  username: {
                  identifier  : 'username',
                  rules: [
                    {
                      type   : 'empty',
                      prompt : '- Please enter your username'
                    }
                  ]
                },
                name: {
                    identifier  : 'name',
                    rules: [
                      {
                        type   : 'empty',
                        prompt : '- Please enter your name'
                      }
                    ]
                  },
                  phoneNumber: {
                      identifier  : 'phone_number',
                      rules: [
                        {
                          type   : 'empty',
                          prompt : '- Please enter your phone number'
                        }
                      ]
                    },
            email: {
              identifier  : 'email',
              rules: [
                {
                  type   : 'empty',
                  prompt : '- Please enter your e-mail'
                },
                {
                  type   : 'email',
                  prompt : '- Please enter a valid e-mail'
                }
              ]
            },
            password: {
              identifier  : 'password',
              rules: [
                {
                  type   : 'empty',
                  prompt : '- Please enter your password'
                },
                {
                  type   : 'length[6]',
                  prompt : '- Your password must be at least 6 characters'
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
	<div class="ui three column doubling stackable grid container">
		<div class="five wide column"></div>
		<div class="six wide column">
			<h2 class="ui teal image header">
				<div class="content">Create an account</div>
			</h2>
			
			<form class="ui large form" method="post" action="<%out.println(appName);%>/RegisterServlet">
				<div class="ui stacked segment">
				<h4 class="ui dividing header">User Information</h4>
					<div class="field">
					<label>UserName</label>
						<input type="text" name="username" placeholder="UserName" value = "${username}">
					</div>
					<div class="field">
					<label>Name</label>
						<input type="text" name="name" placeholder="Name" value = "${name}">
					</div>
					<div class="field">
					<label>E-mail</label>
						<input type="text" name="email" placeholder="E-mail" value = "${e_mail}">
					</div>
					<div class="field">
					<label>Phone Number</label>
						<input type="text" name="phoneNumber" placeholder="Phone Number" value ="${phone_number}">
					</div>
					<div class="field">
					<label>Password</label>
						<input type="password" name="password" placeholder="Password">
					</div>
					<div class="field">
					<label>Confirm Password</label>
						<input type="password" name="re_password" placeholder="Password">
					</div>
					<div class="ui fluid large teal submit button">Create</div>
				</div>

				<div class="ui error message"></div>

			</form>
			<div class="ui error message">
			${errorMessageUserName }</br>
			${errorMessagePhoneNumber}
			</div>
			<div class="ui message">
				Already have an account? <a href="login.jsp">Log in</a>
			</div>
		</div>
		<div class="five wide column"></div>
>>>>>>> 1971583539dd244dda1ec0ab41cec290672510fd
	</div>
</body>
</html>