package bean;

public class GioHangbean {
	private String MaDienThoai;
	private String TenDienThoai;
	private int Gia;
	private int SoLuongMua;
	private int ThanhTien;
	private String Anh;
	public GioHangbean() {
		super();
	}
	public GioHangbean(String maDienThoai, String tenDienThoai, int gia, int soLuongMua, String anh) {
		super();
		MaDienThoai = maDienThoai;
		TenDienThoai = tenDienThoai;
		Gia = gia;
		SoLuongMua = soLuongMua;
		ThanhTien = soLuongMua * gia;
		Anh = anh;
	}
	public String getMaDienThoai() {
		return MaDienThoai;
	}
	public void setMaDienThoai(String maDienThoai) {
		MaDienThoai = maDienThoai;
	}
	public String getTenDienThoai() {
		return TenDienThoai;
	}
	public void setTenDienThoai(String tenDienThoai) {
		TenDienThoai = tenDienThoai;
	}
	public int getGia() {
		return Gia;
	}
	public void setGia(int gia) {
		Gia = gia;
	}
	public int getSoLuongMua() {
		return SoLuongMua;
	}
	public void setSoLuongMua(int soLuongMua) {
		SoLuongMua = soLuongMua;
	}
	public int getThanhTien() {
		return SoLuongMua * Gia;
	}
	public void setThanhTien(int thanhTien) {
		ThanhTien = SoLuongMua * Gia;
	}
	public String getAnh() {
		return Anh;
	}
	public void setAnh(String anh) {
		Anh = anh;
	}
	
	
}
