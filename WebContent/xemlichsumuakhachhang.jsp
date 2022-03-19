<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link rel="stylesheet" href="./style/xemlichsumua.css">
    <title>Chi tiết khách hàng</title>
</head>

<body>
    <nav class="navbar navbar-inverse" style=" position: fixed; left: 0; right: 0; top: 0; z-index: 1">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li><a href="HomeAdmin">Quản lý điện thoại</a></li>
                <li><a href="quanlyloaiAdmin">Quản lý loại</a></li>
                <li class="active"><a href="quanlykhadmin">Quản lý khách hàng</a></li>
                <li><a href="quanlyhoadon">Xác nhận hóa đơn</a></li>
            </ul>
            <form class="navbar-form navbar-left" action="HomeAdmin" method="post">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search" name="search" style="width: 300px;">
                    <div class="input-group-btn">
                        <button class="btn btn-success" type="submit">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </div>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right" style="margin-right: 30px"> 
                <li class="navcha"><span class="taikhoan"><span class="glyphicon glyphicon-user"></span> Xin chào: ${sessionScope.accAdmin.getTen() }</span>
                    <ul class="subnav-taikhoan">
                        <li><a href="#"><i class="bi bi-info-circle-fill"></i> Thông tin tài khoản</a></li>
                        <li><a href="#"><i class="bi bi-shield-shaded"></i> Đăng ký tài khoản admin</a></li>
                        <li><a href="KiemTraAdmin?logout=1"><i class="bi bi-arrow-right-circle-fill"></i> Đăng xuất</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container" style="margin-top: 80px">
        <div class="row">
        <h3 style="margin-bottom: 20px">Mã khách hàng: ${param.makh }</h3>
        	<c:if test="${listHD.size() == 0 }">
        		<span style="font-weight: bold; font-size: 24px; display: block; margin-bottom: 36px">Khách hàng chưa đặt mua bất kỳ mặt hàng nào </span>
        	</c:if>
            <c:if test="${listHD.size() != 0 }">
        		<c:forEach items="${listHD }" var="o">
	            	<div class="accordion-item">
		                <div class="accordion-header" style="background-color: ${o.getDaMua() == 1 ? '#80ed99' : '#e4e4e4'}">
		                    <div style="display: flex;">
		                        <h4 style="margin-right: 36px;">Mã hóa đơn: ${o.getMaHoaDon() }</h4>
		                        <h4 style="margin-right: 36px;">Ngày đặt mua: ${o.getNgayMua() }</h4>
		                    </div>
		                    <i class="arrow fas fa-chevron-down"></i>
		                </div>
		                <div class="accordion-body">
		                    <div class="product-list">
							<c:forEach items="${listLSMH }" var="p">
								<c:if test="${o.getMaHoaDon() == p.getMaHoaDon() }">
									<div class="product-item">
			                            <div class="product-item__img">
			                                <img class="img__item" title="Ảnh" src="${p.getAnh() }">
			                            </div>
			                            <div class="product-item__info">
			                                <div class="invoice-code">
			                                    <div>
			                                        Mã chi tiết hóa đơn:
			                                        <span style="color: #9d4edd; font-weight: 600">${p.getMaCTHD() }</span>
			                                    </div>
			                                    <div>Trạng thái: ${p.getDaMua() == 0 ? 'Chưa thanh toán' : 'Đã thanh toán' }</div>
			                                </div>
			                                <div class="product-item__name">
			                                    <span>${p.getTenDienThoai() }</span>
			                                </div>
			                                <div class="product-item__price">
			                                    <div>Giá: ${p.getGia() }đ x ${p.getSoLuong() }</div>
			                                    <div style="font-size: 16px; font-weight: bold; color: #669bbc">${p.getGia()  * p.getSoLuong()} VNĐ</div>
			                                </div>
			                            </div>
		                        	</div>
								</c:if>
							</c:forEach>
		                    </div>
		                   <div style="position: relative">
		                        <div style="font-weight: bold; font-size:18px" class="TongTien">Tổng cộng:
		                            <span style="color: #780000; font-weight: bold;">${o.getTongTien() } VNĐ</span>
		                        </div>
		                        <div style="font-weight: bold; font-size:18px; position: absolute; top: 0; left: 300px;">Đã thanh toán:
		                            <span style="color: #780000; font-weight: bold;">${o.getDaThanhToan() } VNĐ</span>
		                        </div>
		                        <div style="font-weight: bold; font-size:18px; position: absolute; top: 0; left: 630px;">Còn lại:
		                            <span style="color: #780000; font-weight: bold;">${o.getConLai() } VNĐ</span>
		                        </div>
                    		</div>
		                </div>
	            	</div>
            	</c:forEach>
        	</c:if>
        	<button class="btn btn-primary" onclick="location.href='quanlykhadmin'">Quay lại</button>  
        </div>
    </div>
    
    <script>
        $(document).ready(function() {
            $('.accordion-item').click(function() {
                $(this).toggleClass('active');
                $(this).find('.arrow').toggleClass('rotate');
                $(this).find('.accordion-body').slideToggle();
            });
            $('.btn-XacNhan').each((index, element) => {
                element.onclick = function(e) {
                    e.stopPropagation();
                    alert('Xác nhận thành công');
                    element.innerHTML = 'Đã xác nhận';
                }
            })
        });
    </script>
</body>
</html>