$(function() {
  $('.slider').slick({
    autoplay: true,
    autoplaySpeed: 2000,
    infinite: true,
    lazyLoad: 'ondemand',
    slidesToShow: 3,
    slidesToScroll: 1
  });
});