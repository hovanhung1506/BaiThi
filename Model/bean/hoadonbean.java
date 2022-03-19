package bean;

public class hoadonbean {
	private String MaHoaDon;
	private String MaKhachHang;
	private String NgayMua;
	private int DaMua;
	private int TongTien;
	private int DaThanhToan;
	private int ConLai;
	public hoadonbean() {
		super();
	}
	public hoadonbean(String maHoaDon, String maKhachHang, String ngayMua, int daMua, int tongTien, int daThanhToan,
			int conLai) {
		super();
		MaHoaDon = maHoaDon;
		MaKhachHang = maKhachHang;
		NgayMua = ngayMua;
		DaMua = daMua;
		TongTien = tongTien;
		DaThanhToan = daThanhToan;
		ConLai = conLai;
	}
	public String getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(String maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public String getMaKhachHang() {
		return MaKhachHang;
	}
	public void setMaKhachHang(String maKhachHang) {
		MaKhachHang = maKhachHang;
	}
	public String getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(String ngayMua) {
		NgayMua = ngayMua;
	}
	public int getDaMua() {
		return DaMua;
	}
	public void setDaMua(int daMua) {
		DaMua = daMua;
	}
	public int getTongTien() {
		return TongTien;
	}
	public void setTongTien(int tongTien) {
		TongTien = tongTien;
	}
	public int getDaThanhToan() {
		return DaThanhToan;
	}
	public void setDaThanhToan(int daThanhToan) {
		DaThanhToan = daThanhToan;
	}
	public int getConLai() {
		return ConLai;
	}
	public void setConLai(int conLai) {
		ConLai = conLai;
	}
	
	
}
