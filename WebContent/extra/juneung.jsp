<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/juneung.css?time=${currentTime}" />

<div id="juneung_content">
    <h1>술학능력시험 - 주(酒)능</h1>

    <form action="" method="get" name="imgradio">

        <h2>나의 최애 주종+안주 조합 고르기</h2>

        <h4>내가 좋아하는 술</h4>
        <label class="icons">
            <input type="radio" name="drink" value="beer" />
            <img src="${contextPath}/assets/img/juneung/beer.png" />
            <span class="icon_description text_visible">맥주</span>
        </label>
        <label class="icons">
            <input type="radio" name="drink" value="soju" />
            <img src="${contextPath}/assets/img/juneung/soju.png" />
            <span class="icon_description text_visible">소주</span>
        </label>
        <label class="icons">
            <input type="radio" name="drink" value="wine">
            <img src="${contextPath}/assets/img/juneung/wine.png">
            <span class="icon_description text_visible">와인</span>
        </label>
        <label class="icons">
            <input type="radio" name="drink" value="ricewine">
            <img src="${contextPath}/assets/img/juneung/ricewine.png">
            <span class="icon_description text_visible">막걸리</span>
        </label>

        <h4>내가 좋아하는 음식</h4>
        <label>
            <input type="radio" name="food" value="meat">
            <img src="${contextPath}/assets/img/juneung/meat.png">
            <span class="icon_description text_visible">고기</span>
        </label>
        <label>
            <input type="radio" name="food" value="fish">
            <img src="${contextPath}/assets/img/juneung/fish.png">
            <span class="icon_description text_visible">생선</span>
        </label>
        <label>
            <input type="radio" name="food" value="fruit">
            <img src="${contextPath}/assets/img/juneung/fruit.png">
            <span class="icon_description text_visible">과일</span>
        </label>
        <label>
            <input type="radio" name="food" value="snack">
            <img src="${contextPath}/assets/img/juneung/snack.png">
            <span class="icon_description text_visible">견과류</span>
        </label>

        <h2>오늘의 술자리 분위기</h2>

        <h4>누구와 함께 하나요?</h4>
        <label>
            <input type="radio" name="people" value="alone">
            <img src="${contextPath}/assets/img/juneung/alone.png">
            <span class="icon_description text_visible">혼술</span>
        </label>
        <label>
            <input type="radio" name="people" value="lover">
            <img src="${contextPath}/assets/img/juneung/lover.png">
            <span class="icon_description text_visible">연인</span>
        </label>
        <label>
            <input type="radio" name="people" value="friends">
            <img src="${contextPath}/assets/img/juneung/friends.png">
            <span class="icon_description text_visible">친구</span>
        </label>
        <label>
            <input type="radio" name="people" value="family">
            <img src="${contextPath}/assets/img/juneung/family.png">
            <span class="icon_description text_visible">가족</span>
        </label>

        <h4>오늘 당신의 기분은?</h4>
        <label>
            <input type="radio" name="mood" value="sunny">
            <img src="${contextPath}/assets/img/juneung/sunny.png">
            <span class="icon_description text_visible">맑음</span>
        </label>
        <label>
            <input type="radio" name="mood" value="cloudy">
            <img src="${contextPath}/assets/img/juneung/cloudy.png">
            <span class="icon_description text_visible">흐림</span>
        </label>
        <label>
            <input type="radio" name="mood" value="rainy">
            <img src="${contextPath}/assets/img/juneung/rainy.png">
            <span class="icon_description text_visible">비</span>
        </label>
    </form>
</div>

<script src="${contextPath}/assets/js/juneung.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>