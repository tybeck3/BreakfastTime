<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/css/uikit.min.css" />
        <script src="js/uikit.min.js"></script>
        <script src="js/uikit-icons.min.js"></script>
    <title>Courses Login</title>
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
				<div class="uk-logo">Login</div>
			</div>
			<div class="uk-navbar-right">
			<ul class="uk-navbar-nav">
				<li>
					<a href="/">Don't have an account? Register Here</a>
				</li>
			</ul>
			</div>
		</nav>
	<div>
		<p><c:out value="${loginError}"/></p>
		   	<form class="uk-form-large uk-form-width-large uk-form-horizontal" method="post" action="/login">
		       <div class="uk-margin">
		        	<label class="uk-form-label" type="email" for="email">Email</label>
		        	<div class="uk-form-controls">
		        		<input class="uk-input" type="text" id="email" name="email"/>
		        	</div>
		       </div>
		       <div class="uk-margin">
		        	<label class="uk-form-label" for="password">Password</label>
		        	<div class="uk-form-controls">
		        		<input class="uk-input" type="password" id="password" name="password"/>
		        	</div>
		       </div>
		       <div class="uk-margin">
		       		<input class="uk-button-primary uk-button-large" type="submit" value="Login!"/>
		       </div>
		    </form>    
	</div>
</div>
</body>
</html>