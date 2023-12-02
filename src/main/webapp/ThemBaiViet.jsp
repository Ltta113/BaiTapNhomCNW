<%@ page import="com.example.baitapnhom.Model.Bean.danhmucModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Cập nhật thông tin danh mục</title>
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

<form class="login-container" action="/BaiTapNhom_war_exploded/baivietController?action=thembaiviet" method="post">
    <%
        ArrayList<danhmucModel> ListDanhMuc = (ArrayList<danhmucModel>) request.getAttribute("ListDanhMuc");
    %>
    <h1>Thêm bài viết</h1>
    <label for="tieude">Tiêu đề:</label>
    <input type="text" id="tieude" name="tieude" required>
    <br>
    <label for="iddanhmuc" >Danh mục:</label>
    <select id="iddanhmuc" name="iddanhmuc" class="labelInput">
        <% for (int i = 0; i < ListDanhMuc.size(); i++) {
            danhmucModel dm = ListDanhMuc.get(i);
        %>
        <option value="<%= dm.getIddanhmuc() %>"><%= dm.getTendanhmuc() %></option>
        <% } %>
    </select>
    <br>
    <label for="noidung">Nội dung:</label>
    <textarea name="noidung" id="noidung" cols="30" rows="10">Nhập nội dung tại đây...</textarea>
    <br>
    <label for="anh">Ảnh:</label>
    <input type="text" id="anh" name="anh">
    <button type="submit">Thêm mới</button>
    <button type="reset">Reset</button>
</form>
<p><a href="javascript:history.back()">Back</a></p>
</body>

</html>
