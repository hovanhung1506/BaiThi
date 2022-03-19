package bo;

import dao.admin_dienthoaiDAO;

public class admin_dienthoaiBO {
	admin_dienthoaiDAO dao = new admin_dienthoaiDAO();
	
	public void ThemDienThoaiBO(String madt, String tendt, int gia, String mansx, String anh, int soluong)
			throws Exception{
		dao.ThemDienThoaiDAO(madt, tendt, gia, mansx, anh, soluong);
	}
	
	public boolean KiemTraMaDTBO(String madt) throws Exception {
		return dao.KiemTraMaDTDAO(madt);
	}
	
	public String XoaAnhBO(String madt) throws Exception {
		return dao.XoaAnhDAO(madt);
	}
	
	public void SuaDienThoaiFullBO(String madt, String tendt, int gia, String mansx, String anh, int soluong)
			throws Exception {
		dao.SuaDienThoaiFullDAO(madt, tendt, gia, mansx, anh, soluong);
	}
	
	public void SuaDienThoaiBO(String madt, String tendt, int gia, String mansx, int soluong) throws Exception {
		dao.SuaDienThoaiDAO(madt, tendt, gia, mansx, soluong);
	}
	
	public void XoaDienThoai(String madt) throws Exception {
		dao.XoaDienThoai(madt);
	}
}
