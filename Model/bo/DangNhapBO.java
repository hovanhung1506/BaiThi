package bo;

import bean.DangNhapbean;
import dao.DangNhapDAO;

public class DangNhapBO {
	
	DangNhapDAO dao = new DangNhapDAO();
	
	public DangNhapbean getTaiKhoanAdminBO(String tendn, String pass) throws Exception{
		return dao.getTaiKhoanAdminDAO(tendn, pass);
	}
	
	public void TaoTaiKhoanAdminBO(String tendn, String matkhau, String ten, int quyen) throws Exception {
		dao.TaoTaiKhoanAdminDAO(tendn, matkhau, ten, quyen);
	}
	
	public int KiemTraTrungTenDNBO(String tendn) throws Exception {
		return dao.KiemTraTrungTenDNDAO(tendn);
	}
	
}
