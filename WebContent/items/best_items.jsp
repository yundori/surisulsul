<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>수리술술</title>
    <!-- 크로스 브라우징 호환성 시작 -->
    <link rel="stylesheet" type="text/css" href="css/reset.css" />
    <!-- 크로스 브라우징 호환성 끝 -->
    <link rel="apple-touch-icon" href="img/icon.png" />
    <!-- CSS 파일 참조 처리 -->
    <link rel="stylesheet" type="text/css" href="../assets/css/common.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/best_items.css" />
</head>

<body>
    <h1>인기 많은 술</h1>
    <h3>회원분들이 자주 찾는 인기 상품입니다.</h3>
    <ul>
        <li class="best_item">
            <a href="#">
                <img src="../assets/img/best.png">
                <h3 class="item_title">상품명</h3>
                <h4 class="item_price">00,000 원</h4>
                <h3 class="item_rating">★★★★☆</h3>
                <span class="item_type_tag">#종류</span>
                <span class="item_area_tag">#지역</span>
                <span class="item_keyword_tag">#키워드</span>
            </a>
        </li>
        <li class="best_item">
            <a href="#">
                <img src="../assets/img/best2.PNG">
                <h3 class="item_title">상품명</h3>
                <h4 class="item_price">00,000 원</h4>
                <h3 class="item_rating">★★★★☆</h3>
                <span class="item_type_tag">#종류</span>
                <span class="item_area_tag">#지역</span>
                <span class="item_keyword_tag">#키워드</span>
            </a>
        </li>
        <li class="best_item">
            <a href="#">
                <img src="../assets/img/best3.PNG">
                <h3 class="item_title">상품명</h3>
                <h4 class="item_price">00,000 원</h4>
                <h3 class="item_rating">★★★★☆</h3>
                <span class="item_type_tag">#종류</span>
                <span class="item_area_tag">#지역</span>
                <span class="item_keyword_tag">#키워드</span>
            </a>
        </li>
        <li class="best_item">
            <a href="#">
                <img src="../assets/img/best4.PNG">
                <h3 class="item_title">상품명</h3>
                <h4 class="item_price">00,000 원</h4>
                <h3 class="item_rating">★★★★☆</h3>
                <span class="item_type_tag">#종류</span>
                <span class="item_area_tag">#지역</span>
                <span class="item_keyword_tag">#키워드</span>
            </a>
        </li>
    </ul>
</body>

</html>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>