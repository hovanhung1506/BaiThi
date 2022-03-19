package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.ThongSoKyThuatbean;

public class ThongSoKyThuatDAO {

	public ThongSoKyThuatbean getByMaDienThoaiDAO(String madienthoai) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT * FROM dbo.ThongSoKyThuat\r\n" + "WHERE MaDienThoai = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, madienthoai);
		ResultSet rs = ps.executeQuery();
		rs.next();
		return new ThongSoKyThuatbean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
				rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
				rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));
	}

	public ArrayList<ThongSoKyThuatbean> getAllTSKTDAO() throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		ArrayList<ThongSoKyThuatbean> ds = new ArrayList<ThongSoKyThuatbean>();
		String sql = "SELECT * FROM dbo.ThongSoKyThuat";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ds.add(new ThongSoKyThuatbean(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
					rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
					rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14)));
		}
		rs.close();
		ps.close();
		dc.cn.close();
		return ds;
	}

	public void ThemTSKTDAO(String madt, String ktmh, String cnmh, String camsau, String camtruoc, String chipset,
			String ram, String rom, String pin, String thesim, String hedieuhanh, String dpgmh, String loaicpu,
			String kichthuoc) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "INSERT dbo.ThongSoKyThuat (MaDienThoai, KichThuocManHinh, CongNgheManHinh, CameraSau, CameraTruoc, Chipset,\r\n"
				+ "                                DungLuongRAM, BoNhoTrong, Pin, TheSim, HeDieuHanh, DoPhanGiaiManHinh, LoaiCPU,\r\n"
				+ "                                KichThuoc)\r\n"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, madt);
		ps.setString(2, ktmh);
		ps.setString(3, cnmh);
		ps.setString(4, camsau);
		ps.setString(5, camtruoc);
		ps.setString(6, chipset);
		ps.setString(7, ram);
		ps.setString(8, rom);
		ps.setString(9, pin);
		ps.setString(10, thesim);
		ps.setString(11, hedieuhanh);
		ps.setString(12, dpgmh);
		ps.setString(13, loaicpu);
		ps.setString(14, kichthuoc);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}

	public void SuaTSKTDAO(String madt, String ktmh, String cnmh, String camsau, String camtruoc, String chipset,
			String ram, String rom, String pin, String thesim, String hdh, String dpgmh, String loaicpu, String kt) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "UPDATE dbo.ThongSoKyThuat SET KichThuocManHinh = ?, CongNgheManHinh = ?, CameraSau = ?, CameraTruoc = ?, "
				+ "Chipset = ?, DungLuongRAM = ?, BoNhoTrong = ?, Pin = ?, TheSim = ?, HeDieuHanh = ?, DoPhanGiaiManHinh = ?, "
				+ "LoaiCPU = ?, KichThuoc = ?\r\n"
				+ "WHERE MaDienThoai = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, ktmh);
		ps.setString(2, cnmh);
		ps.setString(3, camsau);
		ps.setString(4, camtruoc);
		ps.setString(5, chipset);
		ps.setString(6, ram);
		ps.setString(7, rom);
		ps.setString(8, pin);
		ps.setString(9, thesim);
		ps.setString(10, hdh);
		ps.setString(11, dpgmh);
		ps.setString(12, loaicpu);
		ps.setString(13, kt);
		ps.setString(14, madt);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}
}
