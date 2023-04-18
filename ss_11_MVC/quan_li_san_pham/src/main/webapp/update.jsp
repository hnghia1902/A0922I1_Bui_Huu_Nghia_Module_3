<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 06/02/2023
  Time: 5:53 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
    <style>
        .sp{width: 300px}
    </style>
<body>
<form action="/Product" method="post">
    <table>
        <thead>
        <tr>
            <td><h1>Edit Product</h1></td>
        </tr>
        </thead>
        <tr>
            <td class="sp">Nhập id cần sửa : </td>
            <td><input type="number" name="Eid"></td>
        </tr>
        <tr>
            <td class="sp">Nhập lại tên : </td>
            <td><input type="text" name="Ename"></td>
        </tr>
        <tr>
            <td class="sp">Nhập lại giá : </td>
            <td><input type="number" name="Eprice"></td>
        </tr>
        <tr>
            <td class="sp">Nhập lại Product Description : </td>
            <td><input type="text" name="EproductDescription"></td>
        </tr>
        <tr>
            <td class="sp">Nhập lại Producer : </td>
                <td><input type="text" name="Eproducer"></td>
        </tr>
        <tr>
            <td class="sp"><button type="submit" name="action" value="edit">Edit</button></td>
            <td>////////////</td>
        </tr>

    </table>
</form>
<script src="webjars/"></script>
</body>
</html>
