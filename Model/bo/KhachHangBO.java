package bo;

import java.util.ArrayList;

import bean.KhachHangbean;
import dao.KhachHangDAO;

public class KhachHangBO {
	KhachHangDAO dao = new KhachHangDAO();
	
	public KhachHangbean getAccBO(String tendn, String matkhau) throws Exception {
		return dao.getAccDAO(tendn, matkhau);
	}
	
	public boolean kiemTraTrungMatKhauBO(String pass1, String pass2) {
		if(pass1.equals(pass2)) {
			return false;
		}
		return true;
	}
	
	public void themKhachHangBO(String tenkh, String sodt, String diachi, String email, String tendn, String matkhau)
			throws Exception{
		dao.themKhachHangDAO(tenkh, sodt, diachi, email, tendn, matkhau);
	}
	
	public int kiemTraThongTinBO(String sodt, String email, String tendn) throws Exception{
		return dao.kiemTraThongTinDAO(sodt, email, tendn);
	}
	
	public ArrayList<KhachHangbean> getAllKHBO() throws Exception{
		return dao.getAllKHDAO();
	}
	
	public void SuaKhachHangBO(String makh, String tenkh, String sdt, String diachi, String email, String matkhau)
			throws Exception {
		dao.SuaKhachHangDAO(makh, tenkh, sdt, diachi, email, matkhau);
	}
}
