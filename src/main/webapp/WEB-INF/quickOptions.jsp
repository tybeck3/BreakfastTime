<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/uikit.min.css" />
<script src="/js/uikit.min.js"></script>
<script src="/js/uikit-icons.min.js"></script>
<title>Danish Breakfast Home</title>
</head>
<body>
	<div class="uk-container-expand"> <!--NAVBAR-->
		<nav class="uk-navbar-container" uk-navbar>
			<div class="uk-navbar-left">
				<div class="uk-navbar-item uk-logo">
					A Denmark Breakfast
				</div> 
			</div>
			<div class="uk-navbar-right">
			<ul class="uk-navbar-nav">
				<li class="uk-active">
					<a href="/home">HOME</a>
				</li>
				<li>
					<a href="/checkout">CART (<c:out value="${cart.cartItems.size()}"/>)</a>
				</li>
				<li>
					<a href="/account/<c:out value='${loggedUser.id}'/>">ACCOUNT</a> 
				</li>
				<li>
					<a href="/logout">LOGOUT</a>
				</li>
			</ul>
			</div>
		</nav>
	</div>
	<h2 class="uk-text-center">Quick Options</h2>
	<div class="uk-grid-small uk-child-width-expand@s uk-text-center" uk-grid>
			<div class="uk-card uk-card-default uk-card-body">
				<h3>Danish Pancakes</h3>
				<form action="/customize/1">
					<button class= "uk-button-secondary uk-button-small">Customize</button>
				</form>
			</div>
			<div class="uk-card uk-card-default uk-card-body">
				<h3>Ableskievers</h3>
				<form action="/customize/2">
					<button class= "uk-button-secondary uk-button-small">Customize</button>
				</form>
			</div>
			<div class="uk-card uk-card-default uk-card-body">
				<h3>I Don't Want Those</h3>
				<form action="/addToCart/3">
					<button class= "uk-button-secondary uk-button-small">Just Give Me A Bagel</button>
				</form>
			</div>
	</div>
</body>
</html>