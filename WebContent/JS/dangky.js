$(document).ready(function () {
		$('.eye1').click(function () {
			$(this).toggleClass('open');
			$(this).children('i').toggleClass('fa-eye-slash fa-eye');
			if ($(this).hasClass('open')) {
			$('.form1').attr('type', 'text');
			} else {
			$('.form1').attr('type', 'password');
			}
		});

		$('.eye2').click(function () {
			$(this).toggleClass('open');
			$(this).children('i').toggleClass('fa-eye-slash fa-eye');
			if ($(this).hasClass('open')) {
			$('.form2').attr('type', 'text');
			} else {
			$('.form2').attr('type', 'password');
			}
		});
		
		$('.form1')[0].addEventListener('focusout', function () {
			let pass1 = $('[name="txtpass1"]').get(0).value;
			let pass2 = $('[name="txtpass2"]').get(0).value;
			if(pass2.length !== 0){
				if(pass1 !== pass2 ){
					$('.error_pass').css('display', 'block');
				}
			}
		});
		$('.form2')[0].addEventListener('focusout', function(){
			let pass1 = $('[name="txtpass1"]').get(0).value;
			let pass2 = $('[name="txtpass2"]').get(0).value;
			if(pass1 !== pass2){
				$('.error_pass').css('display', 'block');
			}
		})
		$('.form2')[0].addEventListener('focusin', function(){
			$('.error_pass').css('display', 'none');
		})
		$('.form1')[0].addEventListener('focusin', function(){
			$('.error_pass').css('display', 'none');
		})
	});