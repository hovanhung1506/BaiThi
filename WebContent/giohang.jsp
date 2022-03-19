<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CellphoneS - Hệ thống bán lẻ điện thoại</title>
    <link rel="shortcut icon" href="./assets/img/logo-cps.png" type="image/x-icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="./style/giohang.css">
</head>

<body>
    
    <c:if test="${sessionScope.datmua != null && sessionScope.datmua == '1' }">
		<script type="text/javascript"> alert("Đặt mua thành công")</script>
		<c:remove var="datmua" scope="session"/>
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
                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 banner">
                    <c:if test="${listGioHang != null }">
                    	<c:if test="${soluong != 0 }">
                    		<div class="row">
	                        	<label class="checkboxall"><input type="checkbox" style=" margin: 12px; " onchange="checkAll(this)">
	                            <span style=" position: relative; top: -2px; ">Chọn tất cả</span></label>
                    		</div>
                    	</c:if>

	                    <c:forEach items="${listGioHang }" var="o">
		                    	<div class="row product-item">
		                        <input type="checkbox" style=" margin: auto 12px; " name="select-ck">
		                        <div class="product-item__img">
		                            <img class="img__item" title="${o.getTenDienThoai() }" src="${o.getAnh() }">
		                        </div>
		                        <div class="product-item__info">
		                            <div class="product-item__name">
		                                <span>${o.getTenDienThoai() }</span>
		                            </div>
		                            <div class="product-item__price">
		                                <span>Giá: ${o.getGia() }đ x </span>
		                                <input type="number" min="1" name="sl" style="width: 80px; margin-right: 8px" value="${o.getSoLuongMua() }">
		                                <span><button class="btn btn-primary" onclick="updateQuantity(this, '${o.getMaDienThoai()}')">Cập nhật</button> |
		                                    <button class="btn btn-success" onclick="trahang(this, '${o.getMaDienThoai()}')">Trả lại</button></span>
		                            </div>
		                        </div>
	                    	</div>
	                    </c:forEach>
                    </c:if>
                    
	                    <div class="row">
	                        <span style="font-weight: bold; font-size: 24px; margin-bottom: 36px display: ${soluong == 0 ? 'block' : 'none' }" class="giohangtrong">Giỏ hàng trống </span>
	                        <h2 style="font-weight: bold; font-size: 24px; border-bottom: 1px solid #ccc;" class="TongTien">Tổng cộng: ${tongtien } VNĐ</h2>
	                    </div>
	
	                    <div class="row">
	                        <div style="margin: 0 0 100px 300px">
	                            <input type="button" value="Trả lại hàng " class="btn btn-default btn-trahang">
	                            <input type="button" value="Tiếp tục mua hàng " onclick="location.href='home'" class="btn btn-default">
	                            <input type="button" value="Xác nhận đặt mua" class="btn btn-primary btn-xndm" name="xndm">
	                        </div>
	                    </div>
                    
                </div>
            </div>
            
        </div>
    </div>
	<jsp:include page="footer.jsp"></jsp:include>
    <div id="backtop">
        <i class="fas fa-chevron-up"></i>
    </div>
	<script type="text/javascript">
	var checkboxall = document.querySelectorAll("input[type = 'checkbox']")
	var btn_trahang = document.querySelector('.btn-trahang')
	var checkboxes = document.getElementsByName('select-ck')
	var btn_xndm = document.querySelector('.btn-xndm')
	var kt_checkall = false;
	if (checkboxall.length === 0) {
		btn_trahang.disabled = true;
		btn_xndm.disabled = true;
	}

	function checkAll(myCheckbox) {
		if (myCheckbox.checked == true) {
			kt_checkall = true;
			checkboxall.forEach(checkbox => {
				checkbox.checked = true
			})
		} else {
			checkboxall.forEach(checkbox => {
				kt_checkall = false
				checkbox.checked = false
			})
		}
	}



	btn_trahang.onclick = (() => {
		if (kt_checkall == true) {
			for (let i = 0; i < checkboxes.length; i++) {
				if (checkboxes[i].checked == true) {
					checkboxes[i].parentElement.remove()
					i--;
				}
			}
			$.ajax({
				url: '/BaiThi/xulygiohang',
				type: 'POST',
				data: {
					dstra: index,
					act: 'clear'
				},
				success: function(data) {
					let tt = document.querySelector('.TongTien')
					tt.innerHTML = "Tổng cộng: 0 VNĐ";
					let soluong = document.querySelector('.quantity')
					soluong.innerHTML = 0
					$('.checkboxall').css('display', 'none')
					$('.giohangtrong').css('display', 'block')
					btn_trahang.disabled = true;
					btn_xndm.disabled = true;
				},
			});
			return
		}
		var index = '', kt = false
		checkboxes.forEach((ck, i) => {
			if (ck.checked == true) {
				index += i + ';'
				kt = true
			}
		})
		if (kt == true) {
			for (let i = 0; i < checkboxes.length; i++) {
				if (checkboxes[i].checked == true) {
					checkboxes[i].parentElement.remove()
					i--;
				}
			}
			$.ajax({
				url: '/BaiThi/xulygiohang',
				type: 'POST',
				data: {
					dstra: index,
					act: 'remove'
				},
				success: function(data) {
					let tt = document.querySelector('.TongTien')
					let txts = data.split(';')
					tt.innerHTML = txts[0];
					let soluong = document.querySelector('.quantity')
					soluong.innerHTML = txts[1]
					if (txts[1] == '0') {
						$('.checkboxall').css('display', 'none')
						$('.giohangtrong').css('display', 'block')
						btn_trahang.disabled = true;
						btn_xndm.disabled = true;
					}
				},
			});
		}
		if (kt == false) {
			alert('Chọn hàng để trả')
		}
	})

	function updateQuantity(btn, madt) {
		var soluong = btn.parentElement.parentElement.querySelector('input[type="number"]').value
		$.ajax({
			url: '/BaiThi/xulygiohang',
			type: 'POST',
			data: {
				madt,
				soluong,
				act: 'update'
			},
			success: function(data) {
				let row = btn.parentElement.parentElement.querySelector('input[type="number"]')
				row.setAttribute('value', soluong);
				let tt = document.querySelector('.TongTien')
				tt.innerHTML = data;
			},
		});
	}

	function trahang(btn, madt) {
		$.ajax({
			url: '/BaiThi/xulygiohang',
			type: 'POST',
			data: {
				madt,
				act: "delete"
			},
			success: function(data) {
				let row = document.querySelector('.giohang')
				let tt = document.querySelector('.TongTien')
				let txts = data.split(';')
				tt.innerHTML = txts[0];
				let soluong = document.querySelector('.quantity')
				soluong.innerHTML = txts[1]
				let parent = btn.parentElement.parentElement.parentElement.parentElement
				parent.remove()
				if (txts[1] == '0') {
					$('.checkboxall').css('display', 'none')
					$('.giohangtrong').css('display', 'block')
					btn_trahang.disabled = true;
					btn_xndm.disabled = true;
				}
			},
		});
	}

	</script>
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
        
    	btn_xndm.onclick = (() => {
    		var ktdn = '<%= session.getAttribute("acc")%>'
    		if (ktdn == 'null') {
    			$('#myModal').modal('show')
    		} else {
    			window.location.href = 'xndm'
    		}
    	})
    </script>
</body>

</html>