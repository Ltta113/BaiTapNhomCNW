<%@ page import="com.example.baitapnhom.Model.Bean.danhmucModel" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 12/2/2023
  Time: 1:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Danh sách danh mục</title>
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
        a {
            text-decoration: none;
        }
    </style>
</head>

<body>
<%@include file="NavbarAdmin.jsp"%>
<div class="button-container">
    <h2>Danh sách danh mục:</h2>
    <button class="add-button"><a href="danhmucController?action=getPagetdm" style="text-decoration: none; color: black;">Thêm mới</a></button>
</div>
<div>
    <form class="d-flex justify-content-end align-items-center m-2" action="danhmucController?action=timkiemdanhmuc" method="post">

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
        <th>Tên danh mục</th>
        <th>Danh mục cha</th>
        <th>Thay đổi</th>
    </tr>
    <%
        ArrayList<danhmucModel> ListDanhMuc = (ArrayList<danhmucModel>) request.getAttribute("ListDanhMuc");
        for (int i = 0; i < ListDanhMuc.size(); i++) {
            danhmucModel dm = ListDanhMuc.get(i);
            int idDanhMucCha = dm.getIddm2();

            // Retrieve the category name with iddanhmuc == iddm2
            String categoryName = ""; // Variable to store the category name

            // Get the danhmucModel object with iddanhmuc == iddm2
            if(idDanhMucCha != 0) {
                for (danhmucModel danhMuc : ListDanhMuc) {
                    if (danhMuc.getIddanhmuc() == idDanhMucCha) {
                        categoryName = danhMuc.getTendanhmuc();
                        break;
                    }
                }
            }
    %>
    <tr>
        <td><%= i + 1 %></td>
        <td><%= dm.getTendanhmuc() %></td>
        <td><%= categoryName %></td>
        <td><a href='danhmucController?action=getPagecndm&iddanhmuc=<%= dm.getIddanhmuc() %>'>Thay đổi</a></td>
    </tr>
    <%
        }
    %>
</table>
<br/>
</body>
</html>
