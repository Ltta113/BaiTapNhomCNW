package com.example.baitapnhom.Model.DAO;

import com.example.baitapnhom.Model.Bean.baivietModel;
import com.example.baitapnhom.Model.Bean.danhmucModel;

import java.sql.*;
import java.util.ArrayList;

public class danhmucDAO {
    private final Connection cnn;

    public danhmucDAO() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        cnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btncnw", "root", "");
    }

    public boolean themDanhMucDAO(danhmucModel danhMuc) {
        boolean success = false;
        if (cnn != null) {
            try (PreparedStatement stm = cnn.prepareStatement("INSERT INTO danhmuc (tendanhmuc, iddm2) VALUES (?, ?)")) {
                stm.setString(1, danhMuc.getTendanhmuc());
                stm.setInt(2, danhMuc.getIddm2());
                int rowsAffected = stm.executeUpdate();
                if (rowsAffected > 0) {
                    success = true;
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return success;
    }

    public danhmucModel getDanhMucByIdDAO(int iddanhmuc) {
        danhmucModel danhMuc = null;
        if (cnn != null) {
            try (PreparedStatement stm = cnn.prepareStatement("SELECT * FROM danhmuc WHERE iddanhmuc = ?")) {
                stm.setInt(1, iddanhmuc);
                try (ResultSet rs = stm.executeQuery()) {
                    if (rs.next()) {
                        danhMuc = new danhmucModel();
                        danhMuc.setIddanhmuc(rs.getInt("iddanhmuc"));
                        danhMuc.setTendanhmuc(rs.getString("tendanhmuc"));
                        danhMuc.setIddm2(rs.getInt("iddm2"));
                    }
                    return danhMuc;
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return danhMuc;
    }
    public ArrayList<danhmucModel> getListdanhmucDAO() {
        ArrayList<danhmucModel> result = new ArrayList<>();
        danhmucModel danhMuc = null;
        if (cnn != null) {
            try (PreparedStatement stm = cnn.prepareStatement("SELECT * FROM danhmuc ")) {
                try (ResultSet rs = stm.executeQuery()) {
                    while (rs.next()) {
                        danhMuc = new danhmucModel();
                        danhMuc.setIddanhmuc(rs.getInt("iddanhmuc"));
                        danhMuc.setTendanhmuc(rs.getString("tendanhmuc"));
                        danhMuc.setIddm2(rs.getInt("iddm2"));
                        result.add(danhMuc);
                    }
                    return result;
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return result;
    }
    public ArrayList<danhmucModel> getListdanhmucchaDAO() {
        ArrayList<danhmucModel> result = new ArrayList<>();
        danhmucModel danhMuc = null;
        if (cnn != null) {
            try (PreparedStatement stm = cnn.prepareStatement("SELECT * FROM danhmuc where iddm2 = 0")) {
                try (ResultSet rs = stm.executeQuery()) {
                    while (rs.next()) {
                        danhMuc = new danhmucModel();
                        danhMuc.setIddanhmuc(rs.getInt("iddanhmuc"));
                        danhMuc.setTendanhmuc(rs.getString("tendanhmuc"));
                        danhMuc.setIddm2(rs.getInt("iddm2"));
                        result.add(danhMuc);
                    }
                    return result;
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return result;
    }
    public boolean capNhatDanhMucDAO(danhmucModel danhMuc) {
        boolean success = false;
        if (cnn != null) {
            try (PreparedStatement stm = cnn.prepareStatement("UPDATE danhmuc SET tendanhmuc = ?, iddm2 = ? WHERE iddanhmuc = ?")) {
                stm.setString(1, danhMuc.getTendanhmuc());
                stm.setInt(2, danhMuc.getIddm2());
                stm.setInt(3, danhMuc.getIddanhmuc());
                int rowsAffected = stm.executeUpdate();
                if (rowsAffected > 0) {
                    success = true;
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return success;
    }
    public ArrayList<danhmucModel> timkiemdanhmucDAO(String data) {
        ArrayList<danhmucModel> result = new ArrayList<>();
        danhmucModel danhMuc = null;
        String query = "SELECT * FROM danhmuc where tendanhmuc LIKE ?";
        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setString(1, "%" + data + "%");
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                danhMuc = new danhmucModel();
                danhMuc.setIddanhmuc(rs.getInt("iddanhmuc"));
                danhMuc.setTendanhmuc(rs.getString("tendanhmuc"));
                danhMuc.setIddm2(rs.getInt("iddm2"));
                result.add(danhMuc);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}