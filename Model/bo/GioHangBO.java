package bo;

import java.util.ArrayList;

import bean.GioHangbean;
import dao.GioHangDAO;

public class GioHangBO {
	public ArrayList<GioHangbean> ds = new ArrayList<GioHangbean>();
	GioHangDAO dao = new GioHangDAO();
	
	public void Them(String maDienThoai, String tenDienThoai, int gia, int soLuongMua, String anh) {
		for(GioHangbean g : ds) {
			if(g.getMaDienThoai().equals(maDienThoai)) {
				g.setSoLuongMua(g.getSoLuongMua() + soLuongMua);
				return;
			}
		}
		ds.add(new GioHangbean(maDienThoai, tenDienThoai, gia, soLuongMua, anh));
	}
	
	public void Xoa1Hang(String maDienThoai) {
		for(GioHangbean g : ds) {
			if(g.getMaDienThoai().equals(maDienThoai)) {
				ds.remove(g);
				break;
			}
		}
	}
	
	public void XoaTatCa() {
		ds.removeAll(ds);
	}
	
	public int TongTien() {
		int s = 0;
		for(GioHangbean g : ds) {
			s += g.getThanhTien();
		}
		return s;
	}
	
	public void CapNhatSoLuongMua(String maDienThoai, int SoLuong) {
		for(GioHangbean g : ds) {
			if(g.getMaDienThoai().equals(maDienThoai)) {
				g.setSoLuongMua(SoLuong);
				break;
			}
		}
	}
	
	public void ThemHDBO(String makh) throws Exception{
		dao.ThemHDDAO(makh);
	}
	
	public void ThemCTHDBO(ArrayList<GioHangbean>dss, int mahd) throws Exception{
		for(GioHangbean o : dss) {
			dao.ThemCTHDDAO(mahd, o.getMaDienThoai(), o.getSoLuongMua());
		}
	}
	
	public int MaHDVuaTao() throws Exception{
		return dao.MaHDVuaTaoDAO();
	}
}
