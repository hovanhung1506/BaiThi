package bean;

public class lichsumuahangbean {
	private String MaHoaDon;
	private String MaCTHD;
	private String TenDienThoai;
	private String MaNSX;
	private int SoLuong;
	private int Gia;
	private String Anh;
	private int DaMua;
	public lichsumuahangbean() {
		super();
	}
	public lichsumuahangbean(String maHoaDon, String maCTHD, String tenDienThoai, String maNSX, int soLuong, int gia,
			String anh, int daMua) {
		super();
		MaHoaDon = maHoaDon;
		MaCTHD = maCTHD;
		TenDienThoai = tenDienThoai;
		MaNSX = maNSX;
		SoLuong = soLuong;
		Gia = gia;
		Anh = anh;
		DaMua = daMua;
	}
	public String getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(String maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public String getMaCTHD() {
		return MaCTHD;
	}
	public void setMaCTHD(String maCTHD) {
		MaCTHD = maCTHD;
	}
	public String getTenDienThoai() {
		return TenDienThoai;
	}
	public void setTenDienThoai(String tenDienThoai) {
		TenDienThoai = tenDienThoai;
	}
	public String getMaNSX() {
		return MaNSX;
	}
	public void setMaNSX(String maNSX) {
		MaNSX = maNSX;
	}
	public int getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}
	public int getGia() {
		return Gia;
	}
	public void setGia(int gia) {
		Gia = gia;
	}
	public String getAnh() {
		return Anh;
	}
	public void setAnh(String anh) {
		Anh = anh;
	}
	public int getDaMua() {
		return DaMua;
	}
	public void setDaMua(int daMua) {
		DaMua = daMua;
	}
	
}
