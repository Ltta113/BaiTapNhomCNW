package com.example.baitapnhom.Controller;

import com.example.baitapnhom.Model.BO.baivietBO;
import com.example.baitapnhom.Model.BO.danhmucBO;
import com.example.baitapnhom.Model.Bean.baivietModel;
import com.example.baitapnhom.Model.Bean.danhmucModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "baivietController",urlPatterns = "/baivietController")
public class baivietController extends HttpServlet {
    baivietBO baivietBo = new baivietBO();
    private HttpSession session;
    public baivietController() throws SQLException, ClassNotFoundException {
    }
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        if(action.equals("getListbaiviet"))
        {
            try {
                getListbaiviet(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("getListbaiviet2"))
        {
            try {
                getListbaiviet2(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("getPagetbv"))
        {
            try {
                getPagetbv(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("thembaiviet"))
        {
            try {
                thembaiviet(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("getPagecnbv"))
        {
            try {
                getPagecnbv(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("capnhatbaiviet"))
        {
            try {
                capnhatbaiviet(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("xoabaiviet"))
        {
            try {
                xoabaiviet(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("thongtinbaiviet"))
        {
            try {
                thongtinbaiviet(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
      
        if(action.equals("thongtinbaivietFE"))
        {
            try {
                thongtinbaivietFE(request, response);;
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("duyetbaiviet"))
        {
            try {
                duyetbaiviet(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("timkiembaiviet"))
        {
            try {
                timkiembaiviet(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("timkiembaiviet2"))
        {
            try {
                timkiembaiviet2(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }
    public void getListbaiviet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        session = request.getSession();
        int quyen = (int) session.getAttribute("quyen");
            int idtaikhoan = (int) session.getAttribute("idtaikhoan");
            //int iddanhmuc = Integer.parseInt(request.getParameter("iddanhmuc"));
            if (quyen == 1) {
                ArrayList<baivietModel> ListBaiViet = null;
                if (request.getParameter("iddanhmuc") != null) {
                    ListBaiViet = baivietBo.getlistbaivietBydanhmucBO(Integer.parseInt(request.getParameter("iddanhmuc")));
                } else
                    ListBaiViet = baivietBo.getlistbaivietBO();
                request.setAttribute("ListBaiViet", ListBaiViet);
                RequestDispatcher rd = request.getRequestDispatcher("ListBaiViet.jsp");
                rd.forward(request, response);
            } else if (quyen == 0) {
                ArrayList<baivietModel> ListBaiViet = baivietBo.getbaivietbyIdcanhanBO(idtaikhoan);
                request.setAttribute("ListBaiViet", ListBaiViet);
                RequestDispatcher rd = request.getRequestDispatcher("ListBaiViet.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("DangNhap.jsp");
                rd.forward(request, response);
            }

    }
    public void getListbaiviet2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {

        int iddanhmuc = Integer.parseInt(request.getParameter("iddanhmuc"));
        	 ArrayList<baivietModel> ListBaiViet = null;
        	if(request.getParameter("iddanhmuc")!=null) {
             ListBaiViet = baivietBo.getlistbaivietBydanhmucBOFE(iddanhmuc);
            }
        	else
        	 ListBaiViet = baivietBo.getlistbaivietBOFE();
            request.setAttribute("ListBaiViet", ListBaiViet);
            RequestDispatcher rd = request.getRequestDispatcher("ViewBaiViet.jsp");
            rd.forward(request, response);
        
    }
    public void getPagetbv(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        session = request.getSession();
        int idtaikhoan = (int) session.getAttribute("idtaikhoan");
        if(idtaikhoan != 0) {
            danhmucBO danhmucBo = new danhmucBO();
            ArrayList<danhmucModel> ListDanhMuc = danhmucBo.getListdanhmucBO();
            request.setAttribute("ListDanhMuc", ListDanhMuc);
            RequestDispatcher rd = request.getRequestDispatcher("ThemBaiViet.jsp");
            rd.forward(request, response);
        }
        else {
            RequestDispatcher rd = request.getRequestDispatcher("TrangChuAdmin.jsp");
            rd.forward(request, response);
        }
    }
    public void getPagecnbv(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        session = request.getSession();
        int idtaikhoan = (int) session.getAttribute("idtaikhoan");
        int idbaiviet = Integer.parseInt(request.getParameter("idbaiviet"));
        boolean checkkiemduyet = baivietBo.checkduyetbaiBO(idbaiviet);
        if(idtaikhoan != 0 && checkkiemduyet) {
            danhmucBO danhmucBo = new danhmucBO();
            ArrayList<danhmucModel> ListDanhMuc = danhmucBo.getListdanhmucBO();
            baivietModel BaiViet = baivietBo.getbaivietbyidBO(idbaiviet);
            request.setAttribute("ListDanhMuc", ListDanhMuc);
            request.setAttribute("BaiViet", BaiViet);
            RequestDispatcher rd = request.getRequestDispatcher("CapNhatBaiViet.jsp");
            rd.forward(request, response);
        }
        else {
            RequestDispatcher rd = request.getRequestDispatcher("TrangChuAdmin.jsp");
            rd.forward(request, response);
        }
    }
    public void thembaiviet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        baivietModel BaiViet = new baivietModel();
        BaiViet.setIdtaikhoan((int) session.getAttribute("idtaikhoan"));
        BaiViet.setIddanhmuc(Integer.parseInt(request.getParameter("iddanhmuc")));
        BaiViet.setTieude((request.getParameter("tieude")));
        BaiViet.setNoidung((request.getParameter("noidung")));
        BaiViet.setNgayviet(new Date(System.currentTimeMillis()));
        BaiViet.setAnh((request.getParameter("anh")));
        baivietBo.taobaivietBO(BaiViet);
        RequestDispatcher rd = request.getRequestDispatcher("TrangChuAdmin.jsp");
        rd.forward(request, response);
    }
    public void capnhatbaiviet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        baivietModel BaiViet = new baivietModel();
        BaiViet.setIdbaiviet(Integer.parseInt(request.getParameter("idbaiviet")));
        System.out.println(Integer.parseInt(request.getParameter("idbaiviet")));
        BaiViet.setIdtaikhoan((int) session.getAttribute("idtaikhoan"));
        BaiViet.setIddanhmuc(Integer.parseInt(request.getParameter("iddanhmuc")));
        BaiViet.setTieude((request.getParameter("tieude")));
        BaiViet.setNoidung((request.getParameter("noidung")));
        BaiViet.setNgayviet(new Date(System.currentTimeMillis()));
        BaiViet.setAnh((request.getParameter("anh")));
        baivietBo.capnhatbaivietBO(BaiViet);
        RequestDispatcher rd = request.getRequestDispatcher("TrangChuAdmin.jsp");
        rd.forward(request, response);
    }
    public void xoabaiviet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int quyen = (int) session.getAttribute("quyen");
        int idtaikhoan = (int) session.getAttribute("idtaikhoan");
        int idbaiviet = Integer.parseInt(request.getParameter("idbaiviet"));
        boolean checkkiemduyet = baivietBo.checkduyetbaiBO(idbaiviet);
        if(idtaikhoan != 0 && !checkkiemduyet && quyen == 1 || idtaikhoan != 0 && checkkiemduyet) {
            baivietBo.xoabaivietBO(idbaiviet);
            RequestDispatcher rd = request.getRequestDispatcher("TrangChuAdmin.jsp");
            rd.forward(request, response);
        }
        else {
            RequestDispatcher rd = request.getRequestDispatcher("TrangChuAdmin.jsp");
            rd.forward(request, response);
        }
    }
    public void thongtinbaiviet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
            int idbaiviet = Integer.parseInt(request.getParameter("idbaiviet"));
            baivietModel BaiViet = baivietBo.getbaivietbyidBO(idbaiviet);
            request.setAttribute("BaiViet", BaiViet);
            RequestDispatcher rd = request.getRequestDispatcher("ThongTinBaiViet.jsp");
            rd.forward(request, response);
    }
  
    public void thongtinbaivietFE(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int idbaiviet = Integer.parseInt(request.getParameter("idbaiviet"));
        baivietModel BaiViet = baivietBo.getbaivietbyidBO(idbaiviet);
        request.setAttribute("BaiViet", BaiViet);
        RequestDispatcher rd = request.getRequestDispatcher("ViewDetailBaiViet.jsp");
        rd.forward(request, response);
}
    public void duyetbaiviet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int quyen = (int) session.getAttribute("quyen");
        int idtaikhoan = (int) session.getAttribute("idtaikhoan");
        int idbaiviet = Integer.parseInt(request.getParameter("idbaiviet"));
        boolean checkkiemduyet = baivietBo.checkduyetbaiBO(idbaiviet);
        if(idtaikhoan != 0 && checkkiemduyet && quyen == 1) {
            baivietBo.duyetbaiBO(idbaiviet);
            RequestDispatcher rd = request.getRequestDispatcher("TrangChuAdmin.jsp");
            rd.forward(request, response);
        }
        else {
            RequestDispatcher rd = request.getRequestDispatcher("TrangChuAdmin.jsp");
            rd.forward(request, response);
        }
    }
    public void timkiembaiviet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String data = request.getParameter("Search");
        System.out.println(data);
        ArrayList<baivietModel> ListBaiViet = baivietBo.findBaiVietBO(data);
        request.setAttribute("ListBaiViet", ListBaiViet);
        RequestDispatcher rd = request.getRequestDispatcher("ViewBaiViet.jsp");
        rd.forward(request, response);
    }
    public void timkiembaiviet2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String data = request.getParameter("Search");
        System.out.println(data);
        ArrayList<baivietModel> ListBaiViet = baivietBo.findBaiVietBO(data);
        request.setAttribute("ListBaiViet", ListBaiViet);
        RequestDispatcher rd = request.getRequestDispatcher("ListBaiViet.jsp");
        rd.forward(request, response);
    }
}
