<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<form action="pdc" method="post">
    <table class="table">
        <thead>
        <tr>
            <th colspan="3">Product</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td scope="row">Product Description</td>
            <td>List Price</td>
            <td>Discount Percent</td>
        </tr>
        <tr>
            <td scope="row"><input type="text" name="P_name"></td>
            <td><input type="number" name="P_price"></td>
            <td><input type="number" name="P_percent"></td>
        </tr>
        <tr>
            <td>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Launch demo modal
                </button>

            </td>

        </tr>
            <th colspan="3">
                ${display}
            </th>
        </tr>
        </tbody>
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
                <button type="submit" name="action" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>