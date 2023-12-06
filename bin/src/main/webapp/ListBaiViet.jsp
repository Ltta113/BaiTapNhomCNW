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
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>

<h2>Danh sách bài viết:</h2>
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
        <td><%= i + 1 %>
        </td>
        <td><%= dm.getHoten() %>
        </td>
        <td><a href='/BaiTapNhom_war_exploded/baivietController?action=thongtinbaiviet&idbaiviet=<%= dm.getIdbaiviet() %>'><%= dm.getTieude().substring(0, Math.min(dm.getTieude().length(), 20)) %></a>
        </td>
        <td><img src="<%= dm.getAnh() %>" alt=""></td>
        <td><%= dm.getTendanhmuc() %>
        </td>
        <td><%= dm.getNoidung().substring(0, Math.min(dm.getNoidung().length(), 50)) %>
        </td>
        <td><%= dm.getNgayviet() %>
        </td>
        <td>
            <% if (dm.getKiemduyet() == 1) { %>
            Đã duyệt
            <% } else { %>
            Chưa được duyệt
            <% } %>
        </td>
        <td>
            <% if (dm.getKiemduyet() == 0) { %>
            <a href='/BaiTapNhom_war_exploded/baivietController?action=getPagecnbv&idbaiviet=<%= dm.getIdbaiviet() %>'>Thay đổi</a>
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
            <a href='/BaiTapNhom_war_exploded/baivietController?action=xoabaiviet&idbaiviet=<%= dm.getIdbaiviet() %>'>Xóa</a>
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
<br/>
<button><a href="/BaiTapNhom_war_exploded/baivietController?action=getPagetbv">Thêm mới</a></button>
<p><a href="javascript:history.back()">Back</a></p>
</body>
</html>
