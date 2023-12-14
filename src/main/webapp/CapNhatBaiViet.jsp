<%@ page import="com.example.baitapnhom.Model.Bean.baivietModel"%>
<%@ page import="com.example.baitapnhom.Model.Bean.danhmucModel"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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

input[type="text"], select, textarea {
	width: 45%;
	padding: 5px;
	margin-bottom: 10px;
	display: inline-block;
}

button[type="submit"], button[type="reset"] {
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
<script
	src="https://cdn.tiny.cloud/1/cqxptvni1qttef86vugmz0ipgqyg8wbvdplkol47jeiqzh1a/tinymce/6/tinymce.min.js"
	referrerpolicy="origin"></script>

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
            textarea.textContent = "<%=BaiViet.getNoidung()%>";
        };
    </script>
</head>

<body>
	<%@include file="NavbarAdmin.jsp"%>
	<form class="row g-3 m-3" action="baivietController?action=capnhatbaiviet" method="post">
		<input type="hidden" id="idbaiviet" name="idbaiviet"
			value="<%=BaiViet.getIdbaiviet()%>" required>
		<h1>Cập nhật bài viết</h1>
		<div class="col-md-12">
			<label for="tieude" class="form-label">Tiêu đề:</label> <input
				type="text" class="form-control" id="tieude" name="tieude"
				value="<%=BaiViet.getTieude()%>" required style="max-width: 500px;">
		</div>
		<div class="col-md-12">
			<label for="iddanhmuc" class="form-label">Danh mục:</label> <select
				id="iddanhmuc" name="iddanhmuc" class="form-select"
				style="max-width: 500px;">
				<%
				for (int i = 0; i < ListDanhMuc.size(); i++) {
					danhmucModel dm = ListDanhMuc.get(i);
					int selectedDanhMucId = BaiViet.getIddanhmuc(); // Replace with the desired initial value
					// Check if the current danhMuc has the selected value
					boolean isSelected = (dm.getIddanhmuc() == selectedDanhMucId);
				%>
				<option value="<%=dm.getIddanhmuc()%>"
					<%=isSelected ? "selected" : ""%>><%=dm.getTendanhmuc()%></option>
				<%
				}
				%>
			</select>
		</div>
		<div class="col-md-6">
			<label for="anh" class="form-label">Ảnh:</label> <input type="text"
				id="anh" name="anh" oninput="displayImage()"
				value="<%=BaiViet.getAnh()%>"> <br>
		</div>
		<div class="col-md-6">
			<img id="hinhAnh" src="<%=BaiViet.getAnh()%>" alt="Hình ảnh"
				style="height: 200px; width: 200px">
		</div>


		<div class="col-12">
			<label for="noidung" class="form-label">Nội dung:</label>
			<textarea name="noidung" id="noidung" cols="30" rows="10"
				maxlength="3990"><%=BaiViet.getNoidung()%></textarea>
			<br> <br>
		</div>
		<div class="col-sm-2">
			<button type="submit" class="btn btn-primary">Cập nhật</button>
		</div>
		<div class="col-sm-2">
			<button type="reset" class="btn btn-primary">Reset</button>
		</div>
	</form>
</body>

</html>
