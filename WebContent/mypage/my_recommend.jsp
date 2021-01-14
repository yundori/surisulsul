<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<!doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>나를 위한 추천 술</title>
<!-- 크로스 브라우징 호환성 시작 -->
<link rel="stylesheet" type="text/css" href="../assets/css/reset.css" />
<!-- 크로스 브라우징 호환성 끝 -->

<!-- CSS 파일 참조 처리 -->
<link rel="stylesheet" type="text/css" href="../assets/css/common.css" />
<link rel="stylesheet" type="text/css" href="../assets/css/mypage_detail.css" />

</head>

<body>
<div class="psn_recommend">
	<div class="psn_title">
		<h2 class="psn_title_txt">나의 주(酒)능 결과 : Flower_type</h2>
		<h3 class="psn_title_dsc">Drink_type 을 좋아하는 당신을 위해 추천하는 술</h3>
		<div class="psn_keyword">
			<a class="psn_keyword1" href=#>#keyword1</a>
			<a class="psn_keyword2" href=#>#keyword2</a>
			<a class="psn_keyword3" href=#>#keyword3</a>
			<a class="psn_keyword4" href=#>#keyword4</a>
		</div>
	</div>
	
	<div class="psn_result">
	<ul class="psn_result_inner">
		<li class="pick_item psn_pick1">
			<a href="#" class="pick1">
			<span class="psn_pick_title">
			상품명
			</span>
			<br/>
			<span class="psn_pick_price">
			00,000원
			</span>
			</a>	
		</li>
		<li class="pick_item psn_pick2">
			<a href="#" class="pick2">
			<span class="psn_pick_title">
			상품명
			</span>
			<br/>
			<span class="psn_pick_price">
			00,000원
			</span>
			</a>	
		</li>
		<li class="pick_item psn_pick3">
			<a href="#" class="pick3">
			<span class="psn_pick_title">
			상품명
			</span>
			<br/>
			<span class="psn_pick_price">
			00,000원
			</span>
			</a>	
		</li>
		<li class="pick_item psn_pick4">
			<a href="#" class="pick4">
			<span class="psn_pick_title">
			상품명
			</span>
			<br/>
			<span class="psn_pick_price">
			00,000원
			</span>
			</a>	
		</li>
		</ul>
	</div>
</div>
</body>

</html>
