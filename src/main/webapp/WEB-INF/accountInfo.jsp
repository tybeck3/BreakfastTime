<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/uikit.min.css" />
<title>My Account</title>
</head>
<body>
	<div class="uk-container-expand">
		<nav class="uk-navbar-container uk-navbar" uk-navbar>
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
					<li>
						<a href="/checkout">CART (<c:out value="${cart.cartItems.size()}"/>)</a>
					</li>
					<li class="uk-active">
						<a href="/account/<c:out value='${loggedUser.id}'/>">ACCOUNT</a> 
					</li>
					<li>
						<a href="/logout">LOGOUT</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="uk-grid-collapse uk-child-width-expand@s uk-margin-large-top" uk-grid>
		<div class="uk-card">
			<div class="uk-background-muted uk-padding">
				<h2>Account Info</h2>
				<form class="uk-form-medium uk-form-width-large uk-form-horizontal" method="POST" action="/register">
				 	<div class="uk-margin">
				     	<label class="uk-form-label" for="firstName">First Name:</label>
				     	<div class="uk-form-controls">
				     		<input class="uk-input" type="text" name="firstName" placeholder="<c:out value='${loggedUser.firstName}'/>"/>
				     	</div>
				 	</div>
				 	<div class="uk-margin">
				     	<label class="uk-form-label" for="lastName">Last Name:</label>
				     	<div class="uk-form-controls">
				     		<input class="uk-input" type="text" name="lastName" placeholder="<c:out value='${loggedUser.lastName}'/>"/>
				     	</div>
				 	</div>
				 	<div class="uk-margin">
				     	<label class="uk-form-label" for="email">Email:</label>
				     	<div class="uk-form-controls">
				     		<input class="uk-input" type="email" name="email" placeholder="<c:out value='${loggedUser.email}'/>"/>
				     	</div>
				 	</div>
				 	<div class="uk-margin">
				     	<label class="uk-form-label" for="address">Address:</label>
				     	<div class="uk-form-controls">
				     		<input class="uk-input" type="text" name="address" placeholder="<c:out value='${loggedUser.address}'/>"/>
				     	</div>
				 	</div>
				 	<div class="uk-margin">
				     	<label class="uk-form-label" for="city">City:</label>
				     	<div class="uk-form-controls">
				     		<input class="uk-input" type="text" name="city" placeholder="<c:out value='${loggedUser.city}'/>"/>
				     	</div>
				 	</div>
				 	<div class="uk-margin">
				     	<label class="uk-form-label" for="state">State:</label>
				     	<div class="uk-form-controls">
							<select class="uk-select" name="state">
								<option value="">Please Select</option>
								<option value="AL">Alabama</option>
								<option value="AK">Alaska</option>
								<option value="AZ">Arizona</option>
								<option value="AR">Arkansas</option>
								<option value="CA">California</option>
								<option value="CO">Colorado</option>
								<option value="CT">Connecticut</option>
								<option value="DE">Delaware</option>
								<option value="DC">District Of Columbia</option>
								<option value="FL">Florida</option>
								<option value="GA">Georgia</option>
								<option value="HI">Hawaii</option>
								<option value="ID">Idaho</option>
								<option value="IL">Illinois</option>
								<option value="IN">Indiana</option>
								<option value="IA">Iowa</option>
								<option value="KS">Kansas</option>
								<option value="KY">Kentucky</option>
								<option value="LA">Louisiana</option>
								<option value="ME">Maine</option>
								<option value="MD">Maryland</option>
								<option value="MA">Massachusetts</option>
								<option value="MI">Michigan</option>
								<option value="MN">Minnesota</option>
								<option value="MS">Mississippi</option>
								<option value="MO">Missouri</option>
								<option value="MT">Montana</option>
								<option value="NE">Nebraska</option>
								<option value="NV">Nevada</option>
								<option value="NH">New Hampshire</option>
								<option value="NJ">New Jersey</option>
								<option value="NM">New Mexico</option>
								<option value="NY">New York</option>
								<option value="NC">North Carolina</option>
								<option value="ND">North Dakota</option>
								<option value="OH">Ohio</option>
								<option value="OK">Oklahoma</option>
								<option value="OR">Oregon</option>
								<option value="PA">Pennsylvania</option>
								<option value="RI">Rhode Island</option>
								<option value="SC">South Carolina</option>
								<option value="SD">South Dakota</option>
								<option value="TN">Tennessee</option>
								<option value="TX">Texas</option>
								<option value="UT">Utah</option>
								<option value="VT">Vermont</option>
								<option value="VA">Virginia</option>
								<option value="WA">Washington</option>
								<option value="WV">West Virginia</option>
								<option value="WI">Wisconsin</option>
								<option value="WY">Wyoming</option>
							</select>
				     	</div>
				 	</div>
				 	<div class="uk-margin">
				 		<input class= "uk-button-primary uk-button-large" type="submit" value="Update"/>
				 	</div>
				</form>
			</div>
		</div>
		<div class = "uk-card">
		
			<div class="uk-background-secondary uk-padding">
				<h2 class="uk-light uk-text-primary">Past Orders</h2>
					<div>
						<c:forEach items = "${orders}" var = "order" varStatus = "loop">
						<h3 class = "uk-text-muted">Ordered on: <fmt:formatDate pattern="dd-MM-yyyy" value="${order.createdAt}"/></h3>
						<table class = "uk-table">
							<thead>
								<tr>
									<th class="uk-width-large">Item</th>
									<th class="uk-width-expand">Toppings</th>
									<th class="uk-width-small">Method</th>
									<th class="uk-width-small">Quantity</th>
									<th class="uk-width-small">Price</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items = "${order.cart.cartItems}" var = "item" varStatus = "loop">
							<tr>
								<td>${item.menuItem.name}</td>
								<td>
								<c:forEach items = "${item.toppings}" var = "topping" varStatus = "loop">
									${topping.name}
								</c:forEach></td>
								<td>
								<c:choose>
								<c:when test="${order.cart.delivery == true}">Delivery</c:when>
								<c:otherwise>Carry Out</c:otherwise>
								</c:choose>
								</td>
								<td>${item.quantity}</td>
								<td>$${item.menuItem.cost}</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						</c:forEach>
					</div>
			</div>
		</div>
	</div>
</body>
</html>