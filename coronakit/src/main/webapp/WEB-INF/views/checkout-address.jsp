<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<style>
.checkoutItem:link, .checkoutItem:visited {
  background-color: green;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

.checkoutItem:hover, .checkoutItem:active {
  background-color: olive;
</style>
</head>
<body>
<jsp:include page="header.jsp"/>

<h3>Please provide your Address:</h3>
<spring:form action="${pageContext.request.contextPath}/user/finalize" method="POST" modelAttribute="ckit">
<div>
	<div>
		
		<spring:textarea cols="50" rows="10"  path="deliveryAddress"/>
	</div>
	<br>
	<div>

		<input type="submit" value="Submit"/>
	</div>
</div>
</spring:form>
<br><br><br>
<a href="${pageContext.request.contextPath}/user/show-list" class="checkoutItem">Show List</a>

<jsp:include page="footer.jsp"/>
</body>
</html>