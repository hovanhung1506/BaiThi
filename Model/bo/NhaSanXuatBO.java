package bo;

import java.util.ArrayList;

import bean.NhaSanXuatbean;
import dao.NhaSanXuatDAO;

public class NhaSanXuatBO {
	
	NhaSanXuatDAO dao = new NhaSanXuatDAO();
	
	public ArrayList<NhaSanXuatbean> getAllNSX() throws Exception {
		return dao.getAllNSXDAO();
	}
	
	public boolean KiemTraMaNSXBO(String mansx) throws Exception {
		return dao.KiemTraMaNSXDAO(mansx);
	}
	
	public void ThemNSXBO(String mansx, String tennsx) throws Exception {
		dao.ThemNSXDAO(mansx, tennsx);
	}
	
	public void SuaNSXBO(String mansx, String tennsx) throws Exception {
		dao.SuaNSXDAO(mansx, tennsx);
	}
	
	public void XoaNSX(String mansx) throws Exception {
		dao.XoaNSX(mansx);
	}
}
