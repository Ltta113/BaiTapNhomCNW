<%@ page import="com.example.baitapnhom.Model.Bean.danhmucModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Thêm danh mục</title>
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

<form class="login-container" action="/BaiTapNhom_war_exploded/danhmucController?action=themdanhmuc" method="post">
    <%
        ArrayList<danhmucModel> ListDanhMuc = (ArrayList<danhmucModel>) request.getAttribute("ListDanhMuc");
    %>
    <h1>Cập nhật thông tin</h1>
    <label for="tendanhmuc">Tên danh mục:</label>
    <input type="text" id="tendanhmuc" name="tendanhmuc" required>
    <br>
    <label for="iddm2" >Danh mục cha:</label>
    <select id="iddm2" name="iddm2" class="labelInput">
        <option value="0">Không</option>
        <% for (int i = 0; i < ListDanhMuc.size(); i++) {
            danhmucModel dm = ListDanhMuc.get(i);
        %>
        <option value="<%= dm.getIddanhmuc() %>"><%= dm.getTendanhmuc() %></option>
        <% } %>
    </select>
    <br>
    <button type="submit">Thêm mới</button>
    <button type="reset">Reset</button>
</form>
<p><a href="javascript:history.back()">Back</a></p>
</body>

</html>