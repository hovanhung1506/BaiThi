window.addEventListener('load', function () {
  const slider = document.querySelector('.slider');
  const sliderMain = document.querySelector('.slider-main');
  const sliderItems = document.querySelectorAll('.slider-item');
  const nextBtn = document.querySelector('.slider-next');
  const prevBtn = document.querySelector('.slider-prev');
  const dotItem = document.querySelectorAll('.slider-dot-item');
  const sliderItemWight = sliderItems[0].offsetWidth;
  const sliderLength = sliderItems.length;
  let positionX = 0;
  let index = 0;
  nextBtn.addEventListener('click', function () {
    handleChangeSlide(1);
  });
  prevBtn.addEventListener('click', function () {
    handleChangeSlide(-1);
  });
  [...dotItem].forEach((item) =>
    item.addEventListener('click', function (e) {
      [...dotItem].forEach((el) => el.classList.remove('active'));
      e.target.classList.add('active');
      const sliderIndex = parseInt(e.target.dataset.index);
      index = sliderIndex;
      positionX = -1 * index * sliderItemWight;
      sliderMain.style = `transform: translateX(${positionX}px)`;
    })
  );
  function handleChangeSlide(direction = 1) {
    if (direction === 1) {
      if (index >= sliderLength - 1) index = -1;
      index++;
      positionX = -index * sliderItemWight;
      sliderMain.style = `transform: translateX(${positionX}px)`;
    } else if (direction === -1) {
      if (index <= 0) index = sliderLength;
      index--;
      positionX = -index * sliderItemWight;
      sliderMain.style = `transform: translateX(${positionX}px)`;
    }
    [...dotItem].forEach((el) => el.classList.remove('active'));
    dotItem[index].classList.add('active');
  }
  this.setInterval(handleChangeSlide, 3000);
});
