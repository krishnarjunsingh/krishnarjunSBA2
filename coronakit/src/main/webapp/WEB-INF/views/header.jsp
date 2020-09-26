<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="spring-form"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
.header {
	
	width: 100%;
  background-color: grey;
  padding-top: 10px;
    padding-bottom: 20px;
  color: red;
}
a:link, a:visited {
  background-color: #f44336;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  background-color: green;
}

.logoutbut{
  color: white;
  float: right;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}
</style>
</head>
<body>
<header class="header">
<security:authorize access="hasRole('ADMIN')">
	<a href="${pageContext.request.contextPath}/admin/home">HOME</a>
		
</security:authorize>

<security:authorize access="hasRole('USER')">
	<a href="${pageContext.request.contextPath}/user/home">HOME</a>

</security:authorize>


<spring-form:form action="${pageContext.request.contextPath}/logout" method="POST" cssClass="logoutbut">
<button value="Logout">Logout</button>
</spring-form:form>
<br>
</header>
</body>
</html>