package bean;

public class KhachHangbean {
	private String MaKhachHang;
	private String TenKhachHang;
	private String SoDienThoai;
	private String DiaChi;
	private String Email;
	private String TenDangNhap;
	private String MatKhau;
	public KhachHangbean() {
		super();
	}
	public KhachHangbean(String maKhachHang, String tenKhachHang, String soDienThoai, String diaChi, String email,
			String tenDangNhap, String matKhau) {
		super();
		MaKhachHang = maKhachHang;
		TenKhachHang = tenKhachHang;
		SoDienThoai = soDienThoai;
		DiaChi = diaChi;
		Email = email;
		TenDangNhap = tenDangNhap;
		MatKhau = matKhau;
	}
	public String getMaKhachHang() {
		return MaKhachHang;
	}
	public void setMaKhachHang(String maKhachHang) {
		MaKhachHang = maKhachHang;
	}
	public String getTenKhachHang() {
		return TenKhachHang;
	}
	public void setTenKhachHang(String tenKhachHang) {
		TenKhachHang = tenKhachHang;
	}
	public String getSoDienThoai() {
		return SoDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		SoDienThoai = soDienThoai;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getTenDangNhap() {
		return TenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		TenDangNhap = tenDangNhap;
	}
	public String getMatKhau() {
		return MatKhau;
	}
	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}
	
	
}
