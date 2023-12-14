<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.baitapnhom.Model.Bean.baivietModel" %><%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 12/2/2023
  Time: 1:13 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<%@include file="Component/MainCSS.jsp"%>

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Danh sách bài viết</title>
    <style>

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid #000;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: cornflowerblue;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .truncate {
            max-width: 200px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .add-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: dodgerblue;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>

<body>
<%@include file="NavbarAdmin.jsp"%>
<div class="button-container">

<h2>Danh sách bài viết:</h2>
    <button class="add-button"><a href="baivietController?action=getPagetbv" style="text-decoration: none; color: black;">Thêm mới</a></button>
</div>
<div>
    <form class="d-flex justify-content-end align-items-center m-2" action="baivietController?action=timkiembaiviet2" method="post">

        <div class="col-auto ">
            <input class="form-control me-2" type="search" placeholder="Nhập thông tin..." name="Search" id="Search" aria-label="Search">
        </div>
        <div class="col-auto ">
            <button class="btn btn-outline-success" type="submit">Tìm kiếm</button>
        </div>
    </form>
</div>
<table>
    <tr>
        <th>STT</th>
        <th>Tác giả</th>
        <th>Tên bài viết</th>
        <th>Ảnh bài viết</th>
        <th>Danh mục</th>
        <th>Nội dung</th>
        <th>Ngày viết</th>
        <th>Kiểm duyệt</th>
        <th>Cập nhật</th>
        <th>Xóa</th>
    </tr>
    <%
        ArrayList<baivietModel> ListBaiViet = (ArrayList<baivietModel>) request.getAttribute("ListBaiViet");
        for (int i = 0; i < ListBaiViet.size(); i++) {
            baivietModel dm = ListBaiViet.get(i);
    %>
    <tr>
        <td><%= i + 1 %></td>
        <td><%= dm.getHoten() %></td>
        <td><a href='baivietController?action=thongtinbaiviet&idbaiviet=<%= dm.getIdbaiviet() %>' class="truncate"><%= dm.getTieude() %></a></td>
        <td><img src="<%= dm.getAnh() %>" alt="" height="50"></td>
        <td><%= dm.getTendanhmuc() %></td>
        <td class="truncate"><%= dm.getNoidung().substring(0, Math.min(dm.getNoidung().length(), 100)) %></td>
        <td><%= dm.getNgayviet() %></td>
        <td>
            <% if (dm.getKiemduyet() == 1) { %>
            Đã duyệt
            <% } else { %>
            Chưa được duyệt
            <% } %>
        </td>
        <td>
            <% if (dm.getKiemduyet() == 0) { %>
            <a href='baivietController?action=getPagecnbv&idbaiviet=<%= dm.getIdbaiviet() %>'>Thay đổi</a>
            <% } else { %>
            Không thể thay đổi
            <% } %>
        </td>
        <td>
            <%
                HttpSession session1 = request.getSession();
                int quyen = (int) session1.getAttribute("quyen");
                if (dm.getKiemduyet() == 1 && quyen == 1 || dm.getKiemduyet() == 0) {
            %>
            <a href='baivietController?action=xoabaiviet&idbaiviet=<%= dm.getIdbaiviet() %>'>Xóa</a>
            <%
            } else {
            %>
            Không thể xóa
            <%
                }
            %>
        </td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>