<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>List_Books</title>
    <link rel="stylesheet" href="webjars/izitoast/1.4.0/dist/css/iziToast.min.css">
    <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.min.css">
</head>
<body>
<table class="table">
    <thead>
    <tr>
        <th colspan="6" style="text-align: center; font-size: xx-large">List Books</th>
    </tr>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Name</th>
        <th scope="col">Price</th>
        <th scope="col">Description</th>
        <th scope="col">Ngày sản xuất</th>
        <th scope="col">Loại</th>
        <th scope="col" colspan="2">Action</th>

    </tr>
    </thead>
    <tbody>
        <form method="get" action="/Book">
            <c:forEach var="book" items="${listBooks}">
                <tr>

                    <td>${book.id}</td>
                    <td>${book.name}</td>
                    <td>${book.price}</td>
                    <td>${book.description}</td>
                    <td>${book.publication_date}</td>
                    <td>${book.catalog_name}</td>
                    <td ><a href="/Book?action=Edit&id=${book.id}">Edit</a></td>
                    <td><a href="/Book?action=Delete&id=${book.id}">Delete</a></td>

                 </tr>
            </c:forEach>
        </form>
    </tbody>
</table>
<form action="/Book" method="get">
    <tr>
        <button  name="action" value="Create">Create</button>
    </tr>
</form>

<script src="webjars/bootstrap/5.2.3/js/bootstrap.bundle.js"></script>
<script src="webjars/izitoast/1.4.0/dist/js/iziToast.js"></script>
</body>
</html>