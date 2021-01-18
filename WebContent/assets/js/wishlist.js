$(function() {
	var swiper = new Swiper('.swiper-container', {
		slidesPerView: '4', //동시에 보여줄 슬라이드 갯수
		slidesPerGroup: '4', //그룹으로 묶을 그룹 수
		//loopFillGroupWithBlank : true,
		spaceBetween: 10,
		loop: false,
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