package bo;

import java.util.ArrayList;

import bean.hoadonbean;
import bean.lichsumuahangbean;
import dao.quanlyhoadonDAO;

public class quanlyhoadonBO {

	quanlyhoadonDAO dao = new quanlyhoadonDAO();
	
	public ArrayList<hoadonbean> getListHDBO() throws Exception {
		return dao.getListHDDAO();
	}
	
	public ArrayList<lichsumuahangbean> getListLSMHBO() throws Exception {
		return dao.getListLSMHDAO();
	}
	
	public ArrayList<hoadonbean> getHDChuaXNBO() throws Exception {
		return dao.getHDChuaXNDAO();
	}
	
	public ArrayList<lichsumuahangbean> getLSHDChuaXNBO() throws Exception {
		return dao.getLSHDChuaXNDAO();
	}
	
	public void XacNhanHDBO(String mahd) throws Exception {
		dao.XacNhanHDDAO(mahd);
	}
	
	public void XacNhanCTHDBO(String mahd) throws Exception {
		dao.XacNhanCTHDDAO(mahd);
	}
	
	public void XacNhan1CTHDDAO(String macthd) throws Exception {
		dao.XacNhan1CTHDDAO(macthd);
	}
	
	public void XoaHDBO(String mahd) throws Exception {
		dao.XoaHDDAO(mahd);
	}
	
	public void XoaAllCTHDBO(String mahd) throws Exception {
		dao.XoaAllCTHDDAO(mahd);
	}
	
	public void Xoa1CTHDBO(String macthd) throws Exception {
		dao.Xoa1CTHDDAO(macthd);
	}
	
	public void ThemCTHDBO(String mahd, String madt, int soluong) throws Exception {
		dao.ThemCTHDDAO(mahd, madt, soluong);
	}
	
	public int MaCTHDVuaTaoBO() throws Exception {
		return dao.MaCTHDVuaTaoDAO();
	}
	
	public void CapNhatSLCTHDHDBO(String macthd, int soluong) throws Exception {
		dao.CapNhatSLCTHDHDDAO(macthd, soluong);
	}
}
