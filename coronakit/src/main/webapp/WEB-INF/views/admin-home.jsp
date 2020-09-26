<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<style >
.prod:link, .prod:visited {
  background-color: green;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

.prod:hover, .prod:active {
  background-color: olive;
}
</style>
</head>
<body>

<jsp:include page="header.jsp"/>

<h1 >Welcome <security:authentication property="principal.username"/></h1>
<br>
<div>
<a href="${pageContext.request.contextPath}/admin/product-list" class = "prod">Show All Product</a>
</div>
<br><br>
<div>
<a href="${pageContext.request.contextPath}/admin/product-entry" class = "prod">Add Product</a>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>