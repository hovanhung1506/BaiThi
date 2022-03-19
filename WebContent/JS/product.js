$(document).ready(function () {
  $('.btn-show-more-cau-hinh')[0].addEventListener('click', function () {
    $('.modal-technical-info').addClass('open-modal');
  });

  $('.icon-close')[0].addEventListener('click', function () {
    $('.modal-technical-info').removeClass('open-modal');
  });

  $('.modal-technical-info')[0].addEventListener('click', function () {
    $('.modal-technical-info').removeClass('open-modal');
  });

  $('.modal-technical-info-container')[0].addEventListener('click', function (e) {
    e.stopPropagation();
  });
});
