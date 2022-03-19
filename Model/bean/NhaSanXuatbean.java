package bean;

public class NhaSanXuatbean {
	private String MaNSX;
	private String TenNSX;
	public NhaSanXuatbean() {
		super();
	}
	public NhaSanXuatbean(String maNSX, String tenNSX) {
		super();
		this.MaNSX = maNSX;
		this.TenNSX = tenNSX;
	}
	public String getMaNSX() {
		return MaNSX;
	}
	public void setMaNSX(String maNSX) {
		this.MaNSX = maNSX;
	}
	public String getTenNSX() {
		return TenNSX;
	}
	public void setTenNSX(String tenNSX) {
		this.TenNSX = tenNSX;
	}
	
	
}
