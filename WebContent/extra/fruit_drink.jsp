<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>과실주</title>
<!-- 크로스 브라우징 호환성 시작 -->
<link rel="stylesheet" type="text/css" href="../assets/css/reset.css" />
<!-- 크로스 브라우징 호환성 끝 -->
<!-- CSS 파일 참조 처리 -->
<link rel="stylesheet" type="text/css" href="../assets/css/common.css" />
<link rel="stylesheet" type="text/css" href="../assets/css/drinks.css" />
</head>

<body>
	<div id="drinks_img">
		<img src="../assets/img/fruit_drink.jpg" class="drinks_img_detail"/> 
		<span id="drinks_name">
			<h1>한국의 다양한 과실주 제품들</h1>
			<h3>
				포도와 머루, 자두, 다래, 사과, 복분자 등으로 제조되는 와인
				<br />한국의 다양한 과실로 전국의 양조장에서 빚어내는 과실주 제품
			</h3> 
			<input type="button" value="과실주 종류별 보기 > " id="go_fruit_drink" class="go_drink_button" />
		</span>
	</div>
	<div id="drinks_content">
		<h2>
			과실주는 과실을 원료로 하여 발효시킨 술이다.
		</h2>
		
		<div>
			과실주는 크게 두 가지 형태, 발효주로서 과실주와 혼성주로서 과실주로 구분할 수 있다.<br /> 
			발효주로서 과실주는 포도, 사과, 배, 복분자 등의 과실을 발효시켜서 만든다. <br />
			혼성주로서의 과실주는 일반증류주나 희석식 소주에 침출시키는 매실주나 모과주 따위를 지칭한다. <br/>
		</div>
		
		<div>
			주세법의 과실주 정의는 <br />
			가) 과실(과일즙과 건조된 과실포함) 또는 과실과 물을 원료로 하여 발효시킨 술덧을 여과, 제성하거나 나무통에 저장한 것.<br /> 
			나) 과실을 주원료로 당분과 물을 혼합하여 발효시킨 것.<br /> 
			다) 가) 또는 나)의 규정에 과실즙을 첨가한 것. <br />
			라) 가) 또는 나)의 규정에 주류 또는 물료를 혼합한 것’으로 규정되어 있다.<br />
		</div>
		
		<div>
			주정이나 증류주를 혼합할 때는, 발효한 과실주의 알코올분 총량이 20% 이상이고, 주정이나 증류주의 알코올분 총량이 80% 이하라야 과실주로 분류한다.
		</div>
	</div>
</body>

</html>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>