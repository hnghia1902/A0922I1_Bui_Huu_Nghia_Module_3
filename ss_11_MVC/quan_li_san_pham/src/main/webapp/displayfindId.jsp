<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 08/02/2023
  Time: 8:06 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>

<table border="1">
  <thead>
  <tr>
    <td colspan="5" style="text-align: center">Product List</td>
  </tr>
  <tr>
    <td>Product ID</td>
    <td>Product Name</td>
    <td>Product Price</td>
    <td>Product Description</td>
    <td>Producer</td>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>${product.id}</td>
    <td>${product.name}</td>
    <td>${product.price}</td>
    <td>${product.productDescription}</td>
    <td>${product.producer}</td>
  </tr>
  <tr>
    <td colspan="5"><button name="action" value="edit" type="submit" style="width: 500px"><a href="update.jsp" style="color: black">Edit</a></button></td>
  </tr>
  </tbody>
</table>
</body>
</html>
