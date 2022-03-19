package bo;

import java.util.ArrayList;

import bean.DienThoaibean;
import dao.DienThoaiDAO;

public class DienThoaiBO {
	DienThoaiDAO dao = new DienThoaiDAO();

	public ArrayList<DienThoaibean> getAllDienThoaiBO() throws Exception {
		return dao.getAllDienThoaiDAO();
	}

	public ArrayList<DienThoaibean> getByNSXBO(String mansx) throws Exception {
		return dao.getByNSXDAO(mansx);
	}
	
	public ArrayList<DienThoaibean> SearchBO(String key) throws Exception {
		return dao.SearchDAO(key);
	}
	
	public DienThoaibean getByMaDienThoaiBO(String madienthoai) throws Exception{
		return dao.getByMaDienThoaiDAO(madienthoai);
	}
	
	public ArrayList<DienThoaibean> get10DienThoaiBO() throws Exception{
		return dao.get10DienThoaiDAO();
	}
	
	public ArrayList<DienThoaibean> getNext5DAO(int amount) throws Exception{
		return dao.getNext5DAO(amount);
	}
}
