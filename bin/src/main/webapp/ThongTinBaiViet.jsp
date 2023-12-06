<%@ page import="com.example.baitapnhom.Model.Bean.baivietModel" %>
<%@ page import="com.example.baitapnhom.Model.Bean.danhmucModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Thông tin bài viết</title>
    <%
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
<h1>Thông tin bài viết</h1>
<input type="hidden" id="idbaiviet" name="idbaiviet" value="<%=BaiViet.getIdbaiviet()%>" readonly>
<label for="tieude">Tiêu đề:</label>
<input type="text" id="tieude" name="tieude" value="<%=BaiViet.getTieude()%>" readonly>
<br>
<label for="iddanhmuc">Danh mục:</label>
<input type="text" id="iddanhmuc" name="iddanhmuc" value="<%=BaiViet.getTendanhmuc()%>" readonly>
<br>
<label for="noidung">Nội dung:</label>
<textarea name="noidung" id="noidung" cols="30" rows="10" readonly></textarea>
<br>
<label>Ảnh:</label>
<img src="<%=BaiViet.getAnh()%>" alt="">
<button type="button"><a href='/BaiTapNhom_war_exploded/baivietController?action=duyetbaiviet&idbaiviet=<%= BaiViet.getIdbaiviet() %>'>Duyệt bài</a></button>
<p><a href="javascript:history.back()">Back</a></p>
</body>

</html>