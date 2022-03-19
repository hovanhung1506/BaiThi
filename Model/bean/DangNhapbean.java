package bean;

public class DangNhapbean {
	private String TenDangNhap;
	private String Ten;
	private String MatKhau;
	private int Quuyen;
	public DangNhapbean() {
		super();
	}
	
	
	public DangNhapbean(String tenDangNhap, String ten, String matKhau, int quuyen) {
		super();
		TenDangNhap = tenDangNhap;
		Ten = ten;
		MatKhau = matKhau;
		Quuyen = quuyen;
	}


	public String getTenDangNhap() {
		return TenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		TenDangNhap = tenDangNhap;
	}
	public String getTen() {
		return Ten;
	}
	public void setTen(String ten) {
		Ten = ten;
	}
	public String getMatKhau() {
		return MatKhau;
	}
	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}
	public int getQuuyen() {
		return Quuyen;
	}
	public void setQuuyen(int quuyen) {
		Quuyen = quuyen;
	}
	
	
	
}
