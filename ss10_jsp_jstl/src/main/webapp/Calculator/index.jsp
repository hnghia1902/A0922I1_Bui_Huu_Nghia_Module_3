<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<form action="/Calculator" method="post">
    <h1>Simple Calculator</h1>
    <fieldset style="margin: 10px">
        <legend>Calculator</legend>
        <label style="margin: 10px">First Operand:   </label><input type="number" name="first_opera"><br>
        <label style="margin: 10px">Operator:
            <select name="operator">
                <option>+</option>
                <option>-</option>
                <option>x</option>
                <option>/</option>
            </select>
        </label><br>
        <label style="margin: 10px">Second Operand</label><input type="number" name="second_operand"><br>
        <input style="margin: 10px" type="submit" name="action" value="Calculator">
        <h4>Kết quả : ${result}</h4>
    </fieldset>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>