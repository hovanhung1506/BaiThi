<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="utf-8">
	<title>Insert title here</title>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<META http-equiv="Content-Type" content="text/html; charset=utf-8">
	<style type="text/css">
		.note
		{
		    text-align: center;
		    height: 80px;
		    background: -webkit-linear-gradient(left, #0072ff, #8811c5);
		    color: #fff;
		    font-weight: bold;
		    line-height: 80px;
		}
		.form-content
		{
		    padding: 5%;
		    border: 1px solid #ced4da;
		    margin-bottom: 2%;
		}
		.form-control{
		    border-radius:1.5rem;
		}
		.btnSubmit
		{
		    border:none;
		    border-radius:1.5rem;
		    padding: 1%;
		    width: 20%;
		    cursor: pointer;
		    background: #0062cc;
		    color: #fff;
		}
	</style>
</head>

<body>
	<c:if test="${sessionScope.msg == '1' }">
		<script type="text/javascript">alert('Tạo tài khoản thành công')</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
	
	<c:if test="${sessionScope.msg == '0' }">
		<script type="text/javascript">alert('Trùng tên đăng nhập')</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
	
	<div class="container register-form">
            <div class="form">
                <div class="note">
                    <p>Đăng ký tài khoản admin</p>
                </div>

				<form action="dangkychoadmin" method="post" id="form">
					<div class="form-content">
	                    <div class="row" style="flex-direction: column;">
	                    	<div class="form-group">
	                        	<input type="text" class="form-control" placeholder="Tên đăng nhập *" name="username" required/>
	                        </div>
	                        
							<div class="form-group">
	                           <input type="password" class="form-control" placeholder="Mật khẩu *" name="pass" required/>
	                        </div>
	                        
	                        <div class="form-group">
	                           <input type="text" class="form-control" placeholder="Tên *" name="tennguoi" required/>
	                        </div>
	                        
	                        <div class="form-group">
	                        	<input type="number" class="form-control" placeholder="Quyền *" name="quyen" min="0" max="1" required/>
	                       	</div>
	                    </div>
	                    <button type="submit" class="btnSubmit">Submit</button>
	                    <a href="HomeAdmin" class="btn btn-primary" 
	                    	style="padding: 9px 64px 9px; border-radius: 20px;position: relative; top: -2px;">Trang chủ
	                    </a>
	                    <div class="g-recaptcha" data-sitekey="6Le2N5AdAAAAABiHNT-zxvWHDOmAonuPt1hufpxe"></div>
                    	<br><div id="error" style="color: red"></div><br>
                	</div>
				</form>
            </div>
        </div>
        <script type="text/javascript">
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