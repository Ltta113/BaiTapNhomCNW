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
		
			<ul class="navbar-nav">
			<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle"
					href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						GIỚI THIỆU</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="baivietController?action=getListbaiviet2&iddanhmuc=1">Giới thiệu</a></li>
						<li><a class="dropdown-item" href="baivietController?action=getListbaiviet2&iddanhmuc=5">Trường</a></li>
						
					</ul></li>
				
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle"
					href="#"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						THÔNG BÁO</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="baivietController?action=getListbaiviet2&iddanhmuc=2">Thông báo</a></li>
						<li><a class="dropdown-item" href="baivietController?action=getListbaiviet2&iddanhmuc=9">Học phí</a></li>
						
					</ul></li>
				<li class="nav-item"><a class="nav-link"
					href="baivietController?action=getListbaiviet2&iddanhmuc=3">TIN TỨC</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="baivietController?action=getListbaiviet2&iddanhmuc=4">SỰ KIỆN</a>
				</li>
			
				<li class="nav-item"><a class="nav-link"
					href="baivietController?action=getListbaiviet2&iddanhmuc=5">TRƯỜNG</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="baivietController?action=getListbaiviet2&iddanhmuc=6">KHOA</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="baivietController?action=getListbaiviet2&iddanhmuc=6">TRỢ GIÚP</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="baivietController?action=getListbaiviet2&iddanhmuc=7">NGHIÊN CỨU</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
			<form class="d-flex justify-content-end align-items-center m-2">
      
  <div class="col-auto ">
      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
  </div>
  <div class="col-auto ">
    <button class="btn btn-outline-success" type="submit">Search</button>
  </div>
      </form>

<div class="card mb-3">
  <img src="image/banner.jpg" class="card-img-top" alt="">
 
</div>
