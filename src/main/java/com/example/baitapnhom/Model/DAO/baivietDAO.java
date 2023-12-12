package com.example.baitapnhom.Model.DAO;

import com.example.baitapnhom.Model.Bean.baivietModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class baivietDAO {
    private final Connection cnn;

    public baivietDAO() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        cnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btncnw", "root", "");
    }

    public boolean create(baivietModel baiviet) {
        String query = "INSERT INTO baiviet (iddanhmuc, tieude, noidung, idtaikhoan, ngayviet, anh, kiemduyet) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setInt(1, baiviet.getIddanhmuc());
            statement.setString(2, baiviet.getTieude());
            statement.setString(3, baiviet.getNoidung());
            statement.setInt(4, baiviet.getIdtaikhoan());
            statement.setDate(5, baiviet.getNgayviet());
            statement.setString(6, baiviet.getAnh());
            statement.setInt(7, 0);

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public baivietModel readById(int id) {
        String query = "SELECT * \n" +
                "FROM baiviet bv\n" +
                "join danhmuc dm on bv.iddanhmuc = dm.iddanhmuc\n" +
                "join taikhoan tk on bv.idtaikhoan = tk.idtaikhoan" +
                " WHERE idbaiviet = ? ORDER BY ngayviet DESC ";
        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return extractBaivietFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public ArrayList<baivietModel> findBaiViet(String data) {
        ArrayList<baivietModel> baiviets = new ArrayList<>();
        String query = "SELECT * \n" +
                "FROM baiviet bv\n" +
                "join danhmuc dm on bv.iddanhmuc = dm.iddanhmuc\n" +
                "join taikhoan tk on bv.idtaikhoan = tk.idtaikhoan" +
                " WHERE bv.tieude LIKE ? ORDER BY bv.ngayviet DESC";
        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setString(1, "%" + data + "%");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                baivietModel baiviet = extractBaivietFromResultSet(resultSet);
                baiviets.add(baiviet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return baiviets;
    }
    public ArrayList<baivietModel> getbaivietbyIdcanhanDAO(int id) {
        ArrayList<baivietModel> baiviets = new ArrayList<>();
        String query = "SELECT * \n" +
                "FROM baiviet bv\n" +
                "join danhmuc dm on bv.iddanhmuc = dm.iddanhmuc\n" +
                "join taikhoan tk on bv.idtaikhoan = tk.idtaikhoan" +
                " WHERE bv.idtaikhoan = ? ORDER BY ngayviet DESC";
        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                baivietModel baiviet = extractBaivietFromResultSet(resultSet);
                baiviets.add(baiviet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return baiviets;
    }
    public ArrayList<baivietModel> getbaivietbyIddanhmucDAO(int id) {
        ArrayList<baivietModel> baiviets = new ArrayList<>();
        String query = "SELECT * \n" +
                "FROM baiviet bv\n" +
                "join danhmuc dm on bv.iddanhmuc = dm.iddanhmuc\n" +
                "join taikhoan tk on bv.idtaikhoan = tk.idtaikhoan" +
                " WHERE bv.iddanhmuc = ? ORDER BY ngayviet DESC";
        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                baivietModel baiviet = extractBaivietFromResultSet(resultSet);
                baiviets.add(baiviet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return baiviets;
    }
    public ArrayList<baivietModel> getbaivietbyIddanhmucDAOFE(int id) {
        ArrayList<baivietModel> baiviets = new ArrayList<>();
        String query = "SELECT * \n" +
                "FROM baiviet bv\n" +
                "join danhmuc dm on bv.iddanhmuc = dm.iddanhmuc\n" +
                "join taikhoan tk on bv.idtaikhoan = tk.idtaikhoan" +
                " WHERE bv.iddanhmuc = ? AND bv.kiemduyet = 1 ORDER BY ngayviet DESC";
        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                baivietModel baiviet = extractBaivietFromResultSet(resultSet);
                baiviets.add(baiviet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return baiviets;
    }
    public ArrayList<baivietModel> readAll() {
        ArrayList<baivietModel> baiviets = new ArrayList<>();
        String query = "SELECT * \n" +
                "FROM baiviet bv\n" +
                "join danhmuc dm on bv.iddanhmuc = dm.iddanhmuc\n" +
                "join taikhoan tk on bv.idtaikhoan = tk.idtaikhoan ORDER BY bv.ngayviet DESC";
        try (Statement statement = cnn.createStatement()) {
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                baivietModel baiviet = extractBaivietFromResultSet(resultSet);
                baiviets.add(baiviet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return baiviets;
    }
    public ArrayList<baivietModel> readAllFE() {
        ArrayList<baivietModel> baiviets = new ArrayList<>();
        String query = "SELECT * \n" +
                "FROM baiviet bv\n" +
                "join danhmuc dm on bv.iddanhmuc = dm.iddanhmuc\n" +
                "join taikhoan tk on bv.idtaikhoan = tk.idtaikhoan AND bv.kiemduyet = 1 ORDER BY bv.ngayviet DESC";
        try (Statement statement = cnn.createStatement()) {
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                baivietModel baiviet = extractBaivietFromResultSet(resultSet);
                baiviets.add(baiviet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return baiviets;
    }
    public boolean update(baivietModel baiviet) {
        String query = "UPDATE baiviet SET iddanhmuc = ?, tieude = ?, noidung = ?, idtaikhoan = ?, " +
                "ngayviet = ?, anh = ?, kiemduyet = ? WHERE idbaiviet = ?";
        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setInt(1, baiviet.getIddanhmuc());
            statement.setString(2, baiviet.getTieude());
            statement.setString(3, baiviet.getNoidung());
            statement.setInt(4, baiviet.getIdtaikhoan());
            statement.setDate(5, baiviet.getNgayviet());
            statement.setString(6, baiviet.getAnh());
            statement.setInt(7, baiviet.getKiemduyet());
            statement.setInt(8, baiviet.getIdbaiviet());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean duyetbai(int id) {
        String query = "UPDATE baiviet SET kiemduyet = 1 WHERE idbaiviet = ?";
        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setInt(1, id);

            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean checkduyetbai(int id) {
        String query = "SELECT * FROM baiviet WHERE idbaiviet = ? AND kiemduyet = 0";
        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next(); // Trả về true nếu có bài viết thỏa mãn điều kiện
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean delete(int id) {
        String query = "DELETE FROM baiviet WHERE idbaiviet = ?";
        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setInt(1, id);

            int rowsDeleted = statement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private baivietModel extractBaivietFromResultSet(ResultSet resultSet) throws SQLException {
        baivietModel baiviet = new baivietModel();
        baiviet.setHoten(resultSet.getString("hoten"));
        baiviet.setTendanhmuc(resultSet.getString("tendanhmuc"));
        baiviet.setIdbaiviet(resultSet.getInt("idbaiviet"));
        baiviet.setIddanhmuc(resultSet.getInt("iddanhmuc"));
        baiviet.setTieude(resultSet.getString("tieude"));
        baiviet.setNoidung(resultSet.getString("noidung"));
        baiviet.setIdtaikhoan(resultSet.getInt("idtaikhoan"));
        baiviet.setNgayviet(resultSet.getDate("ngayviet"));
        baiviet.setAnh(resultSet.getString("anh"));
        baiviet.setKiemduyet(resultSet.getInt("kiemduyet"));
        return baiviet;
    }
}