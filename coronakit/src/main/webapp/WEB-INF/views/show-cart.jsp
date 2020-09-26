<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<style>
.cartTab {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

.cartTab td, .userTab th {
  border: 1px solid #ddd;
  padding: 8px;
}

.cartTab tr:nth-child(even){background-color: #f2f2f2;}

.cartTab tr:hover {background-color: #ddd;}

.cartTab th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: navy;
  color: white;
}
.cartItem:link, .cartItem:visited {
  background-color: green;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

.cartItem:hover, .cartItem:active {
  background-color: olive;
  }
  .subTotal{
text-align: right;
text-decoration: underline;
}
</style>

</head>
<body>
<%int subTotal = 0;%>
<jsp:include page="header.jsp"/>

<br><br><br>
<a href="${pageContext.request.contextPath}/user/checkout" class="cartItem">Checkout</a>
<a href="${pageContext.request.contextPath}/user/show-list" class="cartItem">Show List</a>
<br><br><br>
<table class="cartTab">
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Amount</th>
                            <th>Description</th>
                            <th></th>
                        </tr>
                      <core:forEach var="product" items="${products.entrySet()}">
                            <tr>
                                <td>${product.getKey().id}</td>
                                <td>${product.getKey().productName}</td>
                          <td>${product.getKey().cost}</td>
                           <td>${product.getKey().productDescription}</td>
                                <td>
                                   <a href="${pageContext.request.contextPath}/user/delete/${product.getKey().id}">Delete</a>  
                                    <div><input type="hidden" value="${subTotal = product.getKey().cost +subTotal}" name="id"></div>                            
                                 </td>                    
                            </tr>
                            
                    </core:forEach>
                    </table>

<h1 class="subTotal">SubTotal = ${subTotal}</h1>


<jsp:include page="footer.jsp"/>
</body>
</html>