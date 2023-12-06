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
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>

<h2>Danh sách danh mục:</h2>
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
        <td><a href='/BaiTapNhom_war_exploded/danhmucController?action=getPagecndm&iddanhmuc=<%= dm.getIddanhmuc() %>'>Thay đổi</a></td>
    </tr>
    <%
        }
    %>
</table>
<br/>
<button><a href="/BaiTapNhom_war_exploded/danhmucController?action=getPagetdm">Thêm mới</a></button>
<p><a href="javascript:history.back()">Back</a></p>
</body>
</html>
