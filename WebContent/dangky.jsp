<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/jgthms/minireset.css@master/minireset.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style/dangkytaikhoan.css">

    <title>Đăng ký</title>
</head>

<body>

	<c:if test="${sessionScope.kttmk != null && sessionScope.kttmk == true }">
		<script type="text/javascript">	alert("Mật khẩu không trùng khớp");	</script>
		<c:remove var="kttmk" scope="session"/>
	</c:if>

	<c:if test="${sessionScope.taotk != null && sessionScope.taotk == true }">
		<script type="text/javascript">
			alert("Tạo tài khoản thành công");
			window.location.href = "home"
		</script>
	</c:if>
	
	<c:choose>
		<c:when test="${sessionScope.maloi != null && sessionScope.maloi == 1 }">
			<script type="text/javascript">	alert("Trùng tên đăng nhập"); </script>
			<c:remove var="maloi" scope="session"/>
		</c:when>
		<c:when test="${sessionScope.maloi != null && sessionScope.maloi == 2 }">
			<script type="text/javascript">	alert("Trùng email"); </script>
			<c:remove var="maloi" scope="session"/>
		</c:when>
		<c:when test="${sessionScope.maloi != null && sessionScope.maloi == 3 }">
			<script type="text/javascript">	alert("Trùng số điện thoại"); </script>
			<c:remove var="maloi" scope="session"/>
		</c:when>
	</c:choose>

    <div class="signup">
        <h2 class="signup__heading">Đăng ký tài khoản</h2>
        <p class="signup__already">Already have an account? <a href="#" data-toggle="modal" data-target="#myModal" class="signup__link signup__link--underline">Sign in</a></p>
        <form action="xulydktk" class="signup_form">
            <div class="form__group">
                <input value="${tendn }" type="text" class="form__input" placeholder="Tên đăng nhập" name="txtun" required>
            </div>
            <div class="form__group form__group--2">
                <input value="${pass1 }" type="password" class="form__input form1" placeholder="Nhập mật khẩu" name="txtpass1" required>
                <div class="eye1"><i class="fas fa-eye"></i></div>
                <input value="${pass1 }" type="password" class="form__input form2" placeholder="Xác nhận mật khẩu" name="txtpass2" required>
                <div class="eye2"><i class="fas fa-eye"></i></div>
                <span class="error_pass">Mật khẩu không trùng khớp</span>
            </div>
            <div class="form__group">
                <input value="${hoten }" type="text" class="form__input" placeholder="Họ tên" name="txtten" required>
            </div>
            <div class="form__group">
                <input value="${email }" type="email" class="form__input" placeholder="Email" name="txtemail" required>
            </div>
            <div class="form__group">
                <input value="${sdt }" type="tel" class="form__input" placeholder="Số điện thoại" name="txtsdt" pattern="0[1-9]{9}" required>
            </div>
            <div class="form__group">
                <input value="${diachi }" type="text" class="form__input" placeholder="Địa chỉ" name="txtdc" required>
            </div>
            <div class="form__group">
                <button type="submit" class="form__submit">
                    <span class="form__submit-text">Sign Up</span> <i class="fa fa-long-arrow-right form__submit-icon"></i>
                </button>
            </div>
            <div class="form__tos">
                <input type="checkbox" name="" id="tos" class="form__tos-checkbox" style="margin-top: -6px; outline: 0">
                <label for="tos">I have read and agreed to the <a href="#" class="signup__link">Terms of Service</a></label>
            </div>
            <a href="home" class="home"><i class="fas fa-home"></i> Home</a>
        </form>
    </div>

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
	
<script src="./JS/dangky.js"></script>
</body>

</html>