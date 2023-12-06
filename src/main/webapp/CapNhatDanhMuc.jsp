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
<p><a href="javascript:history.back()">Back</a></p>
</body>

</html>