<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
        <div class="roww">
            <div class="logo">
                <div class="logo__menu-bar">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
                <a href="home" title="Hệ thống bán lẻ điện thoại">
                    <img src="./assets/img/logo.png" alt="" class="logo__img">
                </a>
            </div>

            <div class="location">
                <div class="location-icon">
                    <i class="fal fa-map-marker-alt"></i>
                </div>
                <div class="location-text">
                    <p>Xem giá tại</p>
                    <p>Hồ Chí Minh</p>
                </div>
            </div>

            <div class="search">
                <div class="search-icon" onclick="nhanTim()" style="cursor: pointer;">
                    <i class="fas fa-search"></i>
                </div>
                <div class="search-text">
                    <form action="home" method="post" id="form">
                        <input type="text" value="${search }" placeholder="Tìm kiếm sản phẩm, thương hiệu" name="search" required oninput="TimKiem(this)">
                    </form>
                </div>
            </div>

            <div class="about about-contact">
                <div class="about-icon">
                    <i class='bx bxs-phone'></i>
                </div>
                <div class="about-text">
                    <p>Liên hệ</p>
                    <p>098.765.4321</p>
                </div>
            </div>

            <div class="about about-cart" onclick="location.href = 'giohang'">
                <div class="about-icon">
                    <i class="fal fa-shopping-bag"></i>
                </div>
                <div class="about-text">
                    <p>Giỏ</p>
                    <p>hàng</p>
                </div>
				<span class="quantity">${soluong }</span>
            </div>

            <div class="about about-delivery-tracking" onclick="location.href = 'lichsumuahang'">
                <div class="about-icon">
                    <i class="fal fa-truck-container"></i>
                </div>
                <div class="about-text">
                    <p>Tra cứu</p>
                    <p>đơn hàng</p>
                </div>
            </div>

            <div class="about about-user" ${sessionScope.acc == null ? 'onclick="location.href = \'dangkytaikhoan\'"' : "" }>
                <div><i class="far fa-user-circle"></i></div>
                <c:choose>
                	<c:when test="${sessionScope.acc != null }">
                		<div>${sessionScope.acc.getTenKhachHang() }</div>
                	</c:when>
                	<c:otherwise>
                		<div>Smember</div>
                	</c:otherwise>
                </c:choose>
            </div>

            <c:if test="${sessionScope.acc != null }">
            	<a href="dangnhankh?logout=1">
            		<div class="about about-logout">
		                <div><i class="fal fa-sign-out"></i></div>
		                <div>Đăng xuất</div>
            		</div>
            	</a>
            </c:if>
            
            <c:if test="${sessionScope.acc == null }">
            	<a  data-toggle="modal" data-target="#myModal">
	            	<div class="about about-login">
		                <div><i class="fal fa-sign-in"></i></div>
		                <div>Đăng nhập</div>
	            	</div>
           		</a>
            </c:if>
        </div>
    </header>
    
    <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog modal-sm">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                <h4 class="modal-title">Đăng nhập hệ thống</h4>
	            </div>
	            <div class="modal-body">
	                <form method="post" action="dangnhankh">
	                    <label> Tên đăng nhập: </label>
	                    <input name="txtun" type="text" class="form-control" required>
	                    <label style="margin-top: 12px;"> Mật khẩu: </label>
	                    <input name="txtpass" type="password" class="form-control" required><br>
	                    <input name="but1" type="submit" value="Đăng nhập" class="btn-primary" style=" padding: 4px 0; border-radius: 4px; width: 100%;">
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
	
	<c:if test="${timkiemajax == '1' }">
		<script type="text/javascript">
		 function TimKiem(param) {
				let search = param.value
				if(search === ''){
					$.ajax({
		                url: '/BaiThi/searchByAjax',
		                type: 'POST',
		                data: {
		                	search
		                },
		                success: function (data) {
		                	let row = document.querySelector('.list-product')
		                	row.innerHTML = data
		                	$('.load-more').css('display', 'block')
		                	
		                },
		                error: function () {
		                    alert("error");
		                }
		            });
				}else{
					$.ajax({
		                url: '/BaiThi/searchByAjax',
		                type: 'POST',
		                data: {
		                	search
		                },
		                success: function (data) {
		                	let row = document.querySelector('.list-product')
		                	row.innerHTML = data
		                	$('.load-more').css('display', 'none')
		                	
		                },
		                error: function () {
		                    alert("error");
		                }
		            });
				}
			}
		</script>
	</c:if>
	<script type="text/javascript">
		function nhanTim() {
			const form = document.getElementById("form");
			form.submit()
		}	
	</script>