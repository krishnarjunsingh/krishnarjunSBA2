<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring-form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<section style="text-align: center; color: white; background: black;">
<br><br><br>
<h1>Login to Corona-Kit Home...</h1>
<br><br><br>
</section>
<br><br>
<section style="text-align: center;">
<core:if test="${param.error != null}">
	<i class="alert alert-warning" role="alert" >Invalid Credentials!!!</i>
</core:if>

<spring-form:form action="${pageContext.request.contextPath}/validate" method="POST">
	<br/>
	<br/>
	<label>Enter user name: </label>
	<input type="text" name="username" />
	<br/>
	<br/>
	<label>Enter password: </label>
	<input type="password" name="password" />
	<br/>
	<br/>
	<input type="submit" value="Login" />
</spring-form:form>
<br><br>
<core:if test="${param.logout != null}">
	<i class="alert alert-primary" role="alert" >You have been logged out successfully!!!</i>
</core:if>

</section>
</body>
</html>