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
    <link rel="stylesheet" href="./style/quanlyhoadon.css">
    <title>Quản lý hóa đơn</title>
</head>

<body>
    <nav class="navbar navbar-inverse" style=" position: fixed; left: 0; right: 0; top: 0; z-index: 1">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li><a href="HomeAdmin">Quản lý điện thoại</a></li>
                <li><a href="quanlyloaiAdmin">Quản lý loại</a></li>
                <li><a href="quanlykhadmin">Quản lý khách hàng</a></li>
                <li class="active"><a href="quanlyhoadon">Xác nhận hóa đơn</a></li>
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
            <div class="tabs">
                <ul class="nav-tabs">
                    <li class="active"><a href="#menu_1">Danh sách hóa đơn</a></li>

                </ul>
                <div class="tabs-content">
                    <div id="menu_1" class="tab-content-item" style="width: 1064px;">
                        <br>
                        <c:forEach items="${listHD }" var="o">
                        	<div class="accordion-item">
	                            <div class="accordion-header" style="background-color: ${o.getDaMua() == 1 ? '#80ed99' : '#e4e4e4'}">
	                                <div style="display: flex;">
	                                    <h4 style="margin-right: 36px;">Mã hóa đơn: <span class="mahd">${o.getMaHoaDon() }</span></h4>
	                                    <h4 style="margin-right: 36px;">Ngày đặt mua: <span>${o.getNgayMua() }</span></h4>
	                                    <h4 style="margin-right: 36px;">Mã khách hàng: <span>${o.getMaKhachHang() }</span></h4>
	                                </div>
	                                <i class="arrow fas fa-chevron-down"></i>
	                                <c:if test="${o.getDaMua() == 0 }">
	                                	<div class="NutBamHD">
		                                    <button class="btn btn-primary themhangmoi">
		                                        <i class="fas fa-plus-circle"></i>
		                                    </button>
		                                    <button class="btn btn-danger xoahoadon">
		                                        <i class="fas fa-trash-alt"></i>
		                                    </button>
		                                </div>
	                                </c:if>
	                            </div>
	                            <div class="accordion-body">
	                                <div class="product-list">
	                                    <c:forEach items="${listLSHD }" var="p">
	                                    	<c:if test="${o.getMaHoaDon() == p.getMaHoaDon() }">
	                                    		<div class="product-item">
			                                        <div class="product-item__img">
			                                            <img class="img__item" title="Ảnh" src="${p.getAnh() }">
			                                        </div>
			                                        <div class="product-item__info">
			                                            <div class="invoice-code">
			                                                <div>
			                                                    Mã chi tiết hóa đơn:
			                                                    <span style="color: #9d4edd; font-weight: 600" class="macthd">${p.getMaCTHD() }</span>
			                                                </div>
			                                                <div>Trạng thái: <span class="trangthaicthd">${p.getDaMua() == 0 ? 'Chưa thanh toán' : 'Đã thanh toán' }</span></div>
			                                            </div>
			                                            <div class="product-item__name">
			                                                <span>${p.getTenDienThoai() }</span>
			                                            </div>
			                                            <div class="product-item__price">
			                                                <div>Giá: ${p.getGia() }đ x
			                                                    <span>
			                                                        <input type="number" value="${p.getSoLuong() }" min="1" name="soluonghang">
			                                                        <c:if test="${p.getDaMua() == 0 }">
			                                                        	<!-- <button class="capnhatsl">Cập nhật</button> -->
			                                                        </c:if>
			                                                    </span>
			                                                </div>
			                                                <div style="font-size: 16px; font-weight: bold; color: #669bbc">
			                                                    <span class="tiencthd">${p.getSoLuong() * p.getGia() }</span> VNĐ
			                                                </div>
			                                            </div>
			                                        </div>
			                                        <c:if test="${p.getDaMua() == 0	 }">
			                                        	<div class="CacNutBam">
				                                            <div class="nutBam">
				                                                <button class="btn btn-success xacnhancthd">
				                                                    <i class="fas fa-check"></i>
				                                                </button>
				                                            </div>
				                                            <div class="nutBam">
				                                                <button class="btn btn-danger xoacthd">
				                                                    <i class="fas fa-trash-alt"></i>
				                                                </button>
				                                            </div>
				                                        </div>
			                                        </c:if>
			                                    </div>
	                                    	</c:if>
	                                    </c:forEach>
	                                    
	                                </div>
	                                <div style="position: relative">
	                                    <div style="font-weight: bold; font-size:18px" class="TongTien">Tổng cộng:
	                                        <span style="color: #780000; font-weight: bold;"><span class="tongtien">${o.getTongTien() }</span> VNĐ</span>
	                                    </div>
	                                    <div style="font-weight: bold; font-size:18px; position: absolute; top: 0; left: 300px;">Đã thanh toán:
	                                        <span style="color: #780000; font-weight: bold;"><span class="datt">${o.getDaThanhToan() }</span> VNĐ</span>
	                                    </div>
	                                    <div style="font-weight: bold; font-size:18px; position: absolute; top: 0; left: 630px;">Còn lại:
	                                        <span style="color: #780000; font-weight: bold;"><span class="conlai">${o.getConLai() }</span> VNĐ</span>
	                                    </div>

                                    	<div class="xacnhanall" style="display: ${o.getDaMua() == 0 && o.getTongTien() != 0 ? 'block' : 'none'}">
	                                        <button class="btn btn-success" onclick="xacnhanhd(this,${o.getMaHoaDon()})">Xác nhận tất cả</button>
	                                    </div>

	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal_themhang">
        <div class="modal_themhang_container">
            <div class="modal_themhang_header">
                <h3 class="modal_title">Thêm mới cho hóa đơn: <span class="mahdthem"></span></h3>
                <i class="fal fa-times modal_close"></i>
            </div>
            <div class="modal_body">
                <div><input type="text" name="search" placeholder="Search..." oninput="timkiem(this)"></div>
                <div class="list_Product">
                    <div class="row" style="display: flex; flex-wrap: wrap;">
                        
                        <c:forEach items="${listDT }" var="o">
                        	<div class="col3 item">
	                            <img src="${o.getAnh() }" alt="" class="img_product">
	                            <div class="info_item">
	                                <p class="product__name">${o.getTenDienThoai() }</p>
	                                <p class="product__price">Giá: <span class="gia">${o.getGia() }</span>đ</p>
	                                <p class="product__soluongcon">Còn: ${o.getSoLuong() }</p>
	                                <input type="number" name="slsp" min="1" placeholder="nhập số lượng" style="margin-bottom: 4px;" value="1">
	                                <button class="btn btn-primary" onclick="themHang(this,'${o.getMaDienThoai()}')">Thêm</button>
	                            </div>
	                        </div>
                        </c:forEach>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
    $(document).ready(function () {
    	  $('.accordion-item').click(function () {
    	    $(this).toggleClass('active');
    	    $(this).find('.arrow').toggleClass('rotate');
    	    $(this).find('.accordion-body').slideToggle();
    	  });
    	  $('.btn-XacNhan').each((index, element) => {
    	    element.onclick = function (e) {
    	      e.stopPropagation();
    	      alert('Xác nhận thành công');
    	      element.innerHTML = 'Đã thanh toán';
    	    };
    	  });

    	  $('.tab-content-item').hide();
    	  $('.tab-content-item:first-child').fadeIn();
    	  $('.nav-tabs li').click(function () {
    	    $('.nav-tabs li').removeClass('active');
    	    $(this).addClass('active');
    	    let id_tab_content = $(this).children('a').attr('href');
    	    $('.tab-content-item').hide();
    	    $(id_tab_content).fadeIn();
    	    return false;
    	  });

    	  $('.product-list').click(function (e) {
    	    e.stopPropagation();
    	  });

    	  $('.NutBamHD').click(function (e) {
    	    e.stopPropagation();
    	  });
    	  
    	  $('.accordion-body').click(function (e){
    		  e.stopPropagation();
    	  });

    	  $('.themhangmoi').each((index, element) => {
    	    element.onclick = function (e) {
    	      let mahd = element.parentElement.parentElement.querySelector('.mahd').innerHTML;
    	      $('.mahdthem')[0].innerHTML = mahd;
    	      $('.modal_themhang').addClass('open_modal');
    	    };
    	  });

    	  $('.xoahoadon').each((index, element) => {
    	    element.onclick = function (e) {
    	      let mahd = element.parentElement.parentElement.querySelector('.mahd').innerHTML;
    	      alert('Xóa hóa đơn ' + mahd + ' thành công');
    	      element.parentElement.parentElement.parentElement.remove();
    	      $.ajax({
              	url: '/BaiThi/xoahoadon',
              	type: 'POST',
              	data: {
              		mahd
              	},
              	success: function (data) {
              		
              	},
              	error: function () {
              		alert("error");
              	}
              });
    	    };
    	  });

    	  $('.xacnhancthd').each((index, element) => {
    	    element.onclick = function (e) {
    	      element.parentElement.parentElement.parentElement.querySelector('.product-item__info').querySelector('.trangthaicthd').innerHTML = 'Đã thanh toán';
    	      let macthd = element.parentElement.parentElement.parentElement.querySelector('.macthd').innerHTML;
    	      let mahd = element.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.mahd').innerHTML

    	      let tiencthd = parseInt(element.parentElement.parentElement.parentElement.querySelector('.tiencthd').innerHTML);
    	      let datt = parseInt(element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.datt').innerHTML);
    	      let conlai = parseInt(element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.conlai').innerHTML);
    	      datt += tiencthd;
    	      conlai -= tiencthd;
    	      element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.datt').innerHTML = datt;
    	      element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.conlai').innerHTML = conlai;

    	      let trangthai = element.parentElement.parentElement.parentElement.parentElement.querySelectorAll('.trangthaicthd');
    	      let dem = 0, hd = '0';
    	      trangthai.forEach((v, i) => {
    	        if (v.innerHTML == 'Đã thanh toán') {
    	          dem++;
    	        }
    	      });
    	      if (dem == trangthai.length) {
    	        element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.xacnhanall').style.display = 'none'
    	        let header = element.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.accordion-header')
        		header.style.backgroundColor = '#80ed99';
    	        element.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.NutBamHD').remove()
    	        hd = '1'
    	      }
       	      $.ajax({
                	url: '/BaiThi/xacnhancthd',
                	type: 'POST',
                	data: {
                		macthd,
                		hd,
                		mahd
                	},
                	success: function (data) {
                		alert('Xác nhận thành công');
                	},
                	error: function () {
                		alert("error");
                	}
                });
    	      /* element.parentElement.parentElement.parentElement.querySelector('.capnhatsl').remove(); */
    	      element.parentElement.parentElement.remove();
    	    };
    	  });

/*     	  $('.capnhatsl').each((index, element) => {
    	    element.onclick = function (e) {
    	      let sl = element.parentElement.querySelector('input[name="soluonghang"]').value;
    	      alert(`Cập nhật số lượng thành công ${sl}`);
    	      element.parentElement.querySelector('input[name="soluonghang"]').setAttribute('value', sl);
    	      let tiencthd = parseInt(element.parentElement.parentElement.parentElement.querySelector('.tiencthd').innerHTML);
    	      let soluonghang = element.parentElement.querySelector('input[name="soluonghang"]').value;
    	      element.parentElement.parentElement.parentElement.querySelector('.tiencthd').innerHTML = soluonghang * tiencthd;
    	      let macthd = element.parentElement.parentElement.parentElement.parentElement.querySelector('.macthd').innerHTML
    	      $.ajax({
	              	url: '/BaiThi/capnhasl',
	              	type: 'POST',
	              	data: {
	              		macthd,
	              		sl
	              	},
	              	success: function (data) {
	              		alert('Xóa thành công');
	              	},
	              	error: function () {
	              		alert("error");
	              	}
            });
    	    };
    	  }); */

    	  $('.xoacthd').each((index, element) => {
    	    element.onclick = function (e) {
    	      let macthd = element.parentElement.parentElement.parentElement.querySelector('.macthd').innerHTML;
    	      let tiencthd = parseInt(element.parentElement.parentElement.parentElement.querySelector('.tiencthd').innerHTML);
    	      let conlai = parseInt(element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.conlai').innerHTML);
    	      element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.conlai').innerHTML = conlai - tiencthd;
    	      
    	      if (conlai - tiencthd == 0) {
    	    	  element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.tongtien').innerHTML = '0'
    	    	  element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.xacnhanall').style.display = 'none';
    	      }
    	      element.parentElement.parentElement.parentElement.remove();
    	      $.ajax({
	              	url: '/BaiThi/xoacthd',
	              	type: 'POST',
	              	data: {
	              		macthd
	              	},
	              	success: function (data) {
	              		alert('Xóa thành công');
	              	},
	              	error: function () {
	              		alert("error");
	              	}
              });
    	    };
    	  });

    	  document.querySelector('.modal_close').onclick = function () {
    	    $('.modal_themhang').removeClass('open_modal');
    	  };

    	  $('.modal_themhang').click(function () {
    	    $('.modal_themhang').removeClass('open_modal');
    	  });

    	  $('.modal_themhang_container').click(function (e) {
    	    e.stopPropagation();
    	  });

    	});

    	  function xacnhanhd(btn, mahd){    		  
     		  $.ajax({
              	url: '/BaiThi/xacnhanhoadon',
              	type: 'POST',
              	data: {
              		mahd
              	},
              	success: function (data) {
              		let tt = btn.parentElement.parentElement.parentElement.parentElement.querySelectorAll('.trangthaicthd')
              		tt.forEach(e => {
              			e.innerHTML = "Đã thanh toán";
              		})
              		let datt = btn.parentElement.parentElement.querySelector('.datt');
              		let conlai = btn.parentElement.parentElement.querySelector('.conlai');
              		datt.innerHTML = conlai.innerHTML
              		conlai.innerHTML = 0
              		let header = btn.parentElement.parentElement.parentElement.parentElement.querySelector('.accordion-header')
                    header.style.backgroundColor = '#80ed99';
              		alert('Xác nhận hóa đơn ' +mahd+' thành công')
              		btn.parentElement.style.display = 'none';
              	},
              	error: function () {
              		alert("error");
              	}
              });
    	}

	  function themHang (btn, madt){
		  let mahd = document.querySelector('.mahdthem').innerHTML
		  let sl = btn.parentElement.querySelector('input[name="slsp"]').value;
		  let gia = btn.parentElement.querySelector('.gia').innerHTML
		  let i = 0
		  $('.mahd').each((index, element)=>{
		  
			  if(element.innerHTML == mahd){
				  i++;
				  if(i == 1){
					  $.ajax({
				           	url: '/BaiThi/themcthd',
				           	type: 'POST',
				           	data: {
				           		mahd,
				           		madt,
				           		sl
				           	},
				           	success: function (data) {
				           		element.parentElement.parentElement.parentElement.parentElement.querySelector('.product-list').innerHTML += data
				           	},
				           	error: function () {
				           		alert("error");
				           	}
				        }); 
					  let tongtien = parseInt(element.parentElement.parentElement.parentElement.parentElement.querySelector('.tongtien').innerHTML);
					  element.parentElement.parentElement.parentElement.parentElement.querySelector('.tongtien').innerHTML = tongtien + (parseInt(gia) * sl)
					  element.parentElement.parentElement.parentElement.parentElement.querySelector('.conlai').innerHTML = tongtien + (parseInt(gia) * sl)
					  element.parentElement.parentElement.parentElement.parentElement.querySelector('.xacnhanall').style.display = 'block'
				  }
				  
			  }
		  })
	  }
	  
	  function timkiem(param) {
		  let search = param.value
			if(search === ''){
				$.ajax({
	                url: '/BaiThi/searchByAjaxAdmin',
	                type: 'POST',
	                data: {
	                	search
	                },
	                success: function (data) {
	                	let row = document.querySelector('.list_Product .row')
	                	row.innerHTML = data
	                	
	                },
	                error: function () {
	                    alert("error");
	                }
	            });
			}else{
				$.ajax({
	                url: '/BaiThi/searchByAjaxAdmin',
	                type: 'POST',
	                data: {
	                	search
	                },
	                success: function (data) {
	                	let row = document.querySelector('.list_Product .row')
	                	row.innerHTML = data
	                	
	                },
	                error: function () {
	                    alert("error");
	                }
	            });
			}
	}

    </script>
</body>

</html>