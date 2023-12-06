<%@ page import="com.example.baitapnhom.Model.Bean.baivietModel"%>
<%@ page import="com.example.baitapnhom.Model.Bean.danhmucModel"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<%@include file="Component/MainCSS.jsp"%>

<head>
<title>Thông tin bài viết</title>

<%
baivietModel BaiViet = (baivietModel) request.getAttribute("BaiViet");
%>
</head>


<body>
	<nav class="navbar navbar-expand-lg ">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><img alt="" src="image/logo.png"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="baivietController?action=getListbaiviet2&iddanhmuc=1">GIỚI
							THIỆU</a></li>
					<li class="nav-item"><a class="nav-link"
						href="baivietController?action=getListbaiviet2&iddanhmuc=2">THÔNG
							BÁO</a></li>
					<li class="nav-item"><a class="nav-link"
						href="baivietController?action=getListbaiviet2&iddanhmuc=3">TIN
							TỨC</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> SỰ KIỆN</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item"
								href="baivietController?action=getListbaiviet2&iddanhmuc=4">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link"
						href="baivietController?action=getListbaiviet2&iddanhmuc=5">TRƯỜNG</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="baivietController?action=getListbaiviet2&iddanhmuc=6">KHOA</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="baivietController?action=getListbaiviet2&iddanhmuc=6">TRỢ
							GIÚP</a></li>
					<li class="nav-item"><a class="nav-link"
						href="baivietController?action=getListbaiviet2&iddanhmuc=7">NGHIÊN
							CỨU</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="page-container">
		<div class="card m-3">
			<div class="card-body">
				<div class="container">
					<h2 class="font-weight-normal m-b-10"><%=BaiViet.getTieude()%></h2>
					<div class="d-flex m-b-30">

						<div class="m-l-15">
							<a href="javascript:void(0);"
								class="text-dark m-b-0 font-weight-semibold"><%=BaiViet.getHoten()%></a>
							<p class="m-b-0 text-muted font-size-13"><%=BaiViet.getNgayviet()%></p>
						</div>
					</div>
					<img alt="" class="img-fluid "
						style="height: 400px; display: block; margin-left: auto; margin-right: auto;"
						src="<%=BaiViet.getAnh()%>">
					<div class="m-t-30">
						<%=BaiViet.getNoidung()%>"> 
						<p>Ngành IT Việt Nam hiện nay ở đầu của
						sự phát triển. Có thể nói IT là vua của các nghề. Vừa có tiền, có
						quyền. Vừa kiếm được nhiều $ lại được xã hội trọng vọng. Thằng em
						mình học bách khoa cơ khí, sinh năm 96. Tự mày mò học code rồi đi
						làm remote cho công ty Mỹ 2 năm nay. Mỗi tối online 3-4 giờ là
						xong việc. Lương tháng 3k6. Nhưng thu nhập chính vẫn là từ nhận
						các project bên ngoài làm thêm. Tuần làm 2,3 cái nhẹ nhàng 9,10k
						tiền tươi thóc thật không phải đóng thuế. Làm gần được 3 năm mà
						nhà xe nó đã mua đủ cả. Nghĩ mà thèm. Gái gú thì cứ nghe nó bảo
						làm CNTT thì chảy nước. Có bé kia dân du học sinh Úc, về được cô
						chị giới thiệu làm ngân hàng VCB. Thế nào thằng ấy đi mở thẻ tín
						dụng gặp phải thế là hốt được cả chị lẫn em. 3 đứa nó sống chung
						một căn hộ cao cấp. Nhà con bé kia biết chuyện ban đầu phản đối
						sau biết thằng đấy học IT thì đổi thái độ, cách ba bữa hỏi thăm,
						năm bữa tặng quà lấy long, luôn giục cưới kẻo lỡ kèo ngon.
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%@include file="Component/Footer.jsp"%>
</body>

</html>