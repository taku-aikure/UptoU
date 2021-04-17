$(function() {
  $('.slider').slick({
    autoplay: true,
    autoplaySpeed: 2000,
    infinite: true,
    lazyLoad: 'ondemand',
    slidesToShow: 1,
    slidesToScroll: 1,
    useCSS: true,
    useTransform: true,
  });
});