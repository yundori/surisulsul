<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/mypage_detail.css?time=${currentTime}" />

<div class="psn_wishlist">

	<c:choose>
		<%--c:when test 조건 -> 관심있어요 누른 상품이 있는 경우 -> DB 내용 존재 --%>
		<c:when test="true">

			<div class="psn_title">
				<h2 class="psn_title_txt">나의 관심 술</h2>
				<h3 class="psn_title_dsc">User_name님의 "관심있어요" 술입니다:)</h3>
			</div>
</div>

<div class="psn_result swiper-container">
	<ul class="psn_result_inner swiper-wrapper">
		<!--<c:forEach var="i" begin="${first }" end="${last }" varStatus="status">-->
		<li class="pick_item swiper-slide"><a href="#" class="pick_link">
				<span class="psn_pick_bg psn_pick1"></span> <span
				class="psn_pick_text">
					<h3 class="psn_pick_title">상품명</h3>
					<p class="psn_pick_price">00,000원</p>
			</span>
		</a></li>
		<li class="pick_item swiper-slide"><a href="#" class="pick_link">
				<span class="psn_pick_bg psn_pick2"></span> <span
				class="psn_pick_text">
					<h3 class="psn_pick_title">상품명</h3>
					<p class="psn_pick_price">00,000원</p>
			</span>
		</a></li>
		<li class="pick_item swiper-slide"><a href="#" class="pick_link">
				<span class="psn_pick_bg psn_pick3"></span> <span
				class="psn_pick_text">
					<h3 class="psn_pick_title">상품명</h3>
					<p class="psn_pick_price">00,000원</p>
			</span>
		</a></li>
		<li class="pick_item swiper-slide"><a href="#" class="pick_link">
				<span class="psn_pick_bg psn_pick4"></span> <span
				class="psn_pick_text">
					<h3 class="psn_pick_title">상품명</h3>
					<p class="psn_pick_price">00,000원</p>
			</span>
		</a></li>
		<li class="pick_item swiper-slide"><a href="#" class="pick_link">
				<span class="psn_pick_bg psn_pick1"></span> <span
				class="psn_pick_text">
					<h3 class="psn_pick_title">상품명</h3>
					<p class="psn_pick_price">00,000원</p>
			</span>
		</a></li>
		<li class="pick_item swiper-slide"><a href="#" class="pick_link">
				<span class="psn_pick_bg psn_pick2"></span> <span
				class="psn_pick_text">
					<h3 class="psn_pick_title">상품명</h3>
					<p class="psn_pick_price">00,000원</p>
			</span>
		</a></li>
		<li class="pick_item swiper-slide"><a href="#" class="pick_link">
				<span class="psn_pick_bg psn_pick3"></span> <span
				class="psn_pick_text">
					<h3 class="psn_pick_title">상품명</h3>
					<p class="psn_pick_price">00,000원</p>
			</span>
		</a></li>
		<li class="pick_item swiper-slide"><a href="#" class="pick_link">
				<span class="psn_pick_bg psn_pick4"></span> <span
				class="psn_pick_text">
					<h3 class="psn_pick_title">상품명</h3>
					<p class="psn_pick_price">00,000원</p>
			</span>
		</a></li>
		<li class="pick_item swiper-slide"><a href="#" class="pick_link">
				<span class="psn_pick_bg psn_pick1"></span> <span
				class="psn_pick_text">
					<h3 class="psn_pick_title">상품명</h3>
					<p class="psn_pick_price">00,000원</p>
			</span>
		</a></li>
	!--</c:forEach>-->
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
		<img src="${contextPath}/assets/img/mark_alert.png" />
		<h3 class="psn_title_dsc">아직 관심있어요를 누른 상품이 없습니다.
		<br/>
		<span class="psn_gotest">관심있는 상품을 찜해두면 편하게 확인할 수 있습니다.</span></h3>
		<a href="${contextPath}/items/item_filtered.jsp" class="btn_blue">관심있는
			상품 담으러 가기</a>
		<%--나중에 윗 줄 <a> 주소 수정 --%>
	</div>

</c:otherwise>
</c:choose>


<script src="${contextPath}/assets/js/wishlist.js?time=${currentTime}"
	type="text/javascript" charset="utf-8"></script>
