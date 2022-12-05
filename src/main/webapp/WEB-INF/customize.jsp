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
<title>Order Customization</title>
</head>
<body>
	<div class="uk-container-expand">
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
	<h2 class="uk-text-center">Customize your <c:out value="${menuItem.name}"/> </h2>
	<div class="uk-padding">
		
		<form class="uk-form-medium uk-form-width-large uk-form-horizontal" action="/addToCart/${menuItem.id}" method="POST">
			<div class="uk-margin">
				<label for="quantity">Quantity</label>
				<div>
					<input class="uk-input" type="number" name="quantity" value="1"/>
				</div>
			</div>
			<c:forEach items="${toppings}" var="topping" varStatus="loop">			
			<div class="uk-margin">
				<input class="uk-checkbox" type="checkbox" name="${topping.id}"/>
				<label for="${topping.id}">${topping.name}</label>
				
			</div>
			</c:forEach>
			
			<div class="uk-margin">
				<button class= "uk-button-primary uk-button-small">Add to Order</button>
			</div>
		</form>
	</div>
</body>
</html>