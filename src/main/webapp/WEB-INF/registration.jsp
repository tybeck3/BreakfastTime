<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/uikit.min.css" />
        <script src="js/uikit.min.js"></script>
        <script src="js/uikit-icons.min.js"></script>
    <title>Danish Breakfast Registration</title>
</head>
<body>
<div class="uk-container-expand">
		<nav class="uk-navbar-container" uk-navbar>
			<div class="uk-navbar-left">
				<div class="uk-navbar-item uk-logo">
					A Denmark Breakfast
				</div> 
			</div>
			<div class="uk-navbar-center">
				<div class="uk-logo">Register</div>
			</div>
			<div class="uk-navbar-right">
			<ul class="uk-navbar-nav">
				<li>
					<a href="/login">Already have an account? Login Here</a>
				</li>
			</ul>
			</div>
		</nav>
	<div>
		<form:form class="uk-form-large uk-form-width-large uk-margin-large uk-form-horizontal" method="POST" action="/register" modelAttribute="user">
		 	<div class="uk-margin">
		     	<form:label class="uk-form-label" path="firstName">First Name:</form:label>
		     	<form:errors path="firstName"/>
		     	<div class="uk-form-controls">
		     		<form:input class="uk-input" type="text" path="firstName"/>
		     	</div>
		 	</div>
		 	<div class="uk-margin">
		     	<form:label class="uk-form-label" path="lastName">Last Name:</form:label>
		     	<form:errors path="lastName"/>
		     	<div class="uk-form-controls">
		     		<form:input class="uk-input" type="text" path="lastName"/>
		     	</div>
		 	</div>
		 	<div class="uk-margin">
		     	<form:label class="uk-form-label" path="email">Email:</form:label>
		     	<form:errors path="email"/>
		     	<div class="uk-form-controls">
		     		<form:input class="uk-input" type="email" path="email"/>
		     	</div>
		 	</div>
		 	<div class="uk-margin">
		     	<form:label class="uk-form-label" path="address">Address:</form:label>
		     	<form:errors path="address"/>
		     	<div class="uk-form-controls">
		     		<form:input class="uk-input" type="text" path="address"/>
		     	</div>
		 	</div>
		 	<div class="uk-margin">
		     	<form:label class="uk-form-label" path="city">City:</form:label>
		     	<form:errors path="city"/>
		     	<div class="uk-form-controls">
		     		<form:input class="uk-input" type="text" path="city"/>
		     	</div>
		 	</div>
		 	<div class="uk-margin">
		     	<form:label class="uk-form-label" path="state">State:</form:label>
		     	<form:errors path="state"/>
		     	<div class="uk-form-controls">
		     		<form:select class="uk-select" path="state">
		     			<form:option value="">Select State</form:option>
		     			<form:option value="AL">Alabama</form:option>
						<form:option value="AK">Alaska</form:option>
						<form:option value="AZ">Arizona</form:option>
						<form:option value="AR">Arkansas</form:option>
						<form:option value="CA">California</form:option>
						<form:option value="CO">Colorado</form:option>
						<form:option value="CT">Connecticut</form:option>
						<form:option value="DE">Delaware</form:option>
						<form:option value="DC">District Of Columbia</form:option>
						<form:option value="FL">Florida</form:option>
						<form:option value="GA">Georgia</form:option>
						<form:option value="HI">Hawaii</form:option>
						<form:option value="ID">Idaho</form:option>
						<form:option value="IL">Illinois</form:option>
						<form:option value="IN">Indiana</form:option>
						<form:option value="IA">Iowa</form:option>
						<form:option value="KS">Kansas</form:option>
						<form:option value="KY">Kentucky</form:option>
						<form:option value="LA">Louisiana</form:option>
						<form:option value="ME">Maine</form:option>
						<form:option value="MD">Maryland</form:option>
						<form:option value="MA">Massachusetts</form:option>
						<form:option value="MI">Michigan</form:option>
						<form:option value="MN">Minnesota</form:option>
						<form:option value="MS">Mississippi</form:option>
						<form:option value="MO">Missouri</form:option>
						<form:option value="MT">Montana</form:option>
						<form:option value="NE">Nebraska</form:option>
						<form:option value="NV">Nevada</form:option>
						<form:option value="NH">New Hampshire</form:option>
						<form:option value="NJ">New Jersey</form:option>
						<form:option value="NM">New Mexico</form:option>
						<form:option value="NY">New York</form:option>
						<form:option value="NC">North Carolina</form:option>
						<form:option value="ND">North Dakota</form:option>
						<form:option value="OH">Ohio</form:option>
						<form:option value="OK">Oklahoma</form:option>
						<form:option value="OR">Oregon</form:option>
						<form:option value="PA">Pennsylvania</form:option>
						<form:option value="RI">Rhode Island</form:option>
						<form:option value="SC">South Carolina</form:option>
						<form:option value="SD">South Dakota</form:option>
						<form:option value="TN">Tennessee</form:option>
						<form:option value="TX">Texas</form:option>
						<form:option value="UT">Utah</form:option>
						<form:option value="VT">Vermont</form:option>
						<form:option value="VA">Virginia</form:option>
						<form:option value="WA">Washington</form:option>
						<form:option value="WV">West Virginia</form:option>
						<form:option value="WI">Wisconsin</form:option>
						<form:option value="WY">Wyoming</form:option>
		     		</form:select>
		     	</div>
		 	</div>
		 	<div class="uk-margin">
		     	<form:label class="uk-form-label" path="password">Password:</form:label>
		     	<form:errors path="password"/>
		     	<div class="uk-form-controls">
		     		<form:password class="uk-input" path="password"/>
		     	</div>
		 	</div>
		 	<div class="uk-margin">
		     	<form:label class="uk-form-label" path="confirmPassword">Password Confirmation:</form:label>
		     	<form:errors path="confirmPassword"/>
		     	<div class="uk-form-controls">
		     		<form:password class="uk-input" path="confirmPassword"/>
		     	</div>
		 	</div>
		 	<div class="uk-margin">
		 		<input class= "uk-button-primary uk-button-large" type="submit" value="Register!"/>
		 	</div>
		</form:form>
	</div>
</div>
</body>
</html>