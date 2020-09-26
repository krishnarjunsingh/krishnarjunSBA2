<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="spring-form"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome!!</title>
<style >
a:link, a:visited {
  background-color: green;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
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
<body style="background: silver;">
<section style="color: white; background: black;">
<br>
<h2 style="text-align: center;">Hello <security:authentication property="principal.username"/></h2>

<spring-form:form action="${pageContext.request.contextPath}/logout" method="POST" cssClass="logoutbut">
<input type="submit" value="Logout">
</spring-form:form>
<br><br><br>
</section>
<br><br><br>
<section style="text-align: center; color: navy;">
<br><br><br>
<h1>Welcome to Corona Kit Dashboard!!!</h1>
<security:authorize access="hasRole('ADMIN')">

	<a href="${pageContext.request.contextPath}/admin/home">ADMIN DASHBOARD</a>
</security:authorize>

<security:authorize access="hasRole('USER')">
	<a href="${pageContext.request.contextPath}/user/home">USER DASHBOARD</a>
</security:authorize>
<br><br><br><br><br><br>
</section>
</body>
</html>