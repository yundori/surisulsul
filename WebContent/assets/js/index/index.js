$(function() {

        /** `.slides`요소에 대해 플러그인 적용 */
        $('#slides').superslides({
            inherit_width_from: '#main_banner', // 슬라이드의 넓이를 구성할 부모 요소
            inherit_height_from: '#main_banner', // 슬라이드의 높이를 구성할 부모 요소
            play: 5000, // 재생시간 (1/1000초 단위). 미지정시 자동재생 안됨.
            animation: 'slide' // 애니메이션 옵션(fade/slide) (미적용시 슬라이드)
        });
    });