<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Đăng nhập</title>
    <style>
        form {
            border: 1;
            display: block;

        }

        .login-container {
            margin: 0 auto;
            width: 300px;
        }
    </style>
</head>

<body>

<form class="login-container" action="/BaiTapNhom_war_exploded/taikhoanController?action=dangnhap" method="post">
    <h1>Đăng nhập</h1>
    <label for="username">Tên đăng nhập:</label>
    <input type="text" id="username" name="username" required>
    <br>
    <label for="password">Mật khẩu:</label>
    <input type="password" id="password" name="password" required>
    <br>
    <button type="submit">Đăng nhập</button>
    <button type="reset">Reset</button>
</form>
<p><a href="javascript:history.back()">Back</a></p>
</body>

</html>
