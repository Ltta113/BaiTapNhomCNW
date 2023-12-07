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
        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        select,
        textarea {
            width: 45%;
            padding: 5px;
            margin-bottom: 10px;
            display: inline-block;
        }

        button[type="submit"],
        button[type="reset"] {
            background-color: dodgerblue;
            color: white;
            padding: 8px 16px;
            border: none;
            cursor: pointer;
            margin-right: 10px;
        }

        button[type="reset"] {
            background-color: #f44336;
        }

        a {
            color: blue;
            text-decoration: none;
        }
    </style>
    <script src="https://cdn.tiny.cloud/1/cqxptvni1qttef86vugmz0ipgqyg8wbvdplkol47jeiqzh1a/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>

    <script>
        tinymce.init({
            selector: 'textarea',
            plugins: 'ai tinycomments mentions anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed permanentpen footnotes advtemplate advtable advcode editimage tableofcontents mergetags powerpaste tinymcespellchecker autocorrect a11ychecker typography inlinecss',
            toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | align lineheight | tinycomments | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
            tinycomments_mode: 'embedded',
            tinycomments_author: 'Author name',
            mergetags_list: [
                { value: 'First.Name', title: 'First Name' },
                { value: 'Email', title: 'Email' },
            ],
            ai_request: (request, respondWith) => respondWith.string(() => Promise.reject("See docs to implement AI Assistant")),
        });
        function displayImage() {
            var imageUrl = document.getElementById('anh').value;
            var imgElement = document.getElementById('hinhAnh');
            imgElement.src = imageUrl;
        }
            window.onload = function() {
            // Lấy tham chiếu đến phần tử textarea
            var textarea = document.getElementById("noidung");

            // Set giá trị cho textarea
            textarea.textContent = "<%= BaiViet.getNoidung() %>";
        };
    </script>
</head>

<body>
<%@include file="NavbarAdmin.jsp"%>
<form class="login-container" action="/baivietController?action=capnhatbaiviet" method="post">

    <input type="hidden" id="idbaiviet" name="idbaiviet" value="<%=BaiViet.getIdbaiviet()%>" required>
    <h1>Thêm bài viết</h1>
    <label for="tieude">Tiêu đề:</label>
    <input type="text" id="tieude" name="tieude" value="<%=BaiViet.getTieude()%>" required>
    <label for="iddanhmuc">Danh mục:</label>
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
    </div>
    <label for="anh">Ảnh:</label>
    <input type="text" id="anh" name="anh" oninput="displayImage()" value="<%=BaiViet.getAnh()%>">
    <br>
    <div> <img id="hinhAnh" src="<%=BaiViet.getAnh()%>" alt="Hình ảnh" style="height: 200px; width: 200px"></div>

    <br>
    <label for="noidung">Nội dung:</label>
    <textarea name="noidung" id="noidung" cols="30" rows="10" maxlength="3990"><%=BaiViet.getNoidung()%></textarea>
    <br>
    <button type="submit">Cập nhật</button>
    <button type="reset">Reset</button>
</form>
</body>

</html>
