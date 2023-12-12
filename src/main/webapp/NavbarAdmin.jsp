<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="Component/MainCSS.jsp"%>

<nav class="navbar navbar-expand-lg ">
    <div class="container-fluid">
        <a class="navbar-brand" href="TrangChuAdmin.jsp"><img alt="" src="image/logo.png"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">

            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link"
                                        href="danhmucController?action=getListdanhmuc">DANH SÁCH DANH MỤC</a>
                </li>
                <li class="nav-item"><a class="nav-link"
                                        href="baivietController?action=getListbaiviet">DANH SÁCH BÀI VIẾT CỦA BẠN</a>
                </li>
                <li class="nav-item"><a class="nav-link"
                                        href="taikhoanController?action=getPagecntk">CẬP NHẬT THÔNG TIN CÁ NHÂN</a>
                </li>
                <li class="nav-item"><a class="nav-link"
                                        href="taikhoanController?action=dangxuat">ĐĂNG XUẤT</a>
                </li>
            </ul>
        </div>
        <div class="name"> </div>
    </div>
</nav>

