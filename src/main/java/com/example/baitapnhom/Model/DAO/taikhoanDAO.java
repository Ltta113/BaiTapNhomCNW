package com.example.baitapnhom.Model.DAO;

import com.example.baitapnhom.Model.Bean.taikhoanModel;

import java.sql.*;

public class taikhoanDAO {
    private final Connection cnn;
    public taikhoanDAO() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        cnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btncnw", "root", "01012003");
    }
    public boolean dangkiDAO(taikhoanModel taikhoan) {
        boolean success = false; // Initialize the success flag as false
        if (cnn != null) {
            try (PreparedStatement stm = cnn.prepareStatement("INSERT INTO taikhoan (username, password, hoten, quyen, ngaysinh) VALUES (?, ?, ?, ?, ?)")) {
                stm.setString(1, taikhoan.getUsername());
                stm.setString(2, taikhoan.getPassword());
                stm.setString(3, taikhoan.getHoten());
                stm.setInt(4, taikhoan.getQuyen());
                stm.setDate(5, taikhoan.getNgaysinh());
                int rowsAffected = stm.executeUpdate();
                if (rowsAffected > 0) {
                    success = true; // Set the success flag to true if rows were affected
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return success; // Return the success flag
    }
    public taikhoanModel dangnhapDAO(String username, String password) {
        taikhoanModel taikhoanModel = null;
        if (cnn != null) {
            try (PreparedStatement stm = cnn.prepareStatement("SELECT * FROM taikhoan where username = ? AND password = ?")) {
                stm.setString(1, username);
                stm.setString(2, password);
                try (ResultSet rs = stm.executeQuery()) {
                    if (rs.next()) {
                        taikhoanModel = new taikhoanModel();
                        taikhoanModel.setIdtaikhoan(rs.getInt("idtaikhoan"));
                        taikhoanModel.setUsername(rs.getString("username"));
                        taikhoanModel.setPassword(rs.getString("password"));
                        taikhoanModel.setHoten(rs.getString("hoten"));
                        taikhoanModel.setQuyen(rs.getInt("quyen"));
                        taikhoanModel.setNgaysinh(rs.getDate("ngaysinh"));
                    }
                    return taikhoanModel;
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return taikhoanModel;
    }
    public taikhoanModel gettaikhoanbyidDAO(int idtaikhoan) {
        taikhoanModel taikhoanModel = null;
        if (cnn != null) {
            try (PreparedStatement stm = cnn.prepareStatement("SELECT * FROM taikhoan where idtaikhoan = ?")) {
                stm.setInt(1, idtaikhoan);
                try (ResultSet rs = stm.executeQuery()) {
                    if (rs.next()) {
                        taikhoanModel = new taikhoanModel();
                        taikhoanModel.setIdtaikhoan(rs.getInt("idtaikhoan"));
                        taikhoanModel.setUsername(rs.getString("username"));
                        taikhoanModel.setPassword(rs.getString("password"));
                        taikhoanModel.setHoten(rs.getString("hoten"));
                        taikhoanModel.setQuyen(rs.getInt("quyen"));
                        taikhoanModel.setNgaysinh(rs.getDate("ngaysinh"));
                    }
                    return taikhoanModel;
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return taikhoanModel;
    }
    public boolean capnhatthongtinDAO(taikhoanModel taikhoanModel) {
        boolean success = false; // Initialize the success flag as false
        if (cnn != null) {
            try (PreparedStatement stm = cnn.prepareStatement("UPDATE taikhoan SET username = ?, password = ?, hoten = ?, quyen = ?, ngaysinh = ? WHERE idtaikhoan = ?")) {
                stm.setString(1, taikhoanModel.getUsername());
                stm.setString(2, taikhoanModel.getPassword());
                stm.setString(3, taikhoanModel.getHoten());
                stm.setInt(4, taikhoanModel.getQuyen());
                stm.setDate(5, taikhoanModel.getNgaysinh());
                stm.setInt(6, taikhoanModel.getIdtaikhoan());
                int rowsAffected = stm.executeUpdate();
                if (rowsAffected > 0) {
                    success = true; // Set the success flag to true if rows were affected
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return success; // Return the success flag
    }
}
