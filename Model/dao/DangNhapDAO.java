package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.DangNhapbean;

public class DangNhapDAO {

	public DangNhapbean getTaiKhoanAdminDAO(String tendn, String pass) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT * FROM dbo.DangNhap WHERE TenDangNhap = ? AND MatKhau = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, tendn);
		ps.setString(2, pass);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			return new DangNhapbean(rs.getString(1), rs.getString(2), rs.getString(3),rs.getInt(4));
		}
		return null;
	}
	
	public void TaoTaiKhoanAdminDAO(String tendn, String matkhau, String ten, int quyen) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "INSERT dbo.DangNhap (TenDangNhap, Ten, MatKhau, Quyen) VALUES (?, ?, ?, ?)";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, tendn);
		ps.setString(2, matkhau);
		ps.setString(3, ten);
		ps.setInt(4, quyen);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}
	
	public int KiemTraTrungTenDNDAO(String tendn) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT * FROM dbo.DangNhap WHERE TenDangNhap = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, tendn);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			rs.close();
			ps.close();
			dc.cn.close();
			return 1;
		}
		return 0;
	}
}
