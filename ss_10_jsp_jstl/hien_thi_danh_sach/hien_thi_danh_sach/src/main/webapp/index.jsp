<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form>
    <table border="1">
        <thead>
        <tr>
            <th colspan="4">Danh Sách Khách Hàng</th>
        </tr>
        <tr>
            <td>Tên</td>
            <td>Ngày sinh</td>
            <td>Địa Chỉ</td>
            <td>Ảnh</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${studentList}" var="student">
            <tr>
                <td>${student.ten}</td>
                <td>${student.ngaySinh}</td>
                <td>${student.diaChi}</td>
                <td><img width="50px", height="50px" src="${student.img}"></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
</body>
</html>