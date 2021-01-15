<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>술학능력시험 - 주능</title>
<!-- 크로스 브라우징 호환성 시작 -->
<link rel="stylesheet" type="text/css" href="../assets/css/reset.css" />
<!-- 크로스 브라우징 호환성 끝 -->
<!-- CSS 파일 참조 처리 -->
<link rel="stylesheet" type="text/css" href="../assets/css/common.css" />
<link rel="stylesheet" type="text/css" href="../assets/css/juneung.css" />
</head>

<body>
	<div id="juneung_content">
		<h1>술학능력시험 - 주(酒)능</h1>
		
		<form action="" method="get" name="imgradio">
		
			<h2>나의 최애 주종+안주 조합 고르기</h2>
			
			<h4>내가 좋아하는 술</h4>
			<label class="icons"> 
				<input type="radio" name="drink" value="beer" />
				<img src="../assets/img/juneung/beer.png" />
				<span class="icon_description text_visible">맥주</span>
			</label> 
			<label class="icons"> 
				<input type="radio" name="drink" value="soju"/>
				<img src="../assets/img/juneung/soju.png"/>
				<span class="icon_description text_visible">소주</span>
			</label>
			<label> 
				<input type="radio" name="drink" value="wine">
				<img src="../assets/img/juneung/wine.png">
				<span class="icon_description text_visible">와인</span>
			</label>
			<label> 
				<input type="radio" name="drink" value="ricewine">
				<img src="../assets/img/juneung/ricewine.png">
				<span class="icon_description text_visible">막걸리</span>
			</label>
			
			<h4>내가 좋아하는 음식</h4>
			<label> 
				<input type="radio" name="food" value="meat">
				<img src="../assets/img/juneung/meat.png">
				<span class="icon_description text_visible">고기</span>
			</label> 
			<label> 
				<input type="radio" name="food" value="fish">
				<img src="../assets/img/juneung/fish.png">
				<span class="icon_description text_visible">생선</span>
			</label>
			<label> 
				<input type="radio" name="food" value="fruit">
				<img src="../assets/img/juneung/fruit.png">
				<span class="icon_description text_visible">과일</span>
			</label>
			<label> 
				<input type="radio" name="food" value="snack">
				<img src="../assets/img/juneung/snack.png">
				<span class="icon_description text_visible">견과류</span>
			</label>
			
			<h2>오늘의 술자리 분위기</h2>
			
			<h4>누구와 함께 하나요?</h4>
			<label> 
				<input type="radio" name="people" value="alone">
				<img src="../assets/img/juneung/alone.png">
				<span class="icon_description text_visible">혼술</span>
			</label> 
			<label> 
				<input type="radio" name="people" value="lover">
				<img src="../assets/img/juneung/lover.png">
				<span class="icon_description text_visible">연인</span>
			</label>
			<label> 
				<input type="radio" name="people" value="friends">
				<img src="../assets/img/juneung/friends.png">
				<span class="icon_description text_visible">친구</span>
			</label>
			<label> 
				<input type="radio" name="people" value="family">
				<img src="../assets/img/juneung/family.png">
				<span class="icon_description text_visible">가족</span>
			</label>
			
			<h4>오늘 당신의 기분은?</h4>
			<label> 
				<input type="radio" name="mood" value="sunny">
				<img src="../assets/img/juneung/sunny.png">
				<span class="icon_description text_visible">맑음</span>
			</label>
			<label> 
				<input type="radio" name="mood" value="cloudy">
				<img src="../assets/img/juneung/cloudy.png">
				<span class="icon_description text_visible">흐림</span>
			</label>
			<label> 
				<input type="radio" name="mood" value="rainy">
				<img src="../assets/img/juneung/rainy.png">
				<span class="icon_description text_visible">비</span>
			</label>
		</form>
	</div>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="../assets/js/juneung.js" type="text/javascript" charset="utf-8"></script>
</body>

</html>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>