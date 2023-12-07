package com.example.baitapnhom.Model.BO;

import com.example.baitapnhom.Model.Bean.danhmucModel;
import com.example.baitapnhom.Model.DAO.danhmucDAO;

import java.sql.SQLException;
import java.util.ArrayList;

public class danhmucBO {
    danhmucDAO danhmucDao = new danhmucDAO();

    public danhmucBO() throws SQLException, ClassNotFoundException {
    }
    public danhmucModel getDanhMucByIdBO(int iddanhmuc)
    {
        return danhmucDao.getDanhMucByIdDAO(iddanhmuc);
    }
    public ArrayList<danhmucModel> getListdanhmucBO()
    {
        return danhmucDao.getListdanhmucDAO();
    }
    public ArrayList<danhmucModel> getListdanhmucchaBO()
    {
        return danhmucDao.getListdanhmucchaDAO();
    }
    public ArrayList<danhmucModel> timkiemdanhmucBO(String data)
    {
        return danhmucDao.timkiemdanhmucDAO(data);
    }
    public boolean themdanhmucBO(danhmucModel danhmuc) { return danhmucDao.themDanhMucDAO(danhmuc);}
    public boolean capNhatDanhMucBO(danhmucModel danhmuc) { return danhmucDao.capNhatDanhMucDAO(danhmuc);}
}
