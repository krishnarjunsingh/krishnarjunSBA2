<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
<style>
.adminTab {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

.adminTab td, .adminTab th {
  border: 1px solid #ddd;
  padding: 8px;
}

.adminTab tr:nth-child(even){background-color: #f2f2f2;}

.adminTab tr:hover {background-color: #ddd;}

.adminTab th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: navy;
  color: white;
}

.listItem:link, .listItem:visited {
  background-color: green;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

.listItem:hover, .listItem:active {
  background-color: olive;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>

<br><br><br>
<table class="adminTab">
                        <tr>
                            <th>Id</th>
                            <th>Product Name</th>
                            <th>Cost</th>
                            <th>Product Description</th>
                        </tr>
                        <core:forEach var="product" items="${products}">
                            <tr>
                                <td>${product.id}</td>
                                <td>${product.productName}</td>
                                <td>${product.cost}</td>
                                 <td>${product.productDescription}</td>
                                <td>
                                   <a href="${pageContext.request.contextPath}/admin/product-delete/${product.id}">Delete</a>
                                 </td>                    
                            </tr>
                        </core:forEach>
                    </table>
<br><br><br>
<a href="${pageContext.request.contextPath}/admin/product-entry" class="listItem">Add New Item</a>
<jsp:include page="footer.jsp"/>
</body>
</html>