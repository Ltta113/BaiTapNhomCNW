package com.example.baitapnhom.Model.BO;

import com.example.baitapnhom.Model.Bean.baivietModel;
import com.example.baitapnhom.Model.DAO.baivietDAO;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class baivietBO {
    baivietDAO baivietDao = new baivietDAO();

    public baivietBO() throws SQLException, ClassNotFoundException {

    }

    public boolean taobaivietBO(baivietModel baiviet) {
        return baivietDao.create(baiviet);
    }

    public baivietModel getbaivietbyidBO(int id) {
        return baivietDao.readById(id);
    }

    public ArrayList<baivietModel> getlistbaivietBO() {
        return baivietDao.readAll();
    }

    public boolean capnhatbaivietBO(baivietModel baiviet) {
        return baivietDao.update(baiviet);
    }

    public boolean xoabaivietBO(int id) {
        return baivietDao.delete(id);
    }
    public boolean duyetbaiBO(int id) {
        return baivietDao.duyetbai(id);
    }
    public boolean checkduyetbaiBO(int id) {
        return baivietDao.checkduyetbai(id);
    }
    public ArrayList<baivietModel> getbaivietbyIdcanhanBO(int id) {
        return baivietDao.getbaivietbyIdcanhanDAO(id);
    }
}
