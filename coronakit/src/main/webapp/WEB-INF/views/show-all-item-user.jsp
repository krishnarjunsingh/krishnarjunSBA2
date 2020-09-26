<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="spring" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
<style>
.userTab {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

.userTab td, .adminTab th {
  border: 1px solid #ddd;
  padding: 8px;
}

.userTab tr:nth-child(even){background-color: #f2f2f2;}

.userTab tr:hover {background-color: #ddd;}

.userTab th {
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
<table class="userTab">
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
                                  <a href="${pageContext.request.contextPath}/user/add-to-cart/${product.id}" class="listItem">Add to Cart</a>
                                                         
                                 </td>                    
                            </tr>
                        </core:forEach>
                    </table>
<br><br><br>
<a href="${pageContext.request.contextPath}/user/show-kit" class="listItem">View Cart</a>
<jsp:include page="footer.jsp"/>
</body>
</html>