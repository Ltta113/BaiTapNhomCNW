<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.example.baitapnhom.Model.Bean.baivietModel"%><%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 12/2/2023
  Time: 1:13 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Danh sách bài viết</title>

</head>

<body>
	<%@include file="Navbar.jsp"%>
	
	<%
        ArrayList<baivietModel> ListBaiViet = (ArrayList<baivietModel>) request.getAttribute("ListBaiViet");
        for (int i = 0; i < ListBaiViet.size(); i++) {
            baivietModel dm = ListBaiViet.get(i);
    %>
	<div class="card mb-3 mt-2 " >
		<div class="card-body ">
			<div class="row">
				<div class="col-md-4">
					<img class="img-fluid" style="height: 200px" src="<%= dm.getAnh() %>" alt="">
				</div>
				<div class="col-md-8">
					<h4 class="m-b-10"><%= dm.getTieude().substring(0, Math.min(dm.getTieude().length(), 20)) %></h4>
					<div class="d-flex align-items-center m-t-5 m-b-15">
						<div class="avatar avatar-image avatar-sm">
							<img src="assets/images/avatars/thumb-3.jpg" alt="">
						</div>
						<div class="m-l-10">
							<span class="text-gray"><%= dm.getNgayviet() %></span>
						</div>
					</div>
					<p class="m-b-20"><%= dm.getNoidung().substring(0, Math.min(dm.getNoidung().length(), 100)) %></p>
					<div class="text-right">
						<a class="btn btn-hover font-weight-semibold"
							href='baivietController?action=thongtinbaivietFE&idbaiviet=<%= dm.getIdbaiviet() %>'> <span>Xem thêm</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	 <%
        }
    %>
    <%@include file="Component/Footer.jsp"%>
</body>
</html>
