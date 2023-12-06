<%@ page import="com.example.baitapnhom.Model.Bean.taikhoanModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Cập nhật thông tin</title>
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

<form class="login-container" action="taikhoanController?action=capnhatthongtin" method="post">
    <%
        taikhoanModel taikhoan = (taikhoanModel) request.getAttribute("taikhoan");
    %>
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
<p><a href="javascript:history.back()">Back</a></p>
</body>

</html>
