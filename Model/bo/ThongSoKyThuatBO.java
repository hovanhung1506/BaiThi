package bo;

import java.util.ArrayList;

import bean.ThongSoKyThuatbean;
import dao.ThongSoKyThuatDAO;

public class ThongSoKyThuatBO {
	ThongSoKyThuatDAO dao = new ThongSoKyThuatDAO();

	public ThongSoKyThuatbean getByMaDienThoaiDAO(String madienthoai) throws Exception {
		return dao.getByMaDienThoaiDAO(madienthoai);
	}
	
	public ArrayList<ThongSoKyThuatbean> getAllTSKTBO() throws Exception {
		return dao.getAllTSKTDAO();
	}
	
	public void ThemTSKTBO(String madt, String ktmh, String cnmh, String camsau, String camtruoc, String chipset,
			String ram, String rom, String pin, String thesim, String hedieuhanh, String dpgmh, String loaicpu,
			String kichthuoc) throws Exception {
		dao.ThemTSKTDAO(madt, ktmh, cnmh, camsau, camtruoc, chipset, ram, rom, pin, thesim, hedieuhanh, dpgmh, loaicpu, kichthuoc);
	}
	
	public void SuaTSKTBO(String madt, String ktmh, String cnmh, String camsau, String camtruoc, String chipset,
			String ram, String rom, String pin, String thesim, String hdh, String dpgmh, String loaicpu, String kt) throws Exception {
		dao.SuaTSKTDAO(madt, ktmh, cnmh, camsau, camtruoc, chipset, ram, rom, pin, thesim, hdh, dpgmh, loaicpu, kt);
	}
}
