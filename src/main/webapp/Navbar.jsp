<%@ page import="com.example.baitapnhom.Model.Bean.danhmucModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="Component/MainCSS.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Your Page Title</title>
	<!-- Add your CSS and other head elements here -->
	<style>
		.card-img-top.moving-image {
			animation: moveImage 3s linear infinite;
		}

		@keyframes moveImage {
			0% {
				transform: translateX(0);
			}
			50% {
				transform: translateX(100px);
			}
			100% {
				transform: translateX(0);
			}
		}
	</style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
	<div class="container-fluid">
		<a class="navbar-brand" href="MainPage.jsp"><img alt="" src="image/logo.png"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav" id="navbarNav">
			</ul>
		</div>
	</div>
</nav>
<form class="d-flex justify-content-end align-items-center m-2" action="/baivietController?action=timkiembaiviet" method="post">

	<div class="col-auto ">
		<input class="form-control me-2" type="search" placeholder="Nhập thông tin..." name="Search" id="Search" aria-label="Search">
	</div>
	<div class="col-auto ">
		<button class="btn btn-outline-success" type="submit">Tìm kiếm</button>
	</div>
</form>
<div >
	<img src="image/banner.jpg" class="card-img-top" alt="">
</div>

<!-- Include your JavaScript libraries and other scripts here -->
<script>
	var danhMucList = []; // Define an empty array to hold the danhMucList data

	function getDanhMucData() {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "danhmucController?action=getListdanhmuc2", true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				danhMucList = JSON.parse(xhr.responseText);
				console.log(danhMucList); // This is the retrieved danhMucList data

				// Process danhMuc data here
				populateDanhMucDropdown();
			}
		};
		xhr.send();
	}

	function populateDanhMucDropdown() {
		var navbarNav = document.getElementById("navbarNav");

		danhMucList.forEach(function(danhMuc) {
			if (danhMuc.iddm2 === 0) {
				var dropdownItem = document.createElement("li");
				dropdownItem.className = "nav-item dropdown";

				var dropdownLink = document.createElement("a");
				dropdownLink.className = "nav-link dropdown-toggle";
				dropdownLink.href = "baivietController?action=getListbaiviet2&iddanhmuc=" + danhMuc.iddanhmuc;
				dropdownLink.setAttribute("role", "button");
				dropdownLink.setAttribute("data-bs-toggle", "dropdown");
				dropdownLink.setAttribute("aria-expanded", "false");
				dropdownLink.textContent = danhMuc.tendanhmuc.toUpperCase();

				var dropdownMenu = document.createElement("ul");
				dropdownMenu.className = "dropdown-menu";
				var DropdownItem = document.createElement("li");
				var DropdownLink = document.createElement("a");
				DropdownLink.className = "dropdown-item";
				DropdownLink.href = "baivietController?action=getListbaiviet2&iddanhmuc=" + danhMuc.iddanhmuc;
				DropdownLink.textContent = danhMuc.tendanhmuc.toUpperCase();
				DropdownItem.appendChild(DropdownLink);
				dropdownMenu.appendChild(DropdownItem);
				danhMucList.forEach(function(subDanhMuc) {
					if (subDanhMuc.iddm2 === danhMuc.iddanhmuc) {
						var subDropdownItem = document.createElement("li");
						var subDropdownLink = document.createElement("a");
						subDropdownLink.className = "dropdown-item";
						subDropdownLink.href = "baivietController?action=getListbaiviet2&iddanhmuc=" + subDanhMuc.iddanhmuc;
						subDropdownLink.textContent = subDanhMuc.tendanhmuc.toUpperCase();
						subDropdownItem.appendChild(subDropdownLink);
						dropdownMenu.appendChild(subDropdownItem);
					}
				});

				dropdownItem.appendChild(dropdownLink);
				dropdownItem.appendChild(dropdownMenu);
				navbarNav.appendChild(dropdownItem);
			}
		});
	}

	window.onload = function() {
		getDanhMucData();

		var searchForm = document.getElementById("searchForm");
		searchForm.addEventListener("submit", function(event) {
			event.preventDefault();
			var searchInput = document.getElementById("Search");
			var searchQuery = searchInput.value;
			// Perform search logic here
		});
	};
</script>
</body>
</html>