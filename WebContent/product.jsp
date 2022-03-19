<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${dienthoai.getTenDienThoai() }</title>
<link rel="shortcut icon" href="./assets/img/logo-cps.png"
	type="image/x-icon">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
<link rel="stylesheet" href="./style/product.css">
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="row">
				<h1 class="product-name">${dienthoai.getTenDienThoai() }</h1>
			</div>
		</div>
		<div class="row" style="padding-top: 20px;">

			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
				<div class="product-img">
					<img src="${dienthoai.getAnh() }" alt="">
				</div>
			</div>

			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
				<p class="tragop">Trả góp 0%</p>
				<p class="price">${dienthoai.getGia() }₫</p>
				<div class="box-promotion">
					<div class="tieude">
						<p>
							<i class='bx bx-gift'></i>Khuyễn mãi
						</p>
					</div>
					<div class="item-promotion">
						<div class="item-promotion-first">
							<p>1</p>
							<p>Giảm 1 triệu khi thanh toán qua ví Moca, thẻ tín dụng
								BIDV, Standard Charter (số lượng có hạn) (xem chi tiết)</p>
						</div>
						<div class="item-promotion-first">
							<p>2</p>
							<p>Thu cũ lên đời - Trợ giá 1 triệu (xem chi tiết)</p>
						</div>
						<div class="list-store">
							<i class="fas fa-fire"></i> <span>DANH SÁCH CỬA HÀNG ĐÃ CÓ
								HÀNG TRẢI NGHIỆM</span>
						</div>
					</div>
				</div>
				<button class="btn-datmua"
					onclick="themhang('${dienthoai.getMaDienThoai()}', '${dienthoai.getTenDienThoai()}', '${dienthoai.getGia() }', '${dienthoai.getAnh() }')">
					<p>ĐẶT MUA</p>
					<p>(Giao tận nơi hoặc lấy tại cửa hàng)</p>
				</button>

				<div class="btn-tragop">
					<button>
						<p>TRẢ GÓP 0%</p>
						<p>(Xét duyệt qua điện thoại)</p>
					</button>
					<button>
						<p>TRẢ GÓP QUA THẺ</p>
						<p>(Visa, Master Card, JCB)</p>
					</button>
				</div>

				<div class="box-promotion-more">
					<p class="title">ƯU ĐIỂM THÊM</p>
					<div class="box-promotion-more-body">
						<div class="box-promotion-more-item">
							<p>
								<i class='bx bxs-check-circle'></i>
							</p>
							<p>
								<a href="">Giảm thêm tới 1% cho thành viên Smember</a>
							</p>
						</div>
						<div class="box-promotion-more-item">
							<p>
								<i class='bx bxs-check-circle'></i>
							</p>
							<p>
								<a href="">Giảm 5% tối đa 500k khi thanh toán bằng ví Moca
									trên ứng dụng Grab (áp dụng đơn hàng từ 500k)</a>
							</p>
						</div>
						<div class="box-promotion-more-item">
							<p>
								<i class='bx bxs-check-circle'></i>
							</p>
							<p>
								<a href="">Giảm 500.000đ khi thanh toán hoặc trả góp từ 5
									triệu trở lên bằng thẻ tín dụng FE Credit</a>
							</p>
						</div>
					</div>
				</div>
			</div>

			<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
				<div class="technical-info">
					<div class="technical-info-title">Thông số kỹ thuật</div>
					<div class="technical-info-body">
						<div class="technical-info-body-item bgc-f2f2f2">
							<p>Kích thước màn hình</p>
							<p>${thongso.getKichThuocManHinh() }</p>
						</div>
						<div class="technical-info-body-item">
							<p>Công nghệ màn hình</p>
							<p>${thongso.getCongNgheManHinh() }</p>
						</div>
						<div class="technical-info-body-item bgc-f2f2f2">
							<p>Camera sau</p>
							<p>${thongso.getCameraSau() }</p>
						</div>
						<div class="technical-info-body-item">
							<p>Camera trước</p>
							<p>${thongso.getCameraTruoc() }</p>
						</div>
						<div class="technical-info-body-item bgc-f2f2f2">
							<p>Chipset</p>
							<p>${thongso.getChipset() }</p>
						</div>
						<div class="technical-info-body-item">
							<p>Dung lượng RAM</p>
							<p>${thongso.getDungLuongRAM() }</p>
						</div>
						<div class="technical-info-body-item bgc-f2f2f2">
							<p>Bộ nhớ trong</p>
							<p>${thongso.getBoNhoTrong() }</p>
						</div>
						<div class="technical-info-body-item">
							<p>Pin</p>
							<p>${thongso.getPin() }</p>
						</div>
						<div class="technical-info-body-item bgc-f2f2f2">
							<p>Thẻ SIM</p>
							<p>${thongso.getTheSim() }</p>
						</div>
						<div class="technical-info-body-item">
							<p>Hệ điều hành</p>
							<p>${thongso.getHeDieuHanh() }</p>
						</div>
						<div class="technical-info-body-item bgc-f2f2f2">
							<p>Độ phân giải màn hình</p>
							<p>${thongso.getDoPhanGiaiManHinh() }</p>
						</div>
						<div class="technical-info-body-item">
							<p>Loại CPU</p>
							<p>${thongso.getLoaiCPU() }</p>
						</div>
						<div class="technical-info-body-item bgc-f2f2f2">
							<p>Kích thước</p>
							<p>${thongso.getKichThuoc() }</p>
						</div>
					</div>
					<button class="btn-show-more-cau-hinh">
						Xem cấu hình chi tiết <i class="fas fa-chevron-down"></i>
					</button>
				</div>
			</div>

		</div>
	</div>

	<div class="modal-technical-info">

		<div class="modal-technical-info-container">
			<div class="modal-technical-info-title">
				Thông số kỹ thuật <i class="far fa-times icon-close"></i>
			</div>
			<div class="modal-technical-info-body">

				<div class="item-box">
					<p class="item-box-title">Màn hình</p>
					<div class="item-box-body">
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Kích thước màn hình</p>
							<p>${thongso.getKichThuocManHinh() }</p>
						</div>
						<div class="modal-technical-info-body-item">
							<p>Công nghệ màn hình</p>
							<p>${thongso.getCongNgheManHinh() }</p>
						</div>
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Độ phân giải màn hình</p>
							<p>${thongso.getDoPhanGiaiManHinh() }</p>
						</div>
						<div class="modal-technical-info-body-item">
							<p>Tính năng màn hình</p>
							<p>120Hz, Super Retina XDR với ProMotion 6.1‑inch, OLED, 458
								pp, HDR display, True Tone, Wide color (P3), Haptic Touch</p>
						</div>
					</div>
				</div>

				<div class="item-box">
					<p class="item-box-title">Camera sau</p>
					<div class="item-box-body">
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Camera sau</p>
							<p>${thongso.getCameraSau() }</p>
						</div>
						<div class="modal-technical-info-body-item">
							<p>Quay video</p>
							<p>
								4K @24 fps/25 fps/30 fps/ 60 fps<br> 1080p HD @25 fps/30
								fps/60 fps<br> 720p HD@ 30 fps
							</p>
						</div>
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Tính năng camera</p>
							<p>
								Chạm lấy nét<br>HDR<br>Nhận diện khuôn mặt<br>Quay
								chậm (Slow Motion)<br>Toàn cảnh (Panorama)<br>Tự động
								lấy nét (AF)<br>Xóa phông<br>Nhãn dán (AR Stickers)<br>Nhận
								diện khuôn mặt
							</p>
						</div>
					</div>
				</div>

				<div class="item-box">
					<p class="item-box-title">Camera trước</p>
					<div class="item-box-body">
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Camera trước</p>
							<p>${thongso.getCameraTruoc() }</p>
						</div>
						<div class="modal-technical-info-body-item">
							<p>Quay video trước</p>
							<p>1080p@30fps</p>
						</div>
					</div>
				</div>

				<div class="item-box">
					<p class="item-box-title">Vi xử lý & đồ họa</p>
					<div class="item-box-body">
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Chipset</p>
							<p>${thongso.getChipset() }</p>
						</div>
						<div class="modal-technical-info-body-item">
							<p>Loại CPU</p>
							<p>${thongso.getLoaiCPU() }</p>
						</div>
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>GPU</p>
							<p>GPU 5 nhân</p>
						</div>
					</div>
				</div>

				<div class="item-box">
					<p class="item-box-title">RAM & lưu trữ</p>
					<div class="item-box-body">
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Dung lượng RAM</p>
							<p>${thongso.getDungLuongRAM() }</p>
						</div>
						<div class="modal-technical-info-body-item">
							<p>Bộ nhớ trong</p>
							<p>${thongso.getBoNhoTrong() }</p>
						</div>
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Khe cắm thẻ nhớ</p>
							<p>MicroSD 512GB</p>
						</div>
					</div>
				</div>

				<div class="item-box">
					<p class="item-box-title">Pin & công nghệ sạc</p>
					<div class="item-box-body">
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Pin</p>
							<p>${thongso.getPin() }</p>
						</div>
						<div class="modal-technical-info-body-item">
							<p>Công nghệ sạc</p>
							<p>Sạc nhanh 20W, Sạc không dây, Sạc ngược không dây 15W, Sạc
								pin nhanh, Tiết kiệm pin</p>
						</div>
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Cổng sạc</p>
							<p>Lightning</p>
						</div>
					</div>
				</div>

				<div class="item-box">
					<p class="item-box-title">Giao tiếp & kết nối</p>
					<div class="item-box-body">
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Thẻ SIM</p>
							<p>${thongso.getTheSim() }</p>
						</div>
						<div class="modal-technical-info-body-item">
							<p>Hệ điều hành</p>
							<p>${thongso.getHeDieuHanh() }</p>
						</div>
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Jack tai nghe 3.5</p>
							<p>Không</p>
						</div>
						<div class="modal-technical-info-body-item">
							<p>Công nghệ NFC</p>
							<p>Có</p>
						</div>
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Hỗ trợ mạng</p>
							<p>5G</p>
						</div>
						<div class="modal-technical-info-body-item">
							<p>Wi-Fi</p>
							<p>WiFi 6E</p>
						</div>
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Bluetooth</p>
							<p>v5.0</p>
						</div>
						<div class="modal-technical-info-body-item">
							<p>GPS</p>
							<p>GPS, GLONASS, Galileo, QZSS, and BeiDou</p>
						</div>
					</div>
				</div>

				<div class="item-box">
					<p class="item-box-title">Thiết kế & Trọng lượng</p>
					<div class="item-box-body">
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Kích thước</p>
							<p>${thongso.getKichThuoc() }</p>
						</div>
						<div class="modal-technical-info-body-item">
							<p>Trọng lượng</p>
							<p>240g</p>
						</div>
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Chất liệu mặt lưng</p>
							<p>Kính</p>
						</div>
						<div class="modal-technical-info-body-item">
							<p>Chất liệu khung viền</p>
							<p>Nhựa</p>
						</div>
					</div>
				</div>

				<div class="item-box">
					<p class="item-box-title">Thông số khác</p>
					<div class="item-box-body">
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Chỉ số kháng nước, bụi</p>
							<p>IP68</p>
						</div>
						<div class="modal-technical-info-body-item">
							<p>Kiểu màn hình</p>
							<p>Tai thỏ</p>
						</div>
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Các loại cảm biến</p>
							<p>Cảm biến ánh sáng, Cảm biến áp kế, Cảm biến gia tốc, Cảm
								biến tiệm cận, Con quay hồi chuyển</p>
						</div>
						<div class="modal-technical-info-body-item">
							<p>Tính năng đặc biệt</p>
							<p>Hỗ trợ 5G, Kháng nước, kháng bụi, Sạc không dây, Nhận diện
								khuôn mặt</p>
						</div>
						<div class="modal-technical-info-body-item bgc-f2f2f2">
							<p>Cảm biết vân tay</p>
							<p>Không</p>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

	<script src="./JS/product.js"></script>
	<script type="text/javascript">
		function themhang(madt, tendt, gia, anh) {
			$.ajax({
                url: '/BaiThi/themgiohang',
                type: 'POST',
                data: {
                    madt,
                    tendt,
                    gia,
                    anh
                },
                success: function (data) {
                    var row = document.querySelector('.quantity')
                    row.innerHTML = data;
                },
                error: function () {
                    alert("error");
                }
            });
		}
	</script>
</body>

</html>