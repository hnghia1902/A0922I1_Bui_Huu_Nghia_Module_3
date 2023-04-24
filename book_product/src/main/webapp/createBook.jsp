<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 22/04/2023
  Time: 8:51 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
  <form method="post" action="/Book">
    <table border="1" cellpadding="5">
      <caption>
        <h2>Add New Book</h2>
      </caption>
      <tr>
        <th>Book Name:</th>
        <td>
          <input type="text" name="name" id="name" size="45"/>
        </td>
      </tr>
      <tr>
        <th>Book Price:</th>
        <td>
          <input type="number" name="price"/>
        </td>
      </tr>
      <tr>
        <th>Book Description:</th>
        <td>
          <input type="text" name="description"/>
        </td>
      </tr>
      <tr>
        <th>Book Publication:</th>
        <td>
          <input type="date" name="publication_date"/>
        </td>
      </tr>
      <tr>
        <th>Book Type:</th>
        <td>
          <select name="catalog_id">
            <option value="1">Tiểu Thuyết</option>
            <option value="2">Du Lịch</option>
            <option value="3">Ẩm Thực</option>
          </select>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <input type="submit" name="action" value="Create"/>
        </td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>
