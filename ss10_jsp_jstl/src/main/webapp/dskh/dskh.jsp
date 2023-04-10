<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 07/04/2023
  Time: 9:09 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">

</head>
<body>
<form method="" action="">
  <table class="table">
    <thead>
    <tr>
      <th colspan="4">Danh Sách Khách Hàng</th>
    </tr>
    <tr>
      <th>Tên</th>
      <th>Ngày Sinh</th>
      <th>Địa Chỉ</th>
      <th>Ảnh</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="studentList" var="student">
      <tr>
        <td scope="row"></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
