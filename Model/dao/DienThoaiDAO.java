package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.DienThoaibean;

public class DienThoaiDAO {

	public ArrayList<DienThoaibean> getAllDienThoaiDAO() throws Exception {
		ArrayList<DienThoaibean> ds = new ArrayList<DienThoaibean>();
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT * FROM dbo.DienThoai";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ds.add(new DienThoaibean(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
					rs.getInt(6)));
		}
		rs.close();
		ps.close();
		rs.close();
		return ds;
	}

	public ArrayList<DienThoaibean> getByNSXDAO(String mansx) throws Exception {
		ArrayList<DienThoaibean> ds = new ArrayList<DienThoaibean>();
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT DT.*\r\n" + "FROM dbo.DienThoai DT JOIN dbo.NhaSanXuat NSX ON NSX.MaNSX = DT.MaNSX\r\n"
				+ "WHERE NSX.MaNSX = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, mansx);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ds.add(new DienThoaibean(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
					rs.getInt(6)));
		}
		rs.close();
		ps.close();
		rs.close();
		return ds;
	}

	public ArrayList<DienThoaibean> SearchDAO(String key) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		ArrayList<DienThoaibean> ds = new ArrayList<DienThoaibean>();
		String sql = "SELECT * FROM dbo.DienThoai\r\n" + "WHERE TenDienThoai LIKE ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, "%" + key + "%");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ds.add(new DienThoaibean(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
					rs.getInt(6)));
		}
		rs.close();
		ps.close();
		dc.cn.close();
		return ds;
	}

	public DienThoaibean getByMaDienThoaiDAO(String madienthoai) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT * FROM dbo.DienThoai\r\n" + "WHERE MaDienThoai = ?";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setString(1, madienthoai);
		ResultSet rs = ps.executeQuery();
		rs.next();
		return new DienThoaibean(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
				rs.getInt(6));

	}

	public ArrayList<DienThoaibean> get10DienThoaiDAO() throws Exception {
		ArrayList<DienThoaibean> ds = new ArrayList<DienThoaibean>();
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT * FROM dbo.DienThoai\r\n" + "ORDER BY MaDienThoai\r\n"
				+ "OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ds.add(new DienThoaibean(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
					rs.getInt(6)));
		}
		rs.close();
		ps.close();
		rs.close();
		return ds;
	}

	public ArrayList<DienThoaibean> getNext5DAO(int amount) throws Exception {
		ArrayList<DienThoaibean> ds = new ArrayList<DienThoaibean>();
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "SELECT * FROM dbo.DienThoai\r\n" + "ORDER BY MaDienThoai\r\n"
				+ "OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";
		PreparedStatement ps = dc.cn.prepareStatement(sql);
		ps.setInt(1, amount);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ds.add(new DienThoaibean(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5),
					rs.getInt(6)));
		}
		rs.close();
		ps.close();
		rs.close();
		return ds;
	}
}
