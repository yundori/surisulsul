<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/index.css" />
<!-- ========== 컨텐츠 영역 시작 ========== -->
	 <div class="content">
        <!-- 1. 메인배너 3개 -> 슬라이드 화살표, 버튼 구현 -->
        <div id="main_banner">
            <div id="slides">
                <ul class="slides-container">
                   <!-- 슬라이드 1 -->
                    <li>
                        <a href="${contextPath}"><img src="${contextPath}/assets/img/index/main_banner1.png" alt="로고" /></a>
                    </li>
                    <!-- 슬라이드 2 -->
                    <li>
                        <a href="${contextPath}"><img src="${contextPath}/assets/img/index/main_banner2.png" alt="로고" /></a>
                    </li>
                    <!-- 슬라이드 3 -->
                    <li>
                        <a href="${contextPath}"><img src="${contextPath}/assets/img/index/main_banner3.png" alt="로고" /></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 2. 주능 테스트 결과
        1. 로그인 ok , 테스트 ok -> 주능 결과에 맞게 요약 보여줌
        2. 로그인 ok , 테스트 x -> 주능 테스트 해보세요 ! 배너 띄움 -->
        <div class="main_testresult">
            <div class="test_img">
                <a href="${contextPath}"><img src="${contextPath}/assets/img/index/main_banner3.png" alt="주능 테스트배너" /></a>
            </div>
            <p class="test_text">아직 당신을 위한 술을 추천 받지 못하셨나요?
                <br /> 지금 바로 주능 테스트를 해보세요 !
                <br />
                <button id="test_button">주능 테스트하기</button>
            </p>
        </div>
        <!-- 3. 인기 많은 술best !
         상품에 hover 시, 이미지 어두워지고 가격과 상품명 노출 -->
        <div class="main_best">
       <h1>인기 많은 술</h1>
       <ul class="best_box">
       	<li>
       		
       	</li>
       </ul>
        </div>
        <!-- 4. 우리 술 종류
         각 종류의 대표 이미지 , hover시 강조효과
         img, 종류명 클릭 시 각 페이지로 이동 가능(a태그에 같은 페이지 걸어두기) -->
        <div class="main_drink">
            <h1>우리 술 종류</h1>
            <ul class="box" id="box1">
                <li class="inner_box">
                        <a href="${contextPath}"><img src="${contextPath}/assets/img/drinks/takju.jpg" alt="탁주" /></a>
                        <br />
                        <span class="main_drink_text">탁주</span>
                </li>
            </ul>
            <ul class="box">
                <li>
                        <a href="${contextPath}"><img src="${contextPath}/assets/img/drinks/fruit_drink.jpg" alt="과실주" /></a>
                        <br />
                        <span class="main_drink_text">과실주</span>
                </li>
            </ul>
            <ul class="box">
                <li>
                    
                        <a href="${contextPath}"><img src="${contextPath}/assets/img/drinks/cheongju.png" alt="약주/청주" /></a>
                        <br />
                        <span class="main_drink_text">약주/청주</span>
                </li>
            </ul>
            <div class="main_drink_2">
            <ul class="box" id="box2">
                <li>
                        <a href="${contextPath}"><img src="${contextPath}/assets/img/drinks/soju.jpg" alt="증류주" /></a>
                        <br />
                        <span class="main_drink_text">증류주</span>
                </li>
            </ul>
            <ul class="box">
                <li>
                    <a href="${contextPath}"><img src="${contextPath}/assets/img/drinks/extra_drink.jpg" alt="기타주류" /></a>
                        <br />
                        <span class="main_drink_text">기타주류</span>
                </li>
            </ul>
        </div>
        </div>
    </div>

<!--// ========== 컨텐츠 영역 끝 ========== -->
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
<!--  스크립트 적용 -->
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 플러그인 JS 참조 -->
<script src="${contextPath}/assets/plugins/superslides/jquery.easing.1.3.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/assets/plugins/superslides/jquery.superslides.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/assets/js/index.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
