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
    <title>Quản lý khách hàng</title>
</head>
<style>
	body {
	  overflow-y: scroll;
	}
	
	body::-webkit-scrollbar {
	  width: 0.7em;
	}
	
	body::-webkit-scrollbar-track {
	  background: #f1f1f1;
	}
	
	body::-webkit-scrollbar-thumb {
	  background-color: #bbb;
	  border-radius: 100vw;
	  border: 2px solid #fff;
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

    .modal-Sua{
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

    .modal-Sua-container {
        width: 700px;
        background-color: #fff;
        padding: 10px;
        position: relative;
        border-radius: 4px;
        box-shadow: 0px 0px 12px 0px rgba(0, 0, 0, 0.5);
        animation: fadeIn-C ease 0.4s;
    }

    span.close-modal-Sua {
        position: absolute;
        top: 5px;
        right: 5px;
        cursor: pointer;
        font-size: 24px;
        padding: 12px 22px;
    }

    span.close-modal-Sua:hover {
        background-color: #f44336;
        color: #fff;
        border-radius: 4px;
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

    .sua_khachang:hover {
        cursor: pointer;
        color: orangered;
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
	<c:if test="${sessionScope.suaKH == '1' }">
		<script type="text/javascript">alert("Sửa thành công")</script>
		<c:remove var="suaKH" scope="session"/>
	</c:if>
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
                		<li><a href="dangkyadmin"><i class="bi bi-shield-shaded"></i> Đăng ký tài khoản admin</a></li>
                		<li><a href="KiemTraAdmin?logout=1"><i class="bi bi-arrow-right-circle-fill"></i> Đăng xuất</a></li>
                	</ul>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container" style="margin-top:80px">
        <h2>Danh sách khách hàng</h2>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Mã khách hàng</th>
                    <th>Họ tên</th>
                    <th>Địa chỉ</th>
                    <th>Số điện thoại</th>
                    <th>Email</th>
                    <th>Tên đăng nhập</th>
                    <th style="text-align: center">Chi tiết</th>
                </tr>
            </thead>
            <tbody>
			<c:forEach items="${listKH }" var="o">
				<tr>
                    <td>${o.getMaKhachHang() }</td>
                    <td>${o.getTenKhachHang() == null || o.getTenKhachHang() == '' ? '-' : o.getTenKhachHang() }</td>
                    <td>${o.getDiaChi() == null || o.getDiaChi() == '' ? '-' : o.getDiaChi() }</td>
                    <td>${o.getSoDienThoai() == null || o.getSoDienThoai() == '' ? '-' : o.getSoDienThoai() }</td>
                    <td>${o.getEmail() == null || o.getEmail() == '' ? '-' : o.getEmail() }</td>
                    <td>${o.getTenDangNhap() == null || o.getTenDangNhap() == '' ? '-' : o.getTenDangNhap() }</td>
                    <td style="display: none">${o.getMatKhau() }</td>
                    <td style="display:flex; justify-content: space-between;">
                        <a href="chitietkhachhang?makh=${o.getMaKhachHang() }">Xem</a> <span class="sua_khachang">Sửa</span>
                </tr>
			</c:forEach>
            </tbody>
        </table>
    </div>
    <div id="backtop">
        <i class="fas fa-chevron-up"></i>
    </div>

    <div class="modal-Sua">
        <div class="modal-Sua-container">
            <div class="modal-C-header">
                <h2>Sửa khách hàng</h2>
                <span class="close-modal-Sua"><i class="fal fa-times"></i></span>
            </div>
            <div class="modal-body">
                <form action="capnhatkhachhang" method="post">
                    <div class="form-group">
                        <label for="">Mã khách hàng</label>
                        <input type="text" class="form-control" name="txtmakh" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="">Họ tên</label>
                        <input type="text" class="form-control" name="txtTenKH" required>
                    </div>
                    <div class="form-group">
                        <label for="">Địa chỉ</label>
                        <input type="text" class="form-control" name="txtDC" required>
                    </div>
                    <div class="form-group">
                        <label for="">Số điện thoại</label>
                        <input type="number" class="form-control" name="txtSdt" required>
                    </div>
                    <div class="form-group">
                        <label for="">Email</label>
                        <input type="email" class="form-control" name="txtEmail" required>
                    </div>
                    <div class="form-group">
                        <label for="">Mật khẩu</label>
                        <input type="password" class="form-control" name="txtPass" required>
                    </div>
                    <input type="submit" class="btn btn-success btn-Luu" value="Lưu">
                </form>
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

            $('.sua_khachang').each(function (index, ele) {
                $(ele).click(function () {
                    $('.modal-Sua').css('display', 'flex');
                    let makh = ele.parentNode.parentNode.cells[0].innerHTML
                    let hoten = ele.parentNode.parentNode.cells[1].innerHTML
                    let diachi = ele.parentNode.parentNode.cells[2].innerHTML
                    let sodt = ele.parentNode.parentNode.cells[3].innerHTML
                    let email = ele.parentNode.parentNode.cells[4].innerHTML
                    let matkhau = ele.parentNode.parentNode.cells[6].innerHTML
                    $('.modal-Sua input[name="txtmakh"]').val(makh);
                    $('.modal-Sua input[name="txtTenKH"]').val(hoten);
                    $('.modal-Sua input[name="txtDC"]').val(diachi);
                    $('.modal-Sua input[name="txtSdt"]').val(sodt);
                    $('.modal-Sua input[name="txtEmail"]').val(email);
                    $('.modal-Sua input[name="txtPass"]').val(matkhau)
                });
            });

            $('.close-modal-Sua')[0].onclick = (() => {
                $('.modal-Sua').css('display', 'none')
            })

            $('.modal-Sua')[0].onclick = (() => {
                $('.modal-Sua').css('display', 'none')
            })

            $('.modal-Sua-container')[0].onclick = (e => {
                e.stopPropagation();
            })
        });
    </script>
</body>

</html>