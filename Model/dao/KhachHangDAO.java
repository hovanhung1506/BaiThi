package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.KhachHangbean;

public class KhachHangDAO {

	public KhachHangbean getAccDAO(String tendn, String matkhau) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT * FROM dbo.KhachHang WHERE TenDangNhap = ? AND MatKhau = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, tendn);
		ps.setString(2, matkhau);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return new KhachHangbean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getString(5), rs.getString(6), rs.getString(7));
		}
		return null;
	}

	public void themKhachHangDAO(String tenkh, String sodt, String diachi, String email, String tendn, String matkhau)
			throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "INSERT dbo.KhachHang (TenKhachHang, SoDienThoai, DiaChi, Email, TenDangNhap, MatKhau)\r\n"
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, tenkh);
		ps.setString(2, sodt);
		ps.setString(3, diachi);
		ps.setString(4, email);
		ps.setString(5, tendn);
		ps.setString(6, matkhau);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}

	public int kiemTraThongTinDAO(String sodt, String email, String tendn) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql1 = "SELECT * FROM dbo.KhachHang WHERE TenDangNhap = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql1);
		ps.setString(1, tendn);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			rs.close();
			ps.close();
			dc.cn.close();
			return 1;
		}
		String sql2 = "SELECT * FROM dbo.KhachHang WHERE Email = ?";
		ps = dc.cn.prepareStatement(sql2);
		ps.setString(1, email);
		rs = ps.executeQuery();
		if (rs.next()) {
			rs.close();
			ps.close();
			dc.cn.close();
			return 2;
		}
		String sql3 = "SELECT * FROM dbo.KhachHang WHERE SoDienThoai = ?";
		ps = dc.cn.prepareStatement(sql3);
		ps.setString(1, sodt);
		rs = ps.executeQuery();
		if (rs.next()) {
			rs.close();
			ps.close();
			dc.cn.close();
			return 3;
		}
		return 0;
	}

	public ArrayList<KhachHangbean> getAllKHDAO() throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		ArrayList<KhachHangbean> ds = new ArrayList<KhachHangbean>();
		String sql = "SELECT * FROM dbo.KhachHang";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ds.add(new KhachHangbean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getString(5), rs.getString(6), rs.getString(7)));
		}
		rs.close();
		ps.close();
		dc.cn.close();
		return ds;
	}

	public void SuaKhachHangDAO(String makh, String tenkh, String sdt, String diachi, String email, String matkhau)
			throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "UPDATE dbo.KhachHang SET TenKhachHang = ?, SoDienThoai = ?, DiaChi = ?, Email = ?, MatKhau = ?\r\n"
				+ "WHERE MaKhachHang = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, tenkh);
		ps.setString(2, sdt);
		ps.setString(3, diachi);
		ps.setString(4, email);
		ps.setString(5, matkhau);
		ps.setString(6, makh);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}
}
