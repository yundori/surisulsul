<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/item_reviews,question.css?time=${currentTime}" />

<div class="item_reviews">
	<div>
		<h3 class="title">이 술을 선택한 사람들의 이야기 <span>내가 찾은 술에 대한 후기는 어떨까?</span></h3>
		<c:choose>
		<c:when test="true">
		<table>
		<%-- <forEach var="i" begin="0" end="select 데이터 수" varStatus="status" > --%>
			<tr>
				<td class="img_area">
					<%-- <c:choose> --%>
					<%-- <c:when 사진 db있으면 해당 사진 노출> --%>
					<img class="review_img" src="../assets/img/items/best1.PNG" />
					<%-- </c:if> --%>
					<%-- <c:otherwise 없으면 디폴트 이미지 사용> --%>
					<%-- </c:otherwise> --%>
					<%-- </c:choose> --%>
				</td>
				<td class="content_area">
					<h3 class="content_title">너무 맛있어요!!!</h3>
					<h4 class="content_item">고도리 복숭아 와인</h4>
					<div class="content_text">
						자연스러운 단맛 새콤함이 더 올라오고 복숭아 통조림처럼 걸쭉한 느낌인데 삼킬때는 맑은 느낌 디저트와인으로 제격입니다.
						달큰하고 도수가 낮아 쉽게 접근할 수 있습니다. 목넘김과 함께 산미가 남아 너무 들척지근하지도 않고 산뜻하게 마실 수 있는 술입니다.
						분위기 있는 장소나 가벼운 홈파티까지 다 어울립니다.
					</div>
				</td>
				<td class="userinfo_area">
					<h4 class="user_id_filter">suri****</h4>
					<h4 class="reivew_date">2021.01.20</h4>
					<h4 class="review_rating_text">평점</h4>
					<h4 class="review_rating">★★★☆☆</h4>
				</td>
			</tr>
			<tr>
				<td class="img_area">
					<img class="review_img" src="../assets/img/items/best1.PNG" />
				</td>
				<td class="content_area">
					<h3 class="content_title">복숭아 향이 좋아요!</h3>
					<h4 class="content_item">고도리 복숭아 와인</h4>
					<div class="content_text">
						자연스러운 단맛 새콤함이 더 올라오고 복숭아 통조림처럼 걸쭉한 느낌인데 삼킬때는 맑은 느낌 디저트와인으로 제격입니다.
						달큰하고 도수가 낮아 쉽게 접근할 수 있습니다. 목넘김과 함께 산미가 남아 너무 들척지근하지도 않고 산뜻하게 마실 수 있는 술입니다.
						분위기 있는 장소나 가벼운 홈파티까지 다 어울립니다.
					</div>
				</td>
				<td class="userinfo_area">
					<h4 class="user_id_filter">sulsul****</h4>
					<h4 class="reivew_date">2021.01.19</h4>
					<h4 class="review_rating_text">평점</h4>
					<h4 class="review_rating">★★★★★</h4>
				</td>
			</tr>
		</table>
		<%-- </c:forEach> --%>
		</c:when>
		<c:otherwise>
			<hr />
			<div class="review_none">
				<img src="../assets/img/order/order_fail.png" />
				<h1>상품 후기가 없습니다.</h1>
			</div>
		</c:otherwise>
		</c:choose>
		<%-- 페이지네이션 영역 --%>
	</div>
</div>
