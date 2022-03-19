<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V1</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="assets_loginAdmin/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets_loginAdmin/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets_loginAdmin/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="assets_loginAdmin/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets_loginAdmin/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets_loginAdmin/css/util.css">
	<link rel="stylesheet" type="text/css" href="assets_loginAdmin/css/main.css">
<!--===============================================================================================-->
	<style type="text/css">
		#btn-captcha:hover {
			opacity: 0.7;
			cursor: pointer;
		}
	</style>
</head>
<body>
	
	<c:if test="${sessionScope.ktdnadmin == '0' }">
		<script type="text/javascript">alert("Sai tên đăng nhập hoặc mật khẩu")</script>
		<c:remove var="ktdnadmin" scope="session"/>
	</c:if>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="assets_loginAdmin/images/img-01.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" action="KiemTraAdmin" method="post" id="form">
					<span class="login100-form-title">
						Admin Login
					</span>

					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="username" placeholder="Username" required>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<!-- <i class="fa fa-envelope" aria-hidden="true"></i> -->
							<i class="fas fa-user" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pass" placeholder="Password" required>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="g-recaptcha" data-sitekey="6Le2N5AdAAAAABiHNT-zxvWHDOmAonuPt1hufpxe"></div>
					<div id="error" style="color: red"></div>
					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">
							Login
						</button>
					</div>
					
					<div class="text-center p-t-12">
					</div>

					<div class="text-center p-t-136">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	
<!--===============================================================================================-->	
	<script src="assets_loginAdmin/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="assets_loginAdmin/vendor/bootstrap/js/popper.js"></script>
	<script src="assets_loginAdmin/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="assets_loginAdmin/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="assets_loginAdmin/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
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
<!--===============================================================================================-->
	<!-- <script src="js/main.js"></script> -->

</body>
</html>