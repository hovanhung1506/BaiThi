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
				let soluong = document.querySelector('.giohang')
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

function updateQuantity(btn, ms) {
	var sl = btn.parentElement.parentElement.querySelector('input[type="number"]').value
	$.ajax({
		url: '/BaiThi/xulygiohang',
		type: 'POST',
		data: {
			ms,
			sl,
			act: 'update'
		},
		success: function(data) {
			let row = btn.parentElement.parentElement.querySelector('input[type="number"]')
			row.setAttribute('value', sl);
			let tt = document.querySelector('.TongTien')
			tt.innerHTML = data;
		},
	});
}

function trahang(btn, ms) {
	$.ajax({
		url: '/BaiThi/xulygiohang',
		type: 'POST',
		data: {
			ms,
			act: "delete"
		},
		success: function(data) {
			let row = document.querySelector('.giohang')
			let tt = document.querySelector('.TongTien')
			let txts = data.split(';')
			tt.innerHTML = txts[0];
			let soluong = document.querySelector('.giohang')
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
