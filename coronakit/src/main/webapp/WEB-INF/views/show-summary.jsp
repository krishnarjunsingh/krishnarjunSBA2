<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>
    <%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Summary</title>
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
.total{
text-align: right;
text-decoration: underline;
}
</style>
</head>
<body>
<%int total = 0;%>
<jsp:include page="header.jsp"/>
<br>
<div>
	<h1 >Name: <security:authentication property="principal.username"/></h1>
	<h1>Address: ${ckit.deliveryAddress}</h1>	
</div>

<br>
<table class="cartTab">
                        <tr>
                            <th>Id</th>
                            <th>Amount</th>
                        </tr>
                      <core:forEach var="product" items="${products.entrySet()}">
                            <tr>
                                <td>${product.getKey().id}</td>
                          <td>${product.getKey().cost}</td>                   
                            </tr>
                            <div><input type="hidden" value="${total = product.getKey().cost +total}" name="id"></div>
                    </core:forEach>
                    </table>

<h1 class="total">Total = ${total}</h1>


<br><br><br>
<jsp:include page="footer.jsp"/>


</body>
</html>