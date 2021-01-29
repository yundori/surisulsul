<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

    <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/cscenter.css?time=${currentTime}" />
<div class="collapse">
    <%--c:when test 조건 -> 관리자 페이지에서 작성한 게시글 목록이 있을 경우 불러오기 --%>
        <!--<c:forEach var="i" begin="${first }" end="${last }" varStatus="status">-->
        <div class='collapse-item'>
            <div class="collapse-title clearfix">
                <span class="article-number">4</span>
                <a href="#faq-content1">대량 주문도 가능한가요?</a>
                <span class="reg-date">2020-01-06</span>
            </div>
            <div id="faq-content1" class="content">제목4에 해당하는 내용입니다.</div>
        </div>
        <div class='collapse-item'>
            <div class="collapse-title clearfix">
                <span class="article-number">3</span>
                <a href="#faq-content2">비밀번호를 잊어버렸어요. 어떻게 찾을 수 있나요?</a>
                <span class="reg-date">2020-01-06</span>
            </div>
            <div id="faq-content2" class="content">제목3에 해당하는 내용입니다.</div>
        </div>
        <div class='collapse-item'>
            <div class="collapse-title clearfix">
                <span class="article-number">2</span>
                <a href="#faq-content3">교환 / 반품 기준이 어떻게 되나요?</a>
                <span class="reg-date">2020-01-06</span>
            </div>
            <div id="faq-content3" class="content">제목2에 해당하는 내용입니다.</div>
        </div>
        <div class='collapse-item'>
            <div class="collapse-title clearfix">
                <span class="article-number">1</span>
                <a href="#faq-content4">취소는 어떻게 하나요?</a>
                <span class="reg-date">2020-01-06</span>
            </div>
            <div id="faq-content4" class="content">제목1에 해당하는 내용입니다.</div>
        </div>
        <!--</c:forEach>-->
        <!-- 게시글이 많다면 페이지네이션 -->
    </div>
