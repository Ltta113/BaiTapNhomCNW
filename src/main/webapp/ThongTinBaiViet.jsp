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
<%@include file="NavbarAdmin.jsp"%>
<div class="page-container">
    <div class="card m-3">
        <div class="card-body">
            <div class="container">
                <h2 class="font-weight-normal m-b-10"><%=BaiViet.getTieude()%></h2>
                <h3 class="font-weight-normal m-b-10">Người viết <%=BaiViet.getHoten()%></h3>
                <h3 class="font-weight-normal m-b-10">Danh mục <%=BaiViet.getTendanhmuc()%></h3>
                <div class="d-flex m-b-30">

                    <div class="m-l-15">
                        <p class="m-b-0 text-muted font-size-13"><%=BaiViet.getNgayviet()%></p>
                    </div>
                </div>
                <img alt="" class="img-fluid "
                     style="height: 400px; display: block; margin-left: auto; margin-right: auto;"
                     src="<%=BaiViet.getAnh()%>">
                <div class="m-t-30">
                    <%=BaiViet.getNoidung()%>
                </div>
                <%
                    HttpSession session1 = request.getSession();
                    int quyen = (int) session1.getAttribute("quyen");
                    if (quyen == 1 && BaiViet.getKiemduyet() == 0) {
                %>
                <button type="button"><a href='baivietController?action=duyetbaiviet&idbaiviet=<%= BaiViet.getIdbaiviet() %>'>Duyệt bài</a></button>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>
<%@include file="Component/Footer.jsp"%>
</body>

</html>