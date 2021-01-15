$(function() {
	var swiper = new Swiper('.swiper-container', {
		slidesPerView: '4',
		spaceBetween: 10,
		// watchSlidesVisibility: true,
		loop: true,
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	});
});