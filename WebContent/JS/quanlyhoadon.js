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
      alert(`Xóa hóa đơn ${mahd} thành công`);
      element.parentElement.parentElement.parentElement.remove();
    };
  });

  $('.xacnhancthd').each((index, element) => {
    element.onclick = function (e) {
      element.parentElement.parentElement.parentElement.querySelector('.product-item__info').querySelector('.trangthaicthd').innerHTML = 'Đã xác nhận';
      let macthd = element.parentElement.parentElement.parentElement.querySelector('.macthd').innerHTML;
      alert(`Xác nhận thành công ${macthd}`);

      let tiencthd = parseInt(element.parentElement.parentElement.parentElement.querySelector('.tiencthd').innerHTML);
      let datt = parseInt(element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.datt').innerHTML);
      let conlai = parseInt(element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.conlai').innerHTML);
      datt += tiencthd;
      conlai -= tiencthd;
      element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.datt').innerHTML = datt;
      element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.conlai').innerHTML = conlai;

      let trangthai = element.parentElement.parentElement.parentElement.parentElement.querySelectorAll('.trangthaicthd');
      let dem = 0;
      trangthai.forEach((v, i) => {
        if (v.innerHTML == 'Đã thanh toán') {
          dem++;
        }
      });
      if (dem == trangthai.length) {
        element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.xacnhanall').remove();
      }
      element.parentElement.parentElement.parentElement.querySelector('.capnhatsl').remove();
      element.parentElement.parentElement.remove();
    };
  });

  $('.capnhatsl').each((index, element) => {
    element.onclick = function (e) {
      let sl = element.parentElement.querySelector('input[name="soluonghang"]').value;
      alert(`Cập nhật số lượng thành công ${sl}`);
      element.parentElement.querySelector('input[name="soluonghang"]').setAttribute('value', sl);
      let tiencthd = parseInt(element.parentElement.parentElement.parentElement.querySelector('.tiencthd').innerHTML);
      let soluonghang = element.parentElement.querySelector('input[name="soluonghang"]').value;
      element.parentElement.parentElement.parentElement.querySelector('.tiencthd').innerHTML = soluonghang * tiencthd;
    };
  });

  $('.xoacthd').each((index, element) => {
    element.onclick = function (e) {
      let macthd = element.parentElement.parentElement.parentElement.querySelector('.macthd').innerHTML;
      let tiencthd = parseInt(element.parentElement.parentElement.parentElement.querySelector('.tiencthd').innerHTML);
      let conlai = parseInt(element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.conlai').innerHTML);
      element.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('.conlai').innerHTML = conlai - tiencthd;
      alert(`Xóa chi tiết hóa đơn ${macthd} thành công`);
      if (conlai - tiencthd == 0) {
        element.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement.remove();
      }
      element.parentElement.parentElement.parentElement.remove();
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

  function xacnhanhd(mahd){
	alert(mahd)
}


  function themHang (btn, madt){

  }
