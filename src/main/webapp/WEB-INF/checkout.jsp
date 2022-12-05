<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/uikit.min.css" />
<script src="js/uikit.min.js"></script>
<script src="js/uikit-icons.min.js"></script>
<title>Checkout</title>
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
				<li>
					<a href="/home">HOME</a>
				</li>
				<li class="uk-active">
					<a href="/checkout">CART (<c:out value="${cart.cartItems.size()}"/>)</a>
				</li>
				<li>
					<a href="/account/<c:out value='${user__id}'/>">ACCOUNT</a> 
				</li>
				<li>
					<a href="/logout">LOGOUT</a>
				</li>
			</ul>
			</div>
		</nav>
	</div>
	<div >
		<table class = "uk-table uk-table-divider">
			<thead>
				<tr>
					<th>Item</th>
					<th>Toppings</th>
					<th>Quantity</th>
					<th>Price</th>
					<th class = "uk-width-small">Remove?</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items = "${cart.cartItems}" var = "item" varStatus = "loop">
				<tr>
					<td>${item.menuItem.name}</td>
					<td>
					<c:forEach items = "${item.toppings}" var = "topping" varStatus = "loop">
						${topping.name} |
					</c:forEach></td>
					<td>${item.quantity}</td>
					<td>$${item.menuItem.cost}</td>
					<td><a href="/remove/${item.id}" class="uk-icon-link" uk-icon="trash"></a></td>
				</tr>
			</c:forEach>
				<tr>
					<td></td>
					<td></td>
					<td>Total:</td>
					<td>$<c:out value="${cart.cost}"/> </td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<form class="uk-form-medium uk-form-width-large uk-form-horizontal uk-padding" method="post" action="/purchase">
			<div class="uk-margin">
				<label class="uk-form-label" for="delivery">Delivery or Carry Out?</label>
				<div>
					<select class="uk-select" name="delivery">
						<option value="FALSE">Carry Out</option>
						<option value="TRUE">Delivery</option>
					</select>
				</div>
			</div>
		    <div class="uk-margin">
		       	<input class="uk-button-danger uk-button-large" type="submit" value="Submit Order"/>
		    </div>
		</form>    
	</div>
</body>
</html>