<%@ page import="com.example.baitapnhom.Model.Bean.taikhoanModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Cập nhật thông tin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f1f1f1;
            margin: 0;
            padding: 0;
        }

        .login-container {
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin: 30px auto;
            max-width: 300px;
            padding: 20px;
        }

        h1 {
            font-size: 20px;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 15px;
        }

        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;

        }

        button[type="submit"] {
            background-color: dodgerblue;
        }

        button[type="reset"] {
            background-color: #f44336;
        }
    </style>
</head>

<body>
<%@include file="NavbarAdmin.jsp"%>

<form class="login-container" action="taikhoanController?action=capnhatthongtin" method="post">
    <% taikhoanModel taikhoan = (taikhoanModel) request.getAttribute("taikhoan"); %>
    <h1>Cập nhật thông tin</h1>
    <label for="password">Mật khẩu:</label>
    <input type="password" id="password" name="password" value="<%=taikhoan.getPassword()%>" required>
    <br>
    <label for="hoten">Họ tên:</label>
    <input type="text" id="hoten" name="hoten" value="<%=taikhoan.getHoten()%>" required>
    <br>
    <label for="ngaysinh">Ngày sinh:</label>
    <input type="date" id="ngaysinh" name="ngaysinh" value="<%=taikhoan.getNgaysinh()%>" required>
    <br>
    <button type="submit">Cập nhật</button>
    <button type="reset">Reset</button>
</form>
</body>

</html>