package bo;

import java.util.ArrayList;

import bean.hoadonbean;
import bean.lichsumuahangbean;
import dao.lichsumuahangDAO;

public class lichsumuahangBO {
	
	lichsumuahangDAO dao = new lichsumuahangDAO();
	
	public ArrayList<hoadonbean> dsHDBO(String makh) throws Exception{
		return dao.dsHDDAO(makh);
	}
	
	public ArrayList<lichsumuahangbean> dsLSMHBO(String makh) throws Exception {
		return dao.dsLSMHDAO(makh);
	}
}
