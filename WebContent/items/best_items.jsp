<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>수리술술</title>
    <!-- 크로스 브라우징 호환성 시작 -->
    <link rel="stylesheet" type="text/css" href="../assets/css/reset.css" />
    <!-- 크로스 브라우징 호환성 끝 -->
    <link rel="apple-touch-icon" href="img/icon.png" />
    <!-- CSS 파일 참조 처리 -->
    <link rel="stylesheet" type="text/css" href="../assets/css/common.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/best_items.css" />
<meta charset="UTF-8" />
<title>수리술술</title>
<!-- 크로스 브라우징 호환성 시작 -->
<link rel="stylesheet" type="text/css" href="../assets/css/reset.css" />
<!-- 크로스 브라우징 호환성 끝 -->
<link rel="apple-touch-icon" href="img/icon.png" />
<!-- CSS 파일 참조 처리 -->
<link rel="stylesheet" type="text/css" href="../assets/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="../assets/css/best_items.css" />
</head>

<body>
	<div class="best_items">
		<span class="title">인기 많은 술 <span class="comment">회원분들이
				자주 찾는 인기 상품입니다.</span></span>
		<ul>
			<li class="best_item">
				<a href="#">
					<img src="../assets/img/best1.PNG" /> <br/>
					<span class="item_title">상품명abcdefghijklmnop</span>
					<span class="item_price">00,000 원</span> <br/>
                    <div class="clean"></div>
					<span class="item_rating">★★★★☆</span> <br/>
					<ul>
						<li class="item_tag item_type_tag">#종류</li>
						<li class="item_tag item_area_tag">#지역</li>
						<li class="item_tag item_keyword_tag">#키워드</li>
					</ul>
			</a></li>
			<li class="best_item">
				<a href="#">
					<img src="../assets/img/best2.PNG"/> <br/>
                    <span class="item_title">상품명</span>
					<span class="item_price">00,000 원</span> <br/>
					<div class="clean"></div>
					<span class="item_rating">★★★★☆</span> <br/>
					<span class="item_tag item_type_tag">#종류</span>
					<span class="item_tag item_area_tag">#지역</span>
					<span class="item_tag item_keyword_tag">#키워드</span>
				</a>
			</li>
			<li class="best_item">
				<a href="#">
					<img src="../assets/img/best3.PNG" /> <br/>
					<span class="item_title">상품명</span>
					<span class="item_price">000,000 원</span> <br/>
					<div class="clean"></div>
					<span class="item_rating">★★★★☆</span> <br/>
					<span class="item_tag item_type_tag">#종류</span>
					<span class="item_tag item_area_tag">#지역</span>
					<span class="item_tag item_keyword_tag">#키워드</span>
				</a>
			</li>
			<li class="best_item">
				<a href="#">
					<img src="../assets/img/best4.PNG" /> <br/>
					<span class="item_title">상품명</span>
					<span class="item_price">00,000 원</span> <br/>
					<div class="clean"></div>
					<span class="item_rating">★★★★☆</span> <br/>
					<span class="item_tag item_type_tag">#종류</span>
					<span class="item_tag item_area_tag">#지역</span>
					<span class="item_tag item_keyword_tag">#키워드</span>
				</a>
			</li>
		</ul>
		<div class="clean"></div>
	</div>

</body>

</html>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>