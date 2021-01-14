<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>기타주류</title>
<!-- 크로스 브라우징 호환성 시작 -->
<link rel="stylesheet" type="text/css" href="../assets/css/reset.css" />
<!-- 크로스 브라우징 호환성 끝 -->
<!-- CSS 파일 참조 처리 -->
<link rel="stylesheet" type="text/css" href="../assets/css/common.css" />
<link rel="stylesheet" type="text/css" href="../assets/css/drinks.css" />
</head>

<body>
<div id="content">
	<div id="drinks_img">
		<img src="../assets/img/extra_drink.jpg" class="drinks_img_detail"/> 
		<span id="drinks_name">
			<h1>한국의 대표적인 리큐르/기타주류</h1>
			<h3>인삼주와 매실주와 오카피주 등은 리큐르로 분류,<br/>
				기타주류에는 1호 주정, 2호 발효주류, 3호 증류주류에 속하지 않은 술이다.​</h3> 
			<input type="button" value="기타주류 종류별 보기 > " id="go_liquerurs" class="go_drink_button" />
		</span>
	</div>
	<div id="drinks_content">
		<h2>
			리큐르(Liqueur)는 라틴어 리케파세페(Liquefacere=녹아들다)에서 유래된 프랑스어 
		</h2>
		
		<div>
			우리나라 주세법에서는 고량주, 럼, 보드카 진, 위스키형 기타 제제주를 일반증류주로, 인삼주와 매실주와 오카피주 등은 리큐르로 분류하였다.
		</div>
		<br/>
		<div>
			일반증류주와 리큐르의 경계는 술 속에 포함된 엑스분(술을 증발시켰을 때 증발하지 않고 남아있는 성분)이 2% 이상이면 리큐르, 2% 미만이면 일반 증류주로 분류한다.<br/>
			인삼 증류주라 하더라도 엑스분 2%의 경계에 따라, 리큐르 인삼주와 일반 증류주 인삼주로 갈린다.<br/>
		</div>
		<br/>
		<div>
			주세법에 기타주류는 주세법으로 구분하고 있는 1호 주정, 2호 발효주류, 3호 증류주류에 속하지 않은 술이다.
		</div>
		<br/>
		<div>
			좀 더 구체적으로는, <br/>
			① 알코올분 1도 이상의 음료로 할 수 있는 가루 술,<br/> 
			② 발효에 의하여 제성한 주류로서 주세법상 발효주류에 속하지 않은 술,<br/> 
			③ 쌀 및 입국에 주정을 첨가해서 여과한 것 또는 이에 대통령령으로 정하는 재료를 첨가하여 여과한 술,<br/> 
			④ 발효에 의한 주류와 주정 또는 증류주류에 따른 주류를 섞은 것으로서 주세법상의 발효주류에 속하지 않은 술,<br/> 
			⑤ 그밖에 어떤 규정에서도 속하지 않은 술을 지칭한다.<br/>
		</div>		
		
	</div>
	</div>
</body>

</html>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>