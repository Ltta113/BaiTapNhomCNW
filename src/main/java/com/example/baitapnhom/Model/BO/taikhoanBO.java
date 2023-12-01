package com.example.baitapnhom.Model.BO;

import com.example.baitapnhom.Model.Bean.taikhoanModel;
import com.example.baitapnhom.Model.DAO.taikhoanDAO;

import java.sql.SQLException;
import java.util.ArrayList;

public class taikhoanBO {
    taikhoanDAO taikhoanDao = new taikhoanDAO();

    public taikhoanBO() throws SQLException, ClassNotFoundException {
    }
    public taikhoanModel dangnhapBO(String username, String password)
    {
        return taikhoanDao.dangnhapDAO(username, password);
    }
    public taikhoanModel gettaikhoanbyidBO(int idtaikhoan)
    {
        return taikhoanDao.gettaikhoanbyidDAO(idtaikhoan);
    }
    public boolean dangkiBO(taikhoanModel taikhoan) { return taikhoanDao.dangkiDAO(taikhoan);}
    public boolean capnhatthongtinBO(taikhoanModel taikhoan) { return taikhoanDao.capnhatthongtinDAO(taikhoan);}
}
