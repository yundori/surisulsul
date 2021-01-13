<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>술학능력시험 - 주능</title>
	<!-- 크로스 브라우징 호환성 시작 -->
	<!-- <link rel="stylesheet" type="text/css" href="../assets/css/reset.css" />-->
	<!-- 크로스 브라우징 호환성 끝 -->
	<!-- CSS 파일 참조 처리 -->
	<link rel="stylesheet" type="text/css" href="../assets/css/common.css" />
	<link rel="stylesheet" type="text/css" href="../assets/css/juneung.css" />
</head>

<body>
	<div id="juneung_content">
    	<h1>술학능력시험 - 주(酒)능</h1>
    	<h2>나의 최애 주종+안주 조합 고르기</h2>
    	<h4>내가 좋아하는 술</h4>
    	<div class="icon_box"><img src="../assets/img/juneung/beer.png" class="juneung_icon"/><div class="icon_description text_visible">맥주</div></div>
    	<div class="icon_box"><img src="../assets/img/juneung/soju.png" class="juneung_icon"/><div class="icon_description text_visible">소주</div></div>
    	<div class="icon_box"><img src="../assets/img/juneung/wine.png" class="juneung_icon"/><div class="icon_description text_visible">와인</div></div>
    	<div class="icon_box"><img src="../assets/img/juneung/ricewine.png" class="juneung_icon"/><div class="icon_description text_visible">막걸리</div></div>
    	<h4>내가 좋아하는 음식</h4>
    	<div class="icon_box"><img src="../assets/img/juneung/meat.png" class="juneung_icon"/><div class="icon_description text_visible">고기</div></div>
    	<div class="icon_box"><img src="../assets/img/juneung/fish.png" class="juneung_icon"/><div class="icon_description text_visible">생선</div></div>
    	<div class="icon_box"><img src="../assets/img/juneung/fruit.png" class="juneung_icon"/><div class="icon_description text_visible">과일</div></div>
    	<div class="icon_box"><img src="../assets/img/juneung/snack.png" class="juneung_icon"/><div class="icon_description text_visible">스낵</div></div>
    	<hr/>
    	<h2>오늘의 술자리 분위기</h2>
    	<h4>누구와 함께 하나요?</h4>
    	<div class="icon_box"><img src="../assets/img/juneung/alone.png" class="juneung_icon"/><div class="icon_description text_visible">혼술</div></div>
    	<div class="icon_box"><img src="../assets/img/juneung/lover.png" class="juneung_icon"/><div class="icon_description text_visible">연인과</div></div>
    	<div class="icon_box"><img src="../assets/img/juneung/friends.png" class="juneung_icon"/><div class="icon_description text_visible">친구와</div></div>
    	<div class="icon_box"><img src="../assets/img/juneung/family.png" class="juneung_icon"/><div class="icon_description text_visible">가족과</div></div>
    	<h4>오늘 당신의 기분은?</h4>
    	<div class="icon_box"><img src="../assets/img/juneung/sunny.png" class="juneung_icon"/><div class="icon_description text_visible">맑음</div></div>
    	<div class="icon_box"><img src="../assets/img/juneung/cloudy.png" class="juneung_icon"/><div class="icon_description text_visible">흐림</div></div>
    	<div class="icon_box"><img src="../assets/img/juneung/rainy.png" class="juneung_icon"/><div class="icon_description text_visible">비</div></div>
    	
    </div>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../assets/js/juneung.js" type="text/javascript" charset="utf-8"></script>
</body>

</html>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>