package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class GioHangDAO {

	public void ThemHDDAO(String makh) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "INSERT dbo.HoaDon (MaKhachHang, NgayMua, DaMua) VALUES (? , DEFAULT, DEFAULT)";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, makh);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}

	public void ThemCTHDDAO(int mahd, String madt, int soluong) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "INSERT dbo.ChiTietHoaDon (MaHoaDon, MaDienThoai, SoLuong, DaMua) \r\n"
				+ "VALUES (?, ?, ?, DEFAULT)";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setInt(1, mahd);
		ps.setString(2, madt);
		ps.setInt(3, soluong);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}

	public int MaHDVuaTaoDAO() throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT MAX(MaHoaDon) MaHoaDon FROM dbo.HoaDon";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int mahd = rs.getInt(1);
		rs.close();
		ps.close();
		dc.cn.close();
		return mahd;
	}
}
