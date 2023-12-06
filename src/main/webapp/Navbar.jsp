<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="Component/MainCSS.jsp"%>

<nav class="navbar navbar-expand-lg ">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><img alt="" src="image/logo.png"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link " aria-current="page"
					href="baivietController?action=getListbaiviet&iddanhmuc=1">GIỚI
						THIỆU</a></li>
				<li class="nav-item"><a class="nav-link"
					href="baivietController?action=getListbaiviet&iddanhmuc=2">THÔNG
						BÁO</a></li>
				<li class="nav-item"><a class="nav-link"
					href="baivietController?action=getListbaiviet&iddanhmuc=3">TIN
						TỨC</a></li>
				<li class="nav-item"><a class="nav-link"
					href="baivietController?action=getListbaiviet&iddanhmuc=4">SỰ
						KIỆN</a></li>
						<li class="nav-item"><a class="nav-link"
					href="baivietController?action=getListbaiviet&iddanhmuc=5">TRƯỜNG</a></li>
<!-- 
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle"
					href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Dropdown link </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul></li>
 -->
				<li class="nav-item"><a class="nav-link"
					href="baivietController?action=getListbaiviet&iddanhmuc=6">KHOA</a></li>
				<li class="nav-item"><a class="nav-link"
					href="baivietController?action=getListbaiviet&iddanhmuc=7">TRỢ
						GIÚP</a></li>
				<li class="nav-item"><a class="nav-link"
					href="baivietController?action=getListbaiviet&iddanhmuc=8">NGHIÊN
						CỨU</a></li>
						<li class="nav-item"><a class="nav-link"
					href="baivietController?action=getListbaiviet&iddanhmuc=9">HỌC PHÍ</a></li>

				<!-- 
				 <li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle"
					href="baivietController?action=getListbaiviet&iddanhmuc=9"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						HỌC PHÍ </a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Action</a></li>

					</ul></li>
				 -->

			</ul>
		</div>
	</div>

</nav>
