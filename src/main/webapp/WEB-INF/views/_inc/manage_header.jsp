<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>수리술술 관리자 페이지</title>
<!-- 크로스 브라우징 호환성 시작 -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/reset.css" />
<!-- 크로스 브라우징 호환성 끝 -->
<!-- 모바일 아이콘 지원 -->
<link rel="shortcut icon" href="${contextPath}/assets/img/favicon.png" />
<link rel="icon" href="${contextPath}/assets/img/favicon.png" />
<!-- CSS 파일 참조 처리 -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/common.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>

<body link="none" vlink="none" alink="none">
	<div class="header">
		<h1>
			<a href="${pageContext.request.contextPath}/manage_home.do"> <img
				src="${contextPath}/assets/img/logo.png" alt="로고" /></a>
		</h1>
		<input type="checkbox" id="check"> <label for="check">
			<i class="fas fa-bars" id="btn"></i> <i class="fas fa-times"
			id="cancel"></i>
		</label>
		<div class="sidebar">
			<h1>
				<img src="${contextPath}/assets/img/logo.png" alt="사이드바 로고" />
			</h1>
			<ul>
				<li><a href="${pageContext.request.contextPath}/manage_home.do">오늘의 알림</a></li>
				<li class="drink_type"><a href="#">쇼핑몰 관리</a></li>
					<div class="drink_inner">
						<li><a href="${pageContext.request.contextPath}/manage_members.do">회원관리</a></li>
						<li><a href="${pageContext.request.contextPath}/manage_itemlist.do">상품관리</a></li>
						<li><a href="${pageContext.request.contextPath}/manage_question.do">상품 문의관리</a></li>
						<li><a href="${pageContext.request.contextPath}/manage_review.do">상품 후기관리</a></li>
						<li><a href="${pageContext.request.contextPath}/manage_orders.do">주문내역</a></li>
						<li><a href="${pageContext.request.contextPath}/uncmpl_orders.do">미완료 주문</a></li>
						<li><a href="${pageContext.request.contextPath}/manage_cscenter.do">고객센터 관리</a></li>
					</div>	
				<li class="drink_type1"><a href="#">쇼핑몰 현황</a></li>
					<div class="drink_inner1">
						<li><a href="${pageContext.request.contextPath}/manage_sales.do">매출 현황</a></li>
						<li><a href="${pageContext.request.contextPath}/manage_best_itemlist.do">상품 판매순위</a></li>
						<li><a href="${pageContext.request.contextPath}/manage_wishlist.do">위시리스트 관리</a></li>
					</div>
				<li><a href="${pageContext.request.contextPath}/">사용자 페이지</a></li>
				</ul>
			</div>
		</div>

	<script src="${contextPath}/assets/js/sidebar.js?time=${currentTime}"
		type="text/javascript" charset="utf-8"></script>