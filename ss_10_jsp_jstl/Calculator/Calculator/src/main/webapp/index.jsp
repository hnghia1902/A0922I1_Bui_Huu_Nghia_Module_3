<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/calculator" method="post">
    <h1>Simple Calculator</h1><br>
    <label style="width: 40px">Calculator</label><br>
    <label style="width: 40px">First operand : </label><input name="first" type="number", STYLE="margin-left: 50px"><br>
    <label style="width: 40px">Operator : </label>
        <select style="margin-left: 80px;font-size: medium" name="operator">
            <option value="addition">addition</option>
            <option value="subtractio">subtractio</option>
            <option value="multiplication">multiplication</option>
            <option value="division">division</option>
        </select><br>
    <label style="width: 40px">Second oprerand : </label><input name="second" type="number", STYLE="margin-left: 30px"><br>
    <button type="submit" name="action" value="calculator" style="width: 80px; margin-left: 150px">Calculator</button>
</form>
</body>
</html>