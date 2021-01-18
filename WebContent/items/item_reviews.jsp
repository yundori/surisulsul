<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/item_reviews.css?time=${currentTime}" />

<div class="item_reviews">
	<div>
		<h3>이 술을 선택한 사람들의 이야기 <span>내가 찾은 술에 대한 후기는 어떨까?</span></h3>
		<ul>
			<li>
				<img class="review_img" src="../assets/img/items/best1.PNG" />
				<div class="review_content">
					<h3 class="review_title">후기 제목</h3>
					<h4 class="review_item_name">상품명</h3>
					<p class="review_text">
						자연스러운 단맛 새콤함이 더 올라오고 복숭아 통조림처럼 걸쭉한 느낌인데 삼킬때는 맑은 느낌 디저트와인으로 제격입니다.
						달큰하고 도수가 낮아 쉽게 접근할 수 있습니다. 목넘김과 함께 산미가 남아 너무 들척지근하지도 않고 산뜻하게 마실 수 있는 술입니다.
						분위기 있는 장소나 가벼운 홈파티까지 다 어울립니다.
					</p>
				</div>
				<div class="review_user">
					<h4 class="user_id">작성자 아이디(필터링)</h4>
					<h4 class="review_date">작성 일자</h4>
					<h4 class="review_rating_text">평점</h4>
					<h4 class="review_rating">★★★☆☆</h4>
				</div>
			</li>
		</ul>		
	</div>
</div>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>