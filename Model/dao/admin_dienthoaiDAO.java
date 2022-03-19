package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class admin_dienthoaiDAO {

	public void ThemDienThoaiDAO(String madt, String tendt, int gia, String mansx, String anh, int soluong)
			throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "INSERT dbo.DienThoai (MaDienThoai, TenDienThoai, Gia, MaNSX, Anh, SoLuong)\r\n"
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, madt);
		ps.setString(2, tendt);
		ps.setInt(3, gia);
		ps.setString(4, mansx);
		ps.setString(5, anh);
		ps.setInt(6, soluong);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}

	public boolean KiemTraMaDTDAO(String madt) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT * FROM dbo.DienThoai WHERE MaDienThoai = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, madt);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			rs.close();
			ps.close();
			dc.cn.close();
			return true;
		}
		rs.close();
		ps.close();
		dc.cn.close();
		return false;
	}

	public String XoaAnhDAO(String madt) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT Anh FROM dbo.DienThoai WHERE MaDienThoai = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, madt);
		ResultSet rs = ps.executeQuery();
		rs.next();
		return rs.getString(1);
	}

	public void SuaDienThoaiFullDAO(String madt, String tendt, int gia, String mansx, String anh, int soluong)
			throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "UPDATE dbo.DienThoai SET TenDienThoai = ?, Gia = ?, MaNSX = ?, Anh = ?, SoLuong = ?\r\n"
				+ "WHERE MaDienThoai = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, tendt);
		ps.setInt(2, gia);
		ps.setString(3, mansx);
		ps.setString(4, anh);
		ps.setInt(5, soluong);
		ps.setString(6, madt);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}

	public void SuaDienThoaiDAO(String madt, String tendt, int gia, String mansx, int soluong) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "UPDATE dbo.DienThoai SET TenDienThoai = ?, Gia = ?, MaNSX = ?, SoLuong = ?\r\n"
				+ "WHERE MaDienThoai = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, tendt);
		ps.setInt(2, gia);
		ps.setString(3, mansx);
		ps.setInt(4, soluong);
		ps.setString(5, madt);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}
	
	public void XoaDienThoai(String madt) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "DELETE FROM dbo.DienThoai WHERE MaDienThoai = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, madt);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}
}
