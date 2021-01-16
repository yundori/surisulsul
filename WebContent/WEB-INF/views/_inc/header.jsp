<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- JSTL로 변수 생성 --%>
<%-- 1) 캐시를 방지하기 위해 자주 수정되는 css,js 파일에 설정하는 용도 --%>
<c:set var="currentTime" value="<%=System.currentTimeMillis()%>" />
<%-- 2) 프로젝트이름 기반의 절대경로값 --%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>surisulsul</title>
<!-- 크로스 브라우징 호환성 시작 -->
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/reset.css" />
<!-- 크로스 브라우징 호환성 끝 -->
<!-- CSS 파일 참조 처리 -->
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/common.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body link="none" vlink="none" alink="none">
    <div class="header">
        <h1>
            <a href="${contextPath}"><img src="${contextPath}/assets/img/logo1.PNG" alt="로고" /></a>
        </h1>
        <div id="sidebar">
            <div class="menu_bar" onclick="toggleSidebar(this)">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <div class="sidebar_logo">
                <img src="${contextPath}/assets/img/logo1.PNG" alt="사이드바 로고" //>
            </div>
            <div class="list">
                <div class="item"><a href="">인기 많은 술</a></div>
                <div class="item"><a href="">내가 찾는 술</a></div>
                <div class="item"><a href="">우리 술 종류</a></div>
                <div class="item"><a href="${contextPath}/extra/juneung.jsp">주(酒)능</a></div>
                <br />
                <br />
                <br />
                <div class="item"><a href="">알립니다</a></div>
                <div class="item"><a href="">자주 묻는 질문</a></div>
            </div>
        </div>
        <ul class="login_menu">
            <a href="${contextPath}"><li>로그인</li></a>
            <a href="${contextPath}"><li>회원가입</li></a>
            <a href="${contextPath}"><li>장바구니</li></a>
        </ul>
    </div>
    
    <script src="${contextPath}/assets/js/sidebar.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>