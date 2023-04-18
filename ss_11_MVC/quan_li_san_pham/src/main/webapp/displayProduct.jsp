<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="webjars/izitoast/1.4.0/dist/css/iziToast.min.css">
</head>
<style>
    table,th, td{
        border: 1px solid black;
        border-collapse: collapse;
    }
    th, td{
        padding: 10px;
    }
</style>
<body>
<a href="/createProduct.jsp">create</a>

<table >
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
    <c:forEach items="${product}" var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.productDescription}</td>
            <td>${product.producer}</td>
            <td><a href="findID.jsp">Find</a></td>
            <td><a href="update.jsp">Edit</a></td>
            <td><a href="delete.jsp">Delete</a></td>
        </tr>
    </c:forEach>
    <tr>

    </tr>
    </tbody>
</table>

<script src="webjars/bootstrap/5.2.3/js/bootstrap.bundle.js"></script>
<script src="webjars/izitoast/1.4.0/dist/js/iziToast.js"></script>
<script>
    

</script>
<SCRIPT>
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    if ( urlParams.get('isCreate')>0){
        iziToast.success({
            title: 'OK',
            message: 'Successfully inserted record!',
        });
    }else if ( urlParams.get('isDelete')>0){
        iziToast.success({
            title: 'OK',
            message: 'Ban da xoa thanh cong',
        });
    }
</SCRIPT>

</body>
</html>