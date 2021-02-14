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

<div class="psn_wishlist">

	<c:choose>
		<%--c:when test 조건 -> 관심있어요 누른 상품이 있는 경우 -> DB 내용 존재 --%>
		<c:when test="${wishlist }">

			<div class="psn_title">
				<h2 class="psn_title_txt">나의 관심 술</h2>
				<h3 class="psn_title_dsc">${output.name }님의 "관심있어요" 술입니다:)</h3>
			</div>
</div>

<div class="psn_result swiper-container">
	<ul class="psn_result_inner swiper-wrapper">
		
		<%--조회 결과에 따른 반복처리 --%>
		<c:forEach var="item" items="${member_product }" varStatus="status">
		<li class="pick_item swiper-slide">
		
		<%--상세 페이지로 이동하는 URL --%>
		<c:url value="/item_details.do" var="viewUrl">
			<c:param name="prodid" value="${item.id}" />
		</c:url>
		
			<a href="${viewUrl}" class="pick_link"> 
				<span class="psn_pick_bg">
					<img class="psn_pick" src="${contextPath}/assets/img/items/${item.img}">
				</span> 
				<span class="psn_pick_text">
					<h3 class="psn_pick_title">${item.name}</h3>
					<p class="psn_pick_price"><fmt:formatNumber value="${item.price}" pattern="#,###"/>원</p>
			</span>
		</a></li>
		
		</c:forEach>
	</ul>
	<!-- Add Pagination -->
	<div class="swiper-pagination"></div>
	<!-- Add Arrows -->
	<div class="swiper-button-next"></div>
	<div class="swiper-button-prev"></div>
</div>
</c:when>

<%--c:otherwise --> 관심있어요 누른 상품이 없는 경우 -> DB에 데이터 X --%>
<c:otherwise>
	<div class="psn_title">
		<h2 class="psn_title_txt">나의 관심 술</h2>
	</div>
	</div>
	<div class="psn_no_result">
		<img src="${pageContext.request.contextPath}/assets/img/mark_alert.png" />
		<h3 class="psn_title_dsc">아직 관심있어요를 누른 상품이 없습니다.
		<br/>
		<span class="psn_gotest">관심있는 상품을 찜해두면 관련 할인 정보를 빠르게 확인할 수 있습니다.</span></h3>
		<a href="${pageContext.request.contextPath}/item_filtered.do" class="btn_blue">관심있는
			상품 담으러 가기</a>
		<%--나중에 윗 줄 <a> 주소 수정 --%>
	</div>

</c:otherwise>
</c:choose>

<script src="${contextPath}/assets/js/wishlist.js?time=${currentTime}"
	type="text/javascript" charset="utf-8"></script>