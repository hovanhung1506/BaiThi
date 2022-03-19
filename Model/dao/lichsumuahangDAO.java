package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bean.hoadonbean;
import bean.lichsumuahangbean;

public class lichsumuahangDAO {

	public ArrayList<hoadonbean> dsHDDAO(String makh) throws Exception {
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
				+ "WHERE KH.MaKhachHang = ?\r\n"
				+ "GROUP BY HD.MaHoaDon, KH.MaKhachHang, HD.NgayMua, HD.DaMua\r\n"
				+ "ORDER BY HD.MaHoaDon DESC";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, makh);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Date date = new Date();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy hh:mm aa");
			String tamdate = rs.getString("NgayMua");
			date = sdf1.parse(tamdate);
			String NgayMua = sdf2.format(date);
			ds.add(new hoadonbean(rs.getString(1), rs.getString(2), NgayMua, rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7)));
		}
		rs.close();
		ps.close();
		dc.cn.close();
		return ds;
	}

	public ArrayList<lichsumuahangbean> dsLSMHDAO(String makh) throws Exception {
		ArrayList<lichsumuahangbean> ds = new ArrayList<lichsumuahangbean>();
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT HD.MaHoaDon, CTHD.MaCTHD, DT.TenDienThoai, DT.MaNSX, CTHD.SoLuong, DT.Gia, DT.Anh, CTHD.DaMua\r\n"
				+ "FROM dbo.HoaDon HD JOIN dbo.ChiTietHoaDon CTHD ON CTHD.MaHoaDon = HD.MaHoaDon\r\n"
				+ "				      JOIN dbo.DienThoai DT ON DT.MaDienThoai = CTHD.MaDienThoai\r\n"
				+ "				      JOIN dbo.KhachHang KH ON KH.MaKhachHang = HD.MaKhachHang\r\n"
				+ "WHERE KH.MaKhachHang = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, makh);
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
}
