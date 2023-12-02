package com.example.baitapnhom.Model.Bean;

import java.sql.Date;

public class baivietModel {
    private int idbaiviet;
    private int iddanhmuc;
    private String tieude;
    private String noidung;
    private int idtaikhoan;
    private Date ngayviet;
    private String anh;
    private int kiemduyet;
    private String tendanhmuc;
    private String hoten;

    public String getTendanhmuc() {
        return tendanhmuc;
    }

    public void setTendanhmuc(String tendanhmuc) {
        this.tendanhmuc = tendanhmuc;
    }

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public int getIdbaiviet() {
        return idbaiviet;
    }

    public void setIdbaiviet(int idbaiviet) {
        this.idbaiviet = idbaiviet;
    }

    public int getIddanhmuc() {
        return iddanhmuc;
    }

    public void setIddanhmuc(int iddanhmuc) {
        this.iddanhmuc = iddanhmuc;
    }

    public String getTieude() {
        return tieude;
    }

    public void setTieude(String tieude) {
        this.tieude = tieude;
    }

    public String getNoidung() {
        return noidung;
    }

    public void setNoidung(String noidung) {
        this.noidung = noidung;
    }

    public int getIdtaikhoan() {
        return idtaikhoan;
    }

    public void setIdtaikhoan(int idtaikhoan) {
        this.idtaikhoan = idtaikhoan;
    }

    public Date getNgayviet() {
        return ngayviet;
    }

    public void setNgayviet(Date ngayviet) {
        this.ngayviet = ngayviet;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    public int getKiemduyet() {
        return kiemduyet;
    }

    public void setKiemduyet(int kiemduyet) {
        this.kiemduyet = kiemduyet;
    }
}
