package bean;

public class DienThoaibean {
	private String MaDienThoai;
	private String TenDienThoai;
	private int Gia;
	private String MaNSX;
	private String Anh;
	private int SoLuong;
	public DienThoaibean() {
		super();
	}
	public DienThoaibean(String maDienThoai, String tenDienThoai, int gia, String maNSX, String anh, int soLuong) {
		super();
		this.MaDienThoai = maDienThoai;
		this.TenDienThoai = tenDienThoai;
		this.Gia = gia;
		this.MaNSX = maNSX;
		this.Anh = anh;
		this.SoLuong = soLuong;
	}
	public String getMaDienThoai() {
		return MaDienThoai;
	}
	public void setMaDienThoai(String maDienThoai) {
		this.MaDienThoai = maDienThoai;
	}
	public String getTenDienThoai() {
		return TenDienThoai;
	}
	public void setTenDienThoai(String tenDienThoai) {
		this.TenDienThoai = tenDienThoai;
	}
	public int getGia() {
		return Gia;
	}
	public void setGia(int gia) {
		this.Gia = gia;
	}
	public String getMaNSX() {
		return MaNSX;
	}
	public void setMaNSX(String maNSX) {
		this.MaNSX = maNSX;
	}
	public String getAnh() {
		return Anh;
	}
	public void setAnh(String anh) {
		this.Anh = anh;
	}
	public int getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(int soLuong) {
		this.SoLuong = soLuong;
	}
	
	
	
}
