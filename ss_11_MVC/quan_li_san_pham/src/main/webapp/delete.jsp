<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 06/02/2023
  Time: 6:54 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.min.css">
</head>
<body>
<form action="/Product" method="post">
  <table border="1">
    <tr>
      <td width="200px">Product ID Delete: </td>
      <td><input type="number" name="delete"></td>
    </tr>
    <tr>
      <td>
        <!-- Button trigger modal -->
        <button type="submit" name="action" value="deleteId" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
          Launch demo modal
        </button>
      </td>

    </tr>
  </table>
</form>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<script src="webjars/bootstrap/5.2.3/js/bootstrap.bundle.js"></script>
</body>
</html>
