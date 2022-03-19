package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.hoadonbean;
import bean.lichsumuahangbean;

public class quanlyhoadonDAO {

	public ArrayList<hoadonbean> getListHDDAO() throws Exception {
		ArrayList<hoadonbean> ds = new ArrayList<hoadonbean>();
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT HD.MaHoaDon, KH.MaKhachHang, HD.NgayMua, HD.DaMua,\r\n"
				+ "ISNULL(SUM(DT.Gia * CTHD.SoLuong),0) TongTien,\r\n"
				+ "ISNULL(SUM(CASE WHEN CTHD.DaMua = 1 THEN CTHD.SoLuong * DT.Gia ELSE 0 END),0) DaThanhToan,\r\n"
				+ "ISNULL(SUM(DT.Gia * CTHD.SoLuong) - SUM(CASE WHEN CTHD.DaMua = 1 THEN CTHD.SoLuong * DT.Gia ELSE 0 END),0) ConLai\r\n"
				+ "FROM dbo.HoaDon HD LEFT JOIN dbo.ChiTietHoaDon CTHD ON CTHD.MaHoaDon = HD.MaHoaDon\r\n"
				+ "				   LEFT JOIN dbo.KhachHang KH ON KH.MaKhachHang = HD.MaKhachHang\r\n"
				+ "				   LEFT JOIN dbo.DienThoai DT ON DT.MaDienThoai = CTHD.MaDienThoai\r\n"
				+ "GROUP BY HD.MaHoaDon, KH.MaKhachHang, HD.NgayMua, HD.DaMua\r\n"
				+ "ORDER BY HD.MaHoaDon DESC";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Date date = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy hh:mm aa");
			String tamdate = rs.getString(3);
			date = sdf1.parse(tamdate);
			String NgayMua = sdf2.format(date);
			ds.add(new hoadonbean(rs.getString(1), rs.getString(2), NgayMua, rs.getInt(4), rs.getInt(5), rs.getInt(6),
					rs.getInt(7)));
		}
		rs.close();
		ps.close();
		dc.cn.close();
		return ds;
	}

	public ArrayList<lichsumuahangbean> getListLSMHDAO() throws Exception {
		ArrayList<lichsumuahangbean> ds = new ArrayList<lichsumuahangbean>();
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT HD.MaHoaDon, CTHD.MaCTHD, DT.TenDienThoai, DT.MaNSX, CTHD.SoLuong, DT.Gia, DT.Anh, CTHD.DaMua\r\n"
				+ "FROM dbo.HoaDon HD JOIN dbo.ChiTietHoaDon CTHD ON CTHD.MaHoaDon = HD.MaHoaDon\r\n"
				+ "				   JOIN dbo.DienThoai DT ON DT.MaDienThoai = CTHD.MaDienThoai\r\n"
				+ "				   JOIN dbo.KhachHang KH ON KH.MaKhachHang = HD.MaKhachHang";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ds.add(new lichsumuahangbean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
		}
		rs.close();
		ps.close();
		dc.cn.close();
		return ds;
	}

	public ArrayList<hoadonbean> getHDChuaXNDAO() throws Exception {
		ArrayList<hoadonbean> ds = new ArrayList<hoadonbean>();
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT HD.MaHoaDon, KH.MaKhachHang, HD.NgayMua, HD.DaMua,\r\n"
				+ "ISNULL(SUM(DT.Gia * CTHD.SoLuong),0) TongTien,\r\n"
				+ "ISNULL(SUM(CASE WHEN CTHD.DaMua = 1 THEN CTHD.SoLuong * DT.Gia ELSE 0 END),0) DaThanhToan,\r\n"
				+ "ISNULL(SUM(DT.Gia * CTHD.SoLuong) - SUM(CASE WHEN CTHD.DaMua = 1 THEN CTHD.SoLuong * DT.Gia ELSE 0 END),0) ConLai\r\n"
				+ "FROM dbo.HoaDon HD LEFT JOIN dbo.ChiTietHoaDon CTHD ON CTHD.MaHoaDon = HD.MaHoaDon\r\n"
				+ "				   LEFT JOIN dbo.KhachHang KH ON KH.MaKhachHang = HD.MaKhachHang\r\n"
				+ "				   LEFT JOIN dbo.DienThoai DT ON DT.MaDienThoai = CTHD.MaDienThoai\r\n"
				+ "WHERE HD.DaMua = 0\r\n"
				+ "GROUP BY HD.MaHoaDon, KH.MaKhachHang, HD.NgayMua, HD.DaMua\r\n"
				+ "ORDER BY HD.MaHoaDon DESC";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Date date = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy hh:mm aa");
			String tamdate = rs.getString(3);
			date = sdf1.parse(tamdate);
			String NgayMua = sdf2.format(date);
			ds.add(new hoadonbean(rs.getString(1), rs.getString(2), NgayMua, rs.getInt(4), rs.getInt(5), rs.getInt(6),
					rs.getInt(7)));
		}
		rs.close();
		ps.close();
		dc.cn.close();
		return ds;
	}

	public ArrayList<lichsumuahangbean> getLSHDChuaXNDAO() throws Exception {
		ArrayList<lichsumuahangbean> ds = new ArrayList<lichsumuahangbean>();
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT HD.MaHoaDon, CTHD.MaCTHD, DT.TenDienThoai, DT.MaNSX, CTHD.SoLuong, DT.Gia, DT.Anh, CTHD.DaMua\r\n"
				+ "FROM dbo.HoaDon HD JOIN dbo.ChiTietHoaDon CTHD ON CTHD.MaHoaDon = HD.MaHoaDon\r\n"
				+ "				   JOIN dbo.DienThoai DT ON DT.MaDienThoai = CTHD.MaDienThoai\r\n"
				+ "				   JOIN dbo.KhachHang KH ON KH.MaKhachHang = HD.MaKhachHang\r\n"
				+ "WHERE CTHD.DaMua = 0";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ds.add(new lichsumuahangbean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getInt(5), rs.getInt(6), rs.getString(7), rs.getInt(8)));
		}
		return ds;
	}

	public void XacNhanHDDAO(String mahd) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "UPDATE dbo.HoaDon SET DaMua = 1\r\n" + "WHERE MaHoaDon = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, mahd);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}

	public void XacNhanCTHDDAO(String mahd) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "UPDATE dbo.ChiTietHoaDon SET DaMua = 1\r\n" + "WHERE MaHoaDon = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, mahd);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}

	public void XacNhan1CTHDDAO(String macthd) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "UPDATE dbo.ChiTietHoaDon SET DaMua = 1\r\n" + "WHERE MaCTHD = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, macthd);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}
	
	public void XoaHDDAO(String mahd) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "DELETE dbo.HoaDon WHERE MaHoaDon = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, mahd);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}
	
	public void XoaAllCTHDDAO(String mahd) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "DELETE dbo.ChiTietHoaDon WHERE MaHoaDon = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, mahd);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}
	
	public void Xoa1CTHDDAO(String macthd) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "DELETE dbo.ChiTietHoaDon WHERE MaCTHD = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, macthd);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}
	
	public void ThemCTHDDAO(String mahd, String madt, int soluong) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "INSERT dbo.ChiTietHoaDon (MaHoaDon, MaDienThoai, SoLuong, DaMua) VALUES (?, ?, ?, DEFAULT)";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, mahd);
		ps.setString(2, madt);
		ps.setInt(3, soluong);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}
	
	public int MaCTHDVuaTaoDAO() throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT MAX(MaCTHD) MaCTHD\r\n"
				+ "FROM dbo.ChiTietHoaDon";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		return rs.getInt(1);
	}
	
	public void CapNhatSLCTHDHDDAO(String macthd, int soluong) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "UPDATE dbo.ChiTietHoaDon SET SoLuong = ?\r\n"
				+ "WHERE MaCTHD = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setInt(1, soluong);
		ps.setString(2, macthd);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}
}
