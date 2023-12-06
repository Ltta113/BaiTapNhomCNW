package com.example.baitapnhom.Controller;

import com.example.baitapnhom.Model.BO.danhmucBO;
import com.example.baitapnhom.Model.BO.taikhoanBO;
import com.example.baitapnhom.Model.Bean.danhmucModel;
import com.example.baitapnhom.Model.Bean.taikhoanModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "danhmucController",urlPatterns = "/danhmucController")
public class danhmucController extends HttpServlet {
    danhmucBO danhmucBo = new danhmucBO();
    private HttpSession session;
    public danhmucController() throws SQLException, ClassNotFoundException {
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        if(action.equals("getListdanhmuc"))
        {
            try {
                getListdanhmuc(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("getPagecndm"))
        {
            try {
                getPagecndm(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("capnhatdanhmuc"))
        {
            try {
                capnhatdanhmuc(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("getPagetdm"))
        {
            try {
                getPagetdm(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("themdanhmuc"))
        {
            try {
                themdanhmuc(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }
    public void getListdanhmuc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        session = request.getSession();
        int quyen = (int) session.getAttribute("quyen");
        if(quyen == 1) {
            ArrayList<danhmucModel> ListDanhMuc = danhmucBo.getListdanhmucBO();
            request.setAttribute("ListDanhMuc", ListDanhMuc);
            RequestDispatcher rd = request.getRequestDispatcher("ListDanhMuc.jsp");
            rd.forward(request, response);
        }
        else {
            RequestDispatcher rd = request.getRequestDispatcher("TrangChuAdmin.jsp");
            rd.forward(request, response);
        }
    }
//    public void getListDanhMucCha(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
//            ArrayList<danhmucModel> ListDanhMuc = danhmucBo.getListdanhmucchaBO();
//            request.setAttribute("ListDanhMuc", ListDanhMuc);
//            RequestDispatcher rd = request.getRequestDispatcher("ListDanhMuc.jsp");
//            rd.forward(request, response);
//        }
//        else {
//            RequestDispatcher rd = request.getRequestDispatcher("TrangChuAdmin.jsp");
//            rd.forward(request, response);
//        }
//    }
    public void getPagecndm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        session = request.getSession();
        int quyen = (int) session.getAttribute("quyen");
        int iddanhmuc = Integer.parseInt(request.getParameter("iddanhmuc"));
        if(quyen == 1) {
            danhmucModel DanhMuc = danhmucBo.getDanhMucByIdBO(iddanhmuc);
            ArrayList<danhmucModel> ListDanhMuc = danhmucBo.getListdanhmucBO();
            request.setAttribute("ListDanhMuc", ListDanhMuc);
            request.setAttribute("DanhMuc", DanhMuc);
            RequestDispatcher rd = request.getRequestDispatcher("CapNhatDanhMuc.jsp");
            rd.forward(request, response);
        }
        else {
            RequestDispatcher rd = request.getRequestDispatcher("TrangChuAdmin.jsp");
            rd.forward(request, response);
        }
    }
    public void getPagetdm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        session = request.getSession();
        int quyen = (int) session.getAttribute("quyen");
        if(quyen == 1) {
            ArrayList<danhmucModel> ListDanhMuc = danhmucBo.getListdanhmucBO();
            request.setAttribute("ListDanhMuc", ListDanhMuc);
            RequestDispatcher rd = request.getRequestDispatcher("ThemDanhMuc.jsp");
            rd.forward(request, response);
        }
        else {
            RequestDispatcher rd = request.getRequestDispatcher("TrangChuAdmin.jsp");
            rd.forward(request, response);
        }
    }
    public void capnhatdanhmuc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        danhmucModel DanhMuc = new danhmucModel();
        DanhMuc.setIddanhmuc(Integer.parseInt(request.getParameter("iddanhmuc")));
        DanhMuc.setIddm2(Integer.parseInt(request.getParameter("iddm2")));
        DanhMuc.setTendanhmuc(request.getParameter("tendanhmuc"));
        danhmucBo.capNhatDanhMucBO(DanhMuc);
        getListdanhmuc(request, response);
    }
    public void themdanhmuc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        danhmucModel DanhMuc = new danhmucModel();
        DanhMuc.setIddm2(Integer.parseInt(request.getParameter("iddm2")));
        DanhMuc.setTendanhmuc(request.getParameter("tendanhmuc"));
        danhmucBo.themdanhmucBO(DanhMuc);
        getListdanhmuc(request, response);
    }
}
