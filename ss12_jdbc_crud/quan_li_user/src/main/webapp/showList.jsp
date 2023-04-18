<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="webjars/izitoast/1.4.0/dist/css/iziToast.min.css">
    <link rel="stylesheet" href="webjars/bootstrap/5.2.3/css/bootstrap.min.css">
</head>
<body onLoad="JavaScript:checkRefresh();" >
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/Users?action=Create">Add New User</a>
        <form action="/Users" method="post">
        <h3><input type="text" name="country"><input type="submit" name="action" value="Search"></h3>
        </form>
    </h2>
</center>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Country</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="users" items="${listUsers}">
            <tr>
                <td><c:out value="${users.id}"/></td>
                <td><c:out value="${users.name}"/></td>
                <td><c:out value="${users.email}"/></td>
                <td><c:out value="${users.country}"/></td>
                <td>
                    <a class="btn btn-primary" href="/Users?action=Edit&id=${users.id}">Edit</a>
                    <!-- Button trigger modal -->
                    <button class="btn btn-danger" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${users.id}">
                        Delete
                    </button>
                    <form method="get" action="/Users">
                        <div class="modal fade" id="exampleModal${users.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Thông báo</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Bạn có muốn xóa User này không ??
                                        <P>${users.name}</P>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button"  class="btn btn-secondary" data-bs-dismiss="modal">Dừng lại</button>
                                        <button type="button"   class="btn btn-primary"><a style="color: white" href="/Users?action=delete&id=${users.id}">Xác nhận</a></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <c:if test="${User != null}"></c:if>
        <td><c:out value="${User.id}"/></td>
        <td><c:out value="${User.name}"/></td>
        <td><c:out value="${User.email}"/></td>
        <td><c:out value="${User.country}"/></td>
        </tr>
        </tbody>
    </table>
    </tbody>
</table>


<%--<form name="refreshForm">--%>
<%--    <input type="hidden" name="visited" value="" />--%>
<%--</form>--%>
</body>
<script src="webjars/bootstrap/5.2.3/js/bootstrap.bundle.js"></script>
<script src="webjars/izitoast/1.4.0/dist/js/iziToast.js"></script>
<SCRIPT>
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    if ( urlParams.get('isCreate')>1){
        iziToast.success({
            timeout: 20000,
            title: 'OK',
            message: 'Bạn đã tạo thành công!',
        });
    }else if ( urlParams.get('isDelete')>0){
        iziToast.success({
            title: 'OK',
            message: 'Ban da xoa thanh cong',
        });
    }




    // function checkRefresh()
    // {
    //
    //     if( document.refreshForm.visited.value == "" )
    //     {
    //         document.refreshForm.visited.value = "1";
    //         alert("0");
    //     }
    //     else
    //     {
    //         alert("1");
    //     }
    // }
</SCRIPT>
</html>