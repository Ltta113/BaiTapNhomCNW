<%@ page import="com.example.baitapnhom.Model.Bean.baivietModel" %>
<%@ page import="com.example.baitapnhom.Model.Bean.danhmucModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Cập nhật thông tin danh mục</title>
    <%
        ArrayList<danhmucModel> ListDanhMuc = (ArrayList<danhmucModel>) request.getAttribute("ListDanhMuc");
        baivietModel BaiViet = (baivietModel) request.getAttribute("BaiViet");
    %>
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
    <script>
            window.onload = function() {
            // Lấy tham chiếu đến phần tử textarea
            var textarea = document.getElementById("noidung");

            // Set giá trị cho textarea
            textarea.textContent = "<%= BaiViet.getNoidung() %>";
        };
    </script>
</head>

<body>

<form class="login-container" action="/BaiTapNhom_war_exploded/baivietController?action=capnhatbaiviet" method="post">

    <input type="hidden" id="idbaiviet" name="idbaiviet" value="<%=BaiViet.getIdbaiviet()%>" required>
    <h1>Thêm bài viết</h1>
    <label for="tieude">Tiêu đề:</label>
    <input type="text" id="tieude" name="tieude" value="<%=BaiViet.getTieude()%>" required>
    <br>
    <label for="iddanhmuc" >Danh mục:</label>
    <select id="iddanhmuc" name="iddanhmuc" class="labelInput">
        <% for (int i = 0; i < ListDanhMuc.size(); i++) {
            danhmucModel dm = ListDanhMuc.get(i);
            int selectedDanhMucId = BaiViet.getIddanhmuc(); // Replace with the desired initial value
            // Check if the current danhMuc has the selected value
            boolean isSelected = (dm.getIddanhmuc() == selectedDanhMucId);
        %>
        <option value="<%= dm.getIddanhmuc() %>" <%= isSelected ? "selected" : "" %>><%= dm.getTendanhmuc() %></option>
        <% } %>
    </select>
    <br>
    <label for="noidung">Nội dung:</label>
    <textarea name="noidung" id="noidung" cols="30" rows="10"  ></textarea>
    <br>
    <label for="anh">Ảnh:</label>
    <input type="text" id="anh" name="anh" value="<%=BaiViet.getAnh()%>">
    <button type="submit">Thêm mới</button>
    <button type="reset">Reset</button>
</form>
<p><a href="javascript:history.back()">Back</a></p>
</body>

</html>
