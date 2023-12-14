<%@ page import="com.example.baitapnhom.Model.Bean.danhmucModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Cập nhật thông tin danh mục</title>
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
        input[type="date"],
        select {
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
<form class="login-container" action="danhmucController?action=capnhatdanhmuc" method="post">
    <%
        danhmucModel DanhMuc = (danhmucModel) request.getAttribute("DanhMuc");
        ArrayList<danhmucModel> ListDanhMuc = (ArrayList<danhmucModel>) request.getAttribute("ListDanhMuc");
    %>
    <h1>Cập nhật thông tin</h1>
    <label for="tendanhmuc">Tên danh mục:</label>
    <input type="text" id="tendanhmuc" name="tendanhmuc" value="<%=DanhMuc.getTendanhmuc()%>" required>
    <input type="hidden" id="iddanhmuc" name="iddanhmuc" value="<%=DanhMuc.getIddanhmuc()%>" readonly>
    <br>
    <label for="iddm2" class="labelInput">Danh mục cha:</label>
    <select id="iddm2" name="iddm2" class="labelInput">
        <option value="0">Không</option>
        <% for (int i = 0; i < ListDanhMuc.size(); i++) {
            danhmucModel dm = ListDanhMuc.get(i);
            int selectedDanhMucId = DanhMuc.getIddm2(); // Replace with the desired initial value
            // Check if the current danhMuc has the selected value
            boolean isSelected = (dm.getIddanhmuc() == selectedDanhMucId);
        %>
        <option value="<%= dm.getIddanhmuc() %>" <%= isSelected ? "selected" : "" %>><%= dm.getTendanhmuc() %></option>
        <% } %>
    </select>
    <br>
    <button type="submit">Cập nhật</button>
    <button type="reset">Reset</button>
</form>
</body>

</html>