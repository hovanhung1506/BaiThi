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
    <title>Quản lý điện thoại</title>
</head>
<style>
    body::-webkit-scrollbar,
    .list-group::-webkit-scrollbar {
        width: 11px;
    }

    body::-webkit-scrollbar-thumb,
    .list-group::-webkit-scrollbar-thumb {
        background-color: #ccc;
        border-radius: 100vw;
        border: 2px solid #f5f5f5;
    }

    body {
        background-color: #f5f5f5;
    }

    .cart {
        position: relative;
    }

    .cart-notice {
        position: absolute;
        top: 7px;
        color: #fff;
        background-color: #bbb;
        border-radius: 30px;
        padding: 0px 8px;
        right: -4px;
    }

    .product-item {
        border: 1px solid #ccc;
    }

    .product-item:hover {
        box-shadow: 0px 0px 12px 0px #0096c7;
    }

    .category {
        position: fixed;
        width: max-content;
    }

    .list-group {
        width: 272.5px;
        height: 500px;
        overflow: hidden;
    }

    .list-group:hover {
        overflow-y: scroll;
    }

    .edit-product {
        display: flex;
        justify-content: space-around;
        font-size: 20px;
    }

    .edit-product button {
        padding: 0px 18px;
        border: 0;
        background-color: #fff;
    }

    .edit-product button:first-child:hover {
        background-color: #449d44;
        border-radius: 6px;
        color: #fff;
    }

    .edit-product button:last-child:hover {
        background-color: #f00;
        border-radius: 6px;
        color: #fff;
    }

    .add-product {
        background-color: #337ab7;
        color: #fff;
        font-size: 24px;
        margin-bottom: 24px;
        border: 0;
        border-radius: 4px;
    }

    .add-product:hover {
        background-color: #f8a5c2;
    }

    .add-product i {
        margin-right: 8px;
    }

    .product__name,
    .product__author {
        overflow: hidden;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
    }

    #backtop {
        width: 50px;
        height: 50px;
        background-color: tomato;
        color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 50%;
        position: fixed;
        bottom: 40px;
        right: 20px;
        cursor: pointer;
    }

    .modal-C, .modal-Sua, .modal-Xoa {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: rgba(0, 0, 0, 0.2);
        align-items: center;
        justify-content: center;
        display: none;
        z-index: 1;
    }

    .modal-C-container, .modal-Sua-container {
        width: 700px;
        height: 720px;
        background-color: #fff;
        padding: 10px;
        position: relative;
        border-radius: 4px;
        box-shadow: 0px 0px 12px 0px rgba(0, 0, 0, 0.5);
        animation: fadeIn-C ease 0.4s;
        overflow: hidden;
        overflow-y: scroll;
    }

    span.close-modal-C, span.close-modal-Sua {
        position: absolute;
        top: 5px;
        right: 5px;
        cursor: pointer;
        font-size: 24px;
        padding: 12px 22px;
    }

    span.close-modal-C:hover, span.close-modal-Sua:hover {
        background-color: #f44336;
        color: #fff;
        border-radius: 4px;
    }

    .open-modal {
        display: flex;
    }

    @keyframes fadeIn-C {
        from {
            opacity: 0;
            transform: translateY(-500px);
        }

        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    @keyframes fadeIn-Xoa {
        from {
            opacity: 0;
        }

        to {
            opacity: 1;
        }
    }

    .modal-Xoa-container {
        width: 400px;
        height: 200px;
        background-color: #fff;
        border-radius: 20px;
        display: flex;
        align-items: center;
        flex-direction: column;
        justify-content: space-around;
        box-shadow: 0px 0px 12px 0px rgba(0, 0, 0, 0.5);
        animation: fadeIn-Xoa ease 0.4s;
    }

    .modal-Xoa-footer {
        display: flex;
        justify-content: space-evenly;
        flex-direction: row;
        width: 100%;
    }

    .btnNo {
        padding: 6px 34px;
    }

    .btnYes{
        padding: 6px 46px;
    }
    
    .taikhoan {
    	padding: 15px;
    	display: inline-block;
    	color: #9d9d9d;
    	cursor: pointer;
    	position: relative;
    }
	
	.subnav-taikhoan {
		position: absolute;
	    top: 102%;
	    width: 250px;
	    background: #fff;
	    box-shadow: 0px 0px 4px rgb(0 0 0 / 30%);
	    padding-top: 8px;
	    display: none;
	}
	
	.subnav-taikhoan li {
		margin-bottom: 10px;
	}
	
	.subnav-taikhoan::before {
		position: absolute;
	    content: '';
	    top: -20%;
	    left: 44%;
	    border: 10px solid;
	    border-top-color: transparent;
	    border-bottom-color: #fff;
	    border-left-color: transparent;
	    border-right-color: transparent;
	}
	
	.navcha li {
		list-style: none;
	}
	
	.navcha:hover .taikhoan {
		color: #fff;
	}
	
	.navcha:hover .subnav-taikhoan{
		display: block;
	}
	
</style>

<body>

	<c:if test="${sessionScope.upfile == '1' }">
		<script type="text/javascript">alert('Thêm thành công')</script>
		<c:remove var="upfile" scope="session"/>
	</c:if>
	
	<c:if test="${sessionScope.trungma == '1'}">
		<script type="text/javascript">alert('Trùng mã điện thoại')</script>
		<c:remove var="trungma" scope="session"/>
	</c:if>
	
	<c:if test="${sessionScope.update == '1'}">
		<script type="text/javascript">alert('Sửa thành công')</script>
		<c:remove var="update" scope="session"/>
	</c:if>
	
    <nav class="navbar navbar-inverse" style=" position: fixed; left: 0; right: 0; top: 0; z-index: 1">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li class="active"><a href="HomeAdmin">Quản lý điện thoại</a></li>
                <li><a href="quanlyloaiAdmin">Quản lý loại</a></li>
                <li><a href="quanlykhadmin">Quản lý khách hàng</a></li>
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
                		<li><a href="dangkyadmin"><i class="bi bi-shield-shaded"></i> Đăng ký tài khoản admin</a></li>
                		<li><a href="KiemTraAdmin?logout=1"><i class="bi bi-arrow-right-circle-fill"></i> Đăng xuất</a></li>
                	</ul>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container" style="margin-top:80px">
        <div class="row">
            
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 category">
                <div style="width: 261.5px">
                    <div class="card-header bg-primary text-white text-uppercase"
                        style=" height: 42px; padding: 10px 15px; border-top-left-radius: 4px; border-top-right-radius: 4px; ">
                        <i class="fa fa-list"></i> Hãng
                    </div>
                    <div class="list-group">
                        <div style="width: 261.5px">
                            <c:forEach items="${listNSX }" var="o">
                            	<a href="HomeAdmin?hang=${o.getMaNSX() }" class="list-group-item ${tag == o.getMaNSX() ? 'active': ''}">${o.getTenNSX() }</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" style="margin-left: 292.5px;">
                <div class="row">

                    <div style="margin-left:15px">
                        <button class="add-product">
                            <i class="far fa-plus-square"></i>Thêm mới
                        </button>
                    </div>
                    <c:forEach items="${listDT }" var="o">
                    	<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
	                        <div class="thumbnail product-item">
	                            <img src="${o.getAnh() }" style="width: 234px; height: 264px" alt="">
	                            <div class="caption">
	                                <p class="product_Id" style="display: none;">${o.getMaDienThoai() }</p>
	                                <p class="product_cate" style="display: none;">${o.getMaNSX() }</p>
	                                <p class="product__name">${o.getTenDienThoai() }</p>
	                                <p><span>Giá: </span><span class="price">${o.getGia() }</span><span> đ</span></p>
	                                <p class="product__SL" style="display: none;">${o.getSoLuong() }</p>
	                                <c:forEach items="${listTS }" var="p">
	                                	<c:if test="${o.getMaDienThoai() == p.getMaDienThoai() }">
	                                		<p class="product__KTMH" style="display: none;">${p.getKichThuocManHinh() }</p>
			                                <p class="product__CNMH" style="display: none;">${p.getCongNgheManHinh() }</p>
			                                <p class="product__CamSau" style="display: none;">${p.getCameraSau() }</p>
			                                <p class="product__CamTruoc" style="display: none;">${p.getCameraTruoc() }</p>
			                                <p class="product__Chipset" style="display: none;">${p.getChipset() }</p>
			                                <p class="product__RAM" style="display: none;">${p.getDungLuongRAM() }</p>
			                                <p class="product__ROM" style="display: none;">${p.getBoNhoTrong() }</p>
			                                <p class="product__Pin" style="display: none;">${p.getPin() }</p>
			                                <p class="product__TheSim" style="display: none;">${p.getTheSim() }</p>
			                                <p class="product__OS" style="display: none;">${p.getHeDieuHanh() }</p>
			                                <p class="product__DPGMH" style="display: none;">${p.getDoPhanGiaiManHinh() }</p>
			                                <p class="product__LoaiCPU" style="display: none;">${p.getLoaiCPU() }</p>
			                                <p class="product__KT" style="display: none;">${p.getKichThuoc() }</p>
	                                	</c:if>
	                                </c:forEach>
	                                <p class="edit-product">
	                                    <button title="Sửa" class="js-update"><i class="fas fa-highlighter"></i></button>
	                                    <button title="Xóa" class="js-Delete"><i class="fas fa-times-circle"></i></button>
	                                </p>
	                            </div>
	                        </div>
	                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div id="backtop">
        <i class="fas fa-chevron-up"></i>
    </div>

    <div class="modal-C">
        <div class="modal-C-container">
            <div class="modal-C-header">
                <h2 class="modal-title">Thêm mới</h2>
                <span class="close-modal-C"><i class="fal fa-times"></i></span>
            </div>
            <div class="modal-C-body">
                <form action="" method="post" enctype="multipart/form-data" id="form">
                    <div class="form-group">
                        <label for="">Mã điện thoại</label>
                        <input type="text" class="form-control" name="txtMaDT" required>
                    </div>
                    <div class="form-group">
                        <label for="">Tên điện thoại</label>
                        <input type="text" class="form-control" name="txtTenDT" required>
                    </div>
                    <div class="form-group">
                        <label for="">Giá</label>
                        <input type="number" class="form-control" min="1" name="txtGia" required>
                    </div>
                    <div class="form-group">
                        <label for="">Ảnh</label>
                        <input type="file" class="form-control" name="txtfile">
                    </div>
                    <div class="form-group">
                        <label for="">Hãng</label>
                        <select class="form-control" name="txtLoaiDT" required>
                            <option value="" selected hidden>Chọn hãng</option>
                            <c:forEach items="${listNSX }" var="o">
                            	<option value="${o.getMaNSX() }">${o.getTenNSX()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Số lượng</label>
                        <input type="number" class="form-control" min="1" name="txtSoLuong" required>
                    </div>
                    <h3>Thông số kỹ thuật</h3>
                    <div class="form-group">
                        <label for="">Kích thước màn hình</label>
                        <input type="text" class="form-control" name="txtKTMH">
                    </div>
                    <div class="form-group">
                        <label for="">Công nghệ màn hình</label>
                        <input type="text" class="form-control" name="txtCNMH">
                    </div>
                    <div class="form-group">
                        <label for="">Camera sau</label>
                        <input type="text" class="form-control" name="txtCamSau">
                    </div>
                    <div class="form-group">
                        <label for="">Camera trước</label>
                        <input type="text" class="form-control" name="txtCamTruoc">
                    </div>
                    <div class="form-group">
                        <label for="">Chipset</label>
                        <input type="text" class="form-control" name="txtChipset">
                    </div>
                    <div class="form-group">
                        <label for="">Dung lượng RAM</label>
                        <input type="text" class="form-control" name="txtRAM">
                    </div>
                    <div class="form-group">
                        <label for="">Bộ nhớ trong</label>
                        <input type="text" class="form-control" name="txtROM">
                    </div>
                    <div class="form-group">
                        <label for="">Pin</label>
                        <input type="text" class="form-control" name="txtPin">
                    </div>
                    <div class="form-group">
                        <label for="">Thẻ Sim</label>
                        <input type="text" class="form-control" name="txtSim">
                    </div>
                    <div class="form-group">
                        <label for="">Hệ điều hành</label>
                        <input type="text" class="form-control" name="txtOS">
                    </div>
                    <div class="form-group">
                        <label for="">Độ phân giải màn hình</label>
                        <input type="text" class="form-control" name="txtDPGMH">
                    </div>
                    <div class="form-group">
                        <label for="">Loại CPU</label>
                        <input type="text" class="form-control" name="txtCPU">
                    </div>
                    <div class="form-group">
                        <label for="">Kích thước</label>
                        <input type="text" class="form-control" name="txtKT">
                    </div>
                    <div class="g-recaptcha" data-sitekey="6Le2N5AdAAAAABiHNT-zxvWHDOmAonuPt1hufpxe"></div>
                    <br><div id="error" style="color: red"></div><br>
                    <input type="submit" class="btn btn-success" value="Hoàn thành">
                </form>
            </div>
        </div>
    </div>

    

    <div class="modal-Xoa">
        <div class="modal-Xoa-container">
            <h4>Bạn có chắc chắn muốn xóa sách này?</h4>
            <div class="modal-Xoa-footer">
                <button class="btn btn-success btnYes">Có</button>
                <button class="btn btn-danger btnNo">Không</button>
            </div>
        </div>
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

            $('.add-product')[0].onclick = (() => {
                $('.modal-C').addClass('open-modal');
                let tieude = document.querySelector('.modal-title');
                tieude.innerHTML = 'Thêm mới';
                $('#form').attr('action', 'themdienthoaimoi');
                document.querySelector('.modal-C').querySelector('input[name="txtMaDT"]').setAttribute('required', 'true');
                document.querySelector('.modal-C').querySelector('input[name="txtMaDT"]').removeAttribute('readonly');
            })

            function xoaValue() {
                document.querySelector('.modal-C').querySelector('input[name="txtMaDT"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtTenDT"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtGia"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtSoLuong"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtKTMH"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtCNMH"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtCamSau"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtCamTruoc"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtChipset"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtRAM"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtROM"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtPin"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtSim"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtOS"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtDPGMH"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtCPU"]').removeAttribute('value');
                document.querySelector('.modal-C').querySelector('input[name="txtKT"]').removeAttribute('value');
            }

            function themValue(value){
                    let body_product = value.parentNode.parentNode;
                    let pName = body_product.querySelector('.product__name');
                    let price = body_product.querySelector('.price');
                    let pId = body_product.querySelector('.product_Id');
                    let pCate = body_product.querySelector('.product_cate');
                    let p_Img = body_product.parentNode.querySelector('img').src;
                    let p_SL = body_product.querySelector('.product__SL');
                    let p_KTMH = body_product.querySelector('.product__KTMH');
                    let p_CNMH = body_product.querySelector('.product__CNMH');
                    let p_CamSau = body_product.querySelector('.product__CamSau');
                    let p_CamTruoc = body_product.querySelector('.product__CamTruoc');
                    let p_Chipset = body_product.querySelector('.product__Chipset');
                    let p_RAM = body_product.querySelector('.product__RAM');
                    let p_ROM = body_product.querySelector('.product__ROM');
                    let p_Pin = body_product.querySelector('.product__Pin');
                    let p_Sim = body_product.querySelector('.product__TheSim');
                    let p_OS = body_product.querySelector('.product__OS');
                    let p_DPGMH = body_product.querySelector('.product__DPGMH');
                    let p_CPU = body_product.querySelector('.product__LoaiCPU');
                    let p_KC = body_product.querySelector('.product__KT');
                    document.querySelector('.modal-C').querySelector('input[name="txtMaDT"]').setAttribute('value', pId.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtTenDT"]').setAttribute('value', pName.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtGia"]').setAttribute('value', price.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtSoLuong"]').setAttribute('value', p_SL.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtKTMH"]').setAttribute('value', p_KTMH.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtCNMH"]').setAttribute('value', p_CNMH.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtCamSau"]').setAttribute('value', p_CamSau.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtCamTruoc"]').setAttribute('value', p_CamTruoc.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtChipset"]').setAttribute('value', p_Chipset.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtRAM"]').setAttribute('value', p_RAM.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtROM"]').setAttribute('value', p_ROM.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtPin"]').setAttribute('value', p_Pin.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtSim"]').setAttribute('value', p_Sim.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtOS"]').setAttribute('value', p_OS.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtDPGMH"]').setAttribute('value', p_DPGMH.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtCPU"]').setAttribute('value', p_CPU.innerHTML);
                    document.querySelector('.modal-C').querySelector('input[name="txtKT"]').setAttribute('value', p_KC.innerHTML);
                    $('.modal-C select option').each((index, value) => {
                        if (value.textContent.trim() == pCate.innerHTML) {
                            value.selected = true;
                        }
                    })
            }

            $('.close-modal-C')[0].onclick = (() => {
                $('.modal-C').removeClass('open-modal');
                grecaptcha.reset();
                xoaValue();
                $('.modal-C select option').each((index, value) => {
                    if (index == 0) {
                        value.selected = true;
                        return false;
                    }
                })
            })

            $('.modal-C')[0].onclick = (() => {
                $('.modal-C').removeClass('open-modal');
                grecaptcha.reset();
                xoaValue();
                $('.modal-C select option').each((index, value) => {
                    if (index == 0) {
                        value.selected = true;
                        return false;
                    }
                })
            })

            $('.modal-Xoa')[0].onclick = (() => {
                $('.modal-Xoa').removeClass('open-modal');
            })

            $('.modal-C-container')[0].onclick = (e => {
                e.stopPropagation();
            })

            $('.js-update').each((index, value) => {
                
                value.onclick = (() => {
                    $('.modal-C').addClass('open-modal');
                    let tieude = document.querySelector('.modal-title');
                    tieude.innerHTML = 'Cập nhật điện thoại';
                    $('#form').attr('action', 'capnhatthongtindt');
                    document.querySelector('.modal-C').querySelector('input[name="txtMaDT"]').removeAttribute('required');
                    document.querySelector('.modal-C').querySelector('input[name="txtMaDT"]').setAttribute('readonly', 'readonly');
                    themValue(value);
                })
            })
            
            
            var item, madt;
            $('.js-Delete').each((index, value) => {
                value.onclick = (() => {
                    $('.modal-Xoa').addClass('open-modal');
                    madt = value.parentNode.parentNode.querySelector('.product_Id').innerHTML;
                    item = value.parentNode.parentNode.parentNode.parentNode
                })
            })
            
            let btnYes = document.querySelector('.btnYes');
            btnYes.addEventListener("click", function() {
             	$.ajax({
            		url: '/BaiThi/xoadienthoai',
            		type: 'POST',
            		data: {
            			madt
            		},
            		success: function (data) {
            			item.remove();
            			alert('Xóa thành công')
            		},
            		error: function () {
            			alert("error");
            		}
            	});
			});

            $('.btnNo')[0].onclick = (() => {
                $('.modal-Xoa').removeClass('open-modal');
            })
        });

         window.onload = () => {
            const form = document.getElementById('form');
            const error = document.getElementById('error');
            form.addEventListener('submit', function(e) {
                e.preventDefault();
                const response = grecaptcha.getResponse();
                if(response){
                    form.submit();
                }else{
                    error.innerHTML = 'Vui lòng xác nhận bạn không phải robot';
                }
            });
        } 
    </script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</body>

</html>