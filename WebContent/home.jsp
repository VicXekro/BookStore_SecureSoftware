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
</body>
</html>