<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/mypage_detail.css?time=${currentTime}" />
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<div class="psn_wishlist">
	<div class="psn_title">
		<h2 class="psn_title_txt">나의 관심 술</h2>
		<h3 class="psn_title_dsc">User_name님의 "관심있어요" 술입니다:)</h3>
	</div>
</div>

<div class="psn_result swiper-container">
	<ul class="psn_result_inner swiper-wrapper">
		<li class="pick_item swiper-slide">
			<a href="#" class="pick_link">
			<span class="psn_pick_bg psn_pick1"></span>
			<span class="psn_pick_text">
			<h3 class="psn_pick_title">
			상품명
			</h3>
			<p class="psn_pick_price">
			00,000원
			</p>
			</span>
			</a>	
		</li>
		<li class="pick_item swiper-slide">
			<a href="#" class="pick_link">
			<span class="psn_pick_bg psn_pick2"></span>
			<span class="psn_pick_text">
			<h3 class="psn_pick_title">
			상품명
			</h3>
			<p class="psn_pick_price">
			00,000원
			</p>
			</span>
			</a>	
		</li>
		<li class="pick_item swiper-slide">
			<a href="#" class="pick_link">
			<span class="psn_pick_bg psn_pick3"></span>
			<span class="psn_pick_text">
			<h3 class="psn_pick_title">
			상품명
			</h3>
			<p class="psn_pick_price">
			00,000원
			</p>
			</span>
			</a>	
		</li>
		<li class="pick_item swiper-slide">
			<a href="#" class="pick_link">
			<span class="psn_pick_bg psn_pick4"></span>
			<span class="psn_pick_text">
			<h3 class="psn_pick_title">
			상품명
			</h3>
			<p class="psn_pick_price">
			00,000원
			</p>
			</span>
			</a>	
		</li>
		<li class="pick_item swiper-slide">
			<a href="#" class="pick_link">
			<span class="psn_pick_bg psn_pick1"></span>
			<span class="psn_pick_text">
			<h3 class="psn_pick_title">
			상품명
			</h3>
			<p class="psn_pick_price">
			00,000원
			</p>
			</span>
			</a>	
		</li>
		<li class="pick_item swiper-slide">
			<a href="#" class="pick_link">
			<span class="psn_pick_bg psn_pick2"></span>
			<span class="psn_pick_text">
			<h3 class="psn_pick_title">
			상품명
			</h3>
			<p class="psn_pick_price">
			00,000원
			</p>
			</span>
			</a>	
		</li>
		<li class="pick_item swiper-slide">
			<a href="#" class="pick_link">
			<span class="psn_pick_bg psn_pick3"></span>
			<span class="psn_pick_text">
			<h3 class="psn_pick_title">
			상품명
			</h3>
			<p class="psn_pick_price">
			00,000원
			</p>
			</span>
			</a>	
		</li>
		<li class="pick_item swiper-slide">
			<a href="#" class="pick_link">
			<span class="psn_pick_bg psn_pick4"></span>
			<span class="psn_pick_text">
			<h3 class="psn_pick_title">
			상품명
			</h3>
			<p class="psn_pick_price">
			00,000원
			</p>
			</span>
			</a>	
		</li>
		</ul>
		<!-- Add Pagination -->
	<div class="swiper-pagination"></div>
	<!-- Add Arrows -->
	<div class="swiper-button-next"></div>
	<div class="swiper-button-prev"></div>
	</div>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="${contextPath}/assets/js/wishlist.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>