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
    <title>Quản lý loại</title>
</head>

<style>
	body { 
		overflow-y: scroll;
	}
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
    .modal-themloai, .modal-sualoai, .modal-xoaloai {
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

    @keyframes fadeIn-C {
        from {
            opacity: 0;
            transform: translateY(-50px);
        }

        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .modal-content-themloai, .modal-content-sualoai {
        width: 500px;
        animation: fadeIn-C ease 0.4s;
        background-color: #fff;
        position: relative;
        box-shadow: 0px 0px 12px 0px rgba(0, 0, 0, 0.5);
        border-radius: 10px;
    }

    @keyframes fadeIn-Xoa {
        from {
            opacity: 0;
        }

        to {
            opacity: 1;
        }
    }

    .modal-content-xoaloai{
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

    span.close-modal-themloai,
    span.close-modal-sualoai {
        position: absolute;
        top: 5px;
        right: 5px;
        cursor: pointer;
        font-size: 18px;
        padding: 8px 22px;
    }

    span.close-modal-themloai:hover,
    span.close-modal-sualoai:hover {
        background-color: #f44336;
        color: #fff;
        border-radius: 4px;
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
	<c:if test="${sessionScope.msg == '1' }">
		<script type="text/javascript">alert('Trùng nhà sản xuất')</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
	<c:if test="${sessionScope.themloai == '1' }">
		<script type="text/javascript">alert('Thêm thành công')</script>
		<c:remove var="themloai" scope="session"/>
	</c:if>
	
	<c:if test="${sessionScope.suaLoai == '1' }">
		<script type="text/javascript">alert("Sửa thành công")</script>
		<c:remove var="suaLoai" scope="session"/>
	</c:if>
	
	<c:if test="${sessionScope.xoaloai == '1' }">
		<script type="text/javascript">alert("Xóa thành công")</script>
		<c:remove var="xoaloai" scope="session"/>
	</c:if>
    <nav class="navbar navbar-inverse" style=" position: fixed; left: 0; right: 0; top: 0; z-index: 1">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li><a href="HomeAdmin">Quản lý điện thoại</a></li>
                <li class="active"><a href="quanlyloaiAdmin">Quản lý loại</a></li>
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
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="margin-top:80px">
                <h1>Quản lý loại</h1>
                <button class="btn btn-primary btn-ThemLoai" style="margin-bottom: 36px;">Thêm loại</button>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Mã loại</th>
                            <th>Tên loại</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
					<c:forEach items="${listLoai }" var="o">
						 <tr>
                            <td class="category-id">${o.getMaNSX() }</td>
                            <td class="category-name">${o.getTenNSX() }</td>
                            <td style="display: flex;; justify-content: space-evenly;">
                                <button class="btn btn-success btn-sualoai">Sửa</button>
                                <button class="btn btn-danger btn-xoaloai">Xóa</button>
                            </td>
                        </tr>
					</c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <div id="backtop">
        <i class="fas fa-chevron-up"></i>
    </div>
    
    <div class="modal-themloai">
        <div class="modal-content-themloai">
            <div class="modal-header">
                <h4 class="modal-title">Thêm mới</h4>
                <span class="close-modal-themloai"><i class="fal fa-times"></i></span>
            </div>
            <div class="modal-body">
                <form action="" method="post" id="form">
                    <div class="form-group">
                        <label for="">Mã loại</label>
                        <input type="text" class="form-control" name="maloai" placeholder="Nhập mã loại">
                    </div>
                    <div class="form-group">
                        <label for="">Tên loại</label>
                        <input type="text" class="form-control" name="tenloai" placeholder="Nhập tên loại">
                    </div>
                     <div class="g-recaptcha" data-sitekey="6Le2N5AdAAAAABiHNT-zxvWHDOmAonuPt1hufpxe"></div>
                    <br><div id="error" style="color: red"></div>
                    <button type="submit" class="btn btn-primary">Hoàn thành</button>
                </form>
            </div>
        </div>
    </div>

    <div class="modal-xoaloai">
        <div class="modal-content-xoaloai">
            <h4>Bạn có chắc chắn muốn xóa loại này?</h4>
            <div class="modal-Xoa-footer">
                <button class="btn btn-success btnYes">Có</button>
                <button class="btn btn-danger btnNo">Không</button>
            </div>
        </div>
    </div>
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
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
            
            $(".btn-ThemLoai")[0].onclick = (() => {
            	$('#form').attr('action', 'themloaiadmin');
            	let tieude = document.querySelector('.modal-title');
            	tieude.innerHTML = "Thêm mới";
            	document.querySelector('.modal-themloai').querySelector('input[name="maloai"]').setAttribute('required', 'true');
            	document.querySelector('.modal-themloai').querySelector('input[name="tenloai"]').setAttribute('required', 'true');
            	document.querySelector('.modal-themloai').querySelector('input[name="maloai"]').removeAttribute('readonly');
                $(".modal-themloai").css("display", "flex");
            })
            $(".close-modal-themloai")[0].onclick = (() => {
                $(".modal-themloai").css("display", "none");
                document.querySelector('.modal-themloai').querySelector('input[name="maloai"]').removeAttribute('value');
                document.querySelector('.modal-themloai').querySelector('input[name="tenloai"]').removeAttribute('value');
                grecaptcha.reset();
            })
            $('.modal-themloai')[0].onclick = (() => {
                $(".modal-themloai").css("display", "none");
                document.querySelector('.modal-themloai').querySelector('input[name="maloai"]').removeAttribute('value');
                document.querySelector('.modal-themloai').querySelector('input[name="tenloai"]').removeAttribute('value');
                grecaptcha.reset();
            })
            $('.modal-content-themloai')[0].onclick = (e => {
                e.stopPropagation();
            })

            $(".btn-sualoai").each(function (index, element) {
                element.onclick = (() => {
                	$('#form').attr('action', 'sualoaiadmin');
                	document.querySelector('.modal-themloai').querySelector('input[name="maloai"]').setAttribute('readonly', 'readonly');
                	let tieude = document.querySelector('.modal-title');
                	tieude.innerHTML = "Sửa";
                    let CateId = element.parentNode.parentNode.querySelector(".category-id");
                    let CateName = element.parentNode.parentNode.querySelector(".category-name").innerHTML;
                    document.querySelector('.modal-themloai').querySelector('input[name="maloai"]').setAttribute('value', CateId.innerHTML);
                    document.querySelector('.modal-themloai').querySelector('input[name="tenloai"]').setAttribute('value', CateId.innerHTML);
                    $('input[name="ten_loai"]').val(CateName);
                    $(".modal-themloai").css("display", "flex");
                })
            })

            $(".btn-xoaloai").each(function (index, element) {
                element.onclick = (() => {
                    $(".modal-xoaloai").css("display", "flex");
                    let row = element.parentNode.parentNode
                    let mansx = element.parentNode.parentNode.querySelector('.category-id').innerHTML
                    let btnYes = document.querySelector('.btnYes');
                    btnYes.addEventListener('click', function() {
                     	$.ajax({
                        	url: '/BaiThi/xoansxadmin',
                        	type: 'POST',
                        	data: {
                        		mansx
                        	},
                        	success: function (data) {
                        		row.remove()
                        		$(".modal-xoaloai").css("display", "none");
                        		alert('Xóa thành công')
                        	},
                        	error: function () {
                        		alert("error");
                        	}
                        }); 
					})
                })
            })
            $(".btnNo")[0].onclick = (() => {
                $(".modal-xoaloai").css("display", "none");
            })
            $('.modal-xoaloai')[0].onclick = (() => {
                $(".modal-xoaloai").css("display", "none");
            })
            $('.modal-content-xoaloai')[0].onclick = (e => {
                e.stopPropagation();
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
</body>

</html>