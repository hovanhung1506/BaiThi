<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CellphoneS - Hệ thống bán lẻ điện thoại</title>
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
<link rel="stylesheet" href="./style/home-style.css">
</head>

<body>
	<c:if test="${sessionScope.kt == '0' }">
		<script type="text/javascript">alert('Sai tài khoản hoặc mật khẩu')</script>
		<c:remove var="kt" scope="session" />
	</c:if>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="row">
				<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
					<div class="category">
						<c:forEach items="${listNSX }" var="o">
							<a href="home?product=${o.getMaNSX() }"><div>${o.getTenNSX() }</div></a>
						</c:forEach>
					</div>
				</div>
				<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 banner">
					<div class="slider">
						<i class="fa fa-angle-left slider-prev"></i>
						<ul class="slider-dots">
							<li class="slider-dot-item active" data-index="0"></li>
							<li class="slider-dot-item" data-index="1"></li>
							<li class="slider-dot-item" data-index="2"></li>
							<li class="slider-dot-item" data-index="3"></li>
							<li class="slider-dot-item" data-index="4"></li>
						</ul>
						<div class="slider-wrapper">
							<div class="slider-main">
								<div class="slider-item">
									<img src="./assets/img/AIRPODS-2-690-300-max.png" alt="" />
								</div>
								<div class="slider-item">
									<img src="./assets/img/f3-fl3-690-300-max.png" alt="" />
								</div>
								<div class="slider-item">
									<img src="./assets/img/mlkk-vsmart-690x300_11_.png" alt="" />
								</div>
								<div class="slider-item">
									<img src="./assets/img/msi-690x300_17_.png" alt="" />
								</div>
								<div class="slider-item">
									<img src="./assets/img/slide_690x300_ip13-512.png" alt="" />
								</div>
							</div>
						</div>
						<i class="fa fa-angle-right slider-next"></i>
					</div>
				</div>
				<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 item-banner">
					<img src="./assets/img/690x300__p_d_n_RightBanner_Desktop.png"
						alt=""> <img
						src="./assets/img/690x300_Laptop_RightBanner_Desktop.png" alt="">
					<img src="./assets/img/right-banner_640x278.png" alt="">
				</div>
			</div>

			<c:if test="${listDienThoai.size() == 0 }">
				<div class="row">
					<p
						style="display: flex; align-items: center; justify-content: center; flex: 1; font-size: 70px;">Không
						tìm thấy kết quả</p>
				</div>
				<script type="text/javascript">
	            		$(document).ready(function() {
	            			$('.load-more').css('display', 'none')
						})
	            	</script>
			</c:if>

			<div class="row list-product">

				<c:if test="${listDienThoai.size() != 0 }">
					<c:forEach items="${listDienThoai }" var="o">
						<div class="col item">
							<div class="thumbnail product-item">
								<a href="product?id=${o.getMaDienThoai() }"> <img
									src="${o.getAnh() }" style="height: 160px" alt="">
									<div class="caption">
										<p class="title-item">${o.getTenDienThoai() }</p>
										<p class="author-item">Hãng: ${o.getMaNSX() }</p>
										<p class="price-item">Giá: ${o.getGia() } ₫</p>
									</div>
								</a>
								<button class="btn btn-primary" role="button"
									onclick="ThemHang('${o.getMaDienThoai()}', '${o.getTenDienThoai() }', '${o.getGia() }', '${o.getAnh() }')">Thêm
									vào giỏ hàng</button>
								<span>Giảm 10%</span>
							</div>
						</div>
					</c:forEach>
				</c:if>

			</div>

			<c:if test="${search == null && loaidt != '1'}">
				<div class="load-more">
					<button class="btn btn-primary" onclick="loadmore()" role="button">Xem
						thêm</button>
				</div>
			</c:if>
		</div>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>
	<div id="backtop">
		<i class="fas fa-chevron-up"></i>
	</div>

	<script>
        $(document).ready(function () {
            $('#backtop').css('display', 'none');
            $(window).scroll(function () {
                if ($(this).scrollTop() > 100) {
                    $('#backtop').fadeIn();
                } else {
                    $('#backtop').fadeOut();
                }
            });
            $('#backtop').click(function () {
                $("html, body").animate({
                    scrollTop: 0
                }, 500);
                return false;
            });
            
        });
        
        function ThemHang(madt, tendt, gia, anh) {
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
        
        function loadmore() {
			let amount = document.querySelectorAll('.item').length
        	$.ajax({
                url: '/BaiThi/loadmoredienthoai',
                type: 'POST',
                data: {
                	amount
                },
                success: function (data) {
                	let row = document.querySelector('.list-product')
                    row.innerHTML += data
                },
                error: function () {
                    alert("error");
                }
            });
			
        	$.ajax({
                url: '/BaiThi/kiemtrasoluongsp',
                type: 'POST',
                success: function (data) {
                	let amount = document.querySelectorAll('.item').length
                    if(data <= amount){
                    	$('.load-more').css('display', 'none')
                    }
                },
                error: function () {
                    alert("error");
                }
            });
        	
        function TimKiem(param) {
			let value = param.value
			console.log(value)
		}
	}
    </script>
	<script src="./JS/slide.js"></script>
</body>

</html>