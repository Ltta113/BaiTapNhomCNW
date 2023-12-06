package com.example.baitapnhom.Controller;

import com.example.baitapnhom.Model.BO.taikhoanBO;
import com.example.baitapnhom.Model.Bean.taikhoanModel;
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

@WebServlet(name = "taikhoanController",urlPatterns = "/taikhoanController")
public class taikhoanController extends HttpServlet {
    taikhoanBO taikhoanBo = new taikhoanBO();
    private HttpSession session;
    public taikhoanController() throws SQLException, ClassNotFoundException {
    }
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");
        if(action.equals("dangnhap"))
        {
            try {
                dangnhap(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("dangky"))
        {
            try {
                dangky(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("getPagecntk"))
        {
            try {
                getPagecntk(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("capnhatthongtin"))
        {
            try {
                capnhatthongtin(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
        if(action.equals("dangxuat"))
        {
            try {
                capnhatthongtin(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws IOException, ServletException {
        doGet(request, response);
    }
    public void dangnhap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        taikhoanModel taikhoan = taikhoanBo.dangnhapBO(username, password);
        if(taikhoan == null) {
            RequestDispatcher rd = request.getRequestDispatcher("DangNhap.jsp");
            rd.forward(request, response);
        }
        else {
            session = request.getSession();
            session.setAttribute("username", taikhoan.getUsername());
            session.setAttribute("quyen", taikhoan.getQuyen());
            session.setAttribute("idtaikhoan", taikhoan.getIdtaikhoan());
            RequestDispatcher rd = request.getRequestDispatcher("Navbar.jsp");
            rd.forward(request, response);
        }
    }
    public void dangky(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        taikhoanModel taikhoan = new taikhoanModel();
        taikhoan.setUsername(request.getParameter("username"));
        taikhoan.setPassword(request.getParameter("password"));
        taikhoan.setHoten(request.getParameter("hoten"));
        taikhoan.setQuyen(0);
        taikhoan.setNgaysinh(Date.valueOf(request.getParameter("ngaysinh")));

        boolean check = taikhoanBo.dangkiBO(taikhoan);
        if(check){
            RequestDispatcher rd = request.getRequestDispatcher("TrangChuAdmin.jsp");
            rd.forward(request, response);
        }
        else {
            RequestDispatcher rd = request.getRequestDispatcher("DangKy.jsp");
            rd.forward(request, response);
        }
    }
    public void dangxuat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        session = request.getSession();
        session.setAttribute("username", "");
        session.setAttribute("quyen", "");
        session.setAttribute("idtaikhoan", "");
    }
    public void getPagecntk(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int idtaikhoan = (int) session.getAttribute("idtaikhoan");

        taikhoanModel taikhoan = taikhoanBo.gettaikhoanbyidBO(idtaikhoan);
        if(taikhoan == null) {
            RequestDispatcher rd = request.getRequestDispatcher("DangNhap.jsp");
            rd.forward(request, response);
        }
        else {
            request.setAttribute("taikhoan", taikhoan);
            RequestDispatcher rd = request.getRequestDispatcher("CapNhatThongTin.jsp");
            rd.forward(request, response);
        }
    }
    public void capnhatthongtin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        taikhoanModel taikhoan = new taikhoanModel();
        taikhoan.setIdtaikhoan((int) session.getAttribute("idtaikhoan"));
        System.out.println((int) session.getAttribute("idtaikhoan"));
        System.out.println((String) session.getAttribute("username"));
        System.out.println((int) session.getAttribute("quyen"));
        System.out.println(request.getParameter("password"));
        System.out.println(request.getParameter("hoten"));
        System.out.println(request.getParameter("ngaysinh"));
        taikhoan.setUsername((String) session.getAttribute("username"));
        taikhoan.setPassword(request.getParameter("password"));
        taikhoan.setHoten(request.getParameter("hoten"));
        taikhoan.setQuyen((int) session.getAttribute("quyen"));
        taikhoan.setNgaysinh(Date.valueOf(request.getParameter("ngaysinh")));

        boolean check = taikhoanBo.capnhatthongtinBO(taikhoan);
        if(check){
            RequestDispatcher rd = request.getRequestDispatcher("TrangChuAdmin.jsp");
            rd.forward(request, response);
        }
        else {
            getPagecntk(request, response);
        }
    }
}
