package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.NhaSanXuatbean;

public class NhaSanXuatDAO {

	public ArrayList<NhaSanXuatbean> getAllNSXDAO() throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		ArrayList<NhaSanXuatbean> ds = new ArrayList<NhaSanXuatbean>();
		String sql = "SELECT * FROM dbo.NhaSanXuat";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ds.add(new NhaSanXuatbean(rs.getString(1), rs.getString(2)));
		}
		rs.close();
		ps.close();
		dc.cn.close();
		return ds;
	}

	public boolean KiemTraMaNSXDAO(String mansx) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT MaNSX FROM dbo.NhaSanXuat WHERE MaNSX = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, mansx);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return true;
		}
		return false;
	}

	public void ThemNSXDAO(String mansx, String tennsx) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "INSERT dbo.NhaSanXuat (MaNSX, TenNSX) VALUES (?, ?)";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, mansx);
		ps.setString(2, tennsx);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}

	public void SuaNSXDAO(String mansx, String tennsx) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "UPDATE dbo.NhaSanXuat SET TenNSX = ? WHERE MaNSX = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, tennsx);
		ps.setString(2, mansx);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}

	public void XoaNSX(String mansx) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "DELETE dbo.NhaSanXuat WHERE MaNSX = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, mansx);
		ps.executeUpdate();
		ps.close();
		dc.cn.close();
	}

}
