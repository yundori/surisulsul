<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/item_details.css?time=${currentTime}" />

<div class="item_details">
	<%-- <c:choose> --%>
		<%-- <c:when PK값 맞으면> --%>
		
	<span class="title">상품 상세</span>
	<div class="item_detail">
		<div class="item_detail_infos">
			<img class="item_img" src="../assets/img/items/best1.PNG" />
			<div class="item_detail_info">
				<h3 class="item_name">고도리 복숭아와인</h3>
			 	<h5 class="item_plain_info">제품 간략 설명(1줄 내외)</h5>
			 	<h5 class="item_ingre">원재료 : 무엇무엇(주재료, %)</h5>
			 	<h5 class="item_period">예상 배송 기간 : n일</h5>
			 	<h5 class="item_price_text">판매가격</h5>
			 	<h4 class="item_price">00,000원</h4>
			 	<h5 class="item_rating_text">소비자 평점</h5>
			 	<h4 class="item_rating">★★★★☆</h4>
			</div>
		</div>
		<div class="order_info">
			<form>
			<h3 class="order_title">주문 안내</h3>
			<h4 class="order_item_name">제품명 : <span>고도리 복숭아와인</span></h4>
			<h4 class="order_item_price">개당 판매가 : <span>00,000원</span></h4>
			<label class="order_quantity_label" for="order_quantity">주문 수량 : </label>
			<select name="order_quantity" id="order_quantity">
				<option>수량 선택</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select> <br />
			<label class="total_price_label">총 주문 가격 : </label>
			<input type="text" name="total_price" class="total_price" placeholder="자동 입력" disabled/> <br />
			<div class="order_btn">
				<a class="btn_cart">장바구니 담기</a>
				<a class="btn_order">바로 주문하기</a>
			</div>
		</form>
		</div>
		<div class="clear"></div>
	</div>
	
	<div class="item_menu">
		<button class="info_menu tab_menu">상품 정보</button>
		<button class="review_menu tab_menu">상품 후기</button>
		<button class="quest_menu tab_menu">상품 문의</button>
		<div class="content">
		<%@ include file="item_info.jsp"%>
		<%@ include file="item_reviews.jsp"%>
		<%@ include file="item_question.jsp"%>
		</div>
	</div>
	
	<div class="item_details_footer">
		<img src="../assets/img/items/btn_top.png" class="btn_top" />
	</div>
	
	<%-- </c:when> --%>
	<%-- </c:choose> --%>
</div>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	/** top버튼 구현 **/
	$(function() {
	    $(window).scroll(function() {
	        if ($(this).scrollTop() > 200) {
	            $('.btn_top').fadeIn();
	        } else {
	            $('.btn_top').fadeOut();
	        }
	    });
	    /* 클릭 시 최상단으로 올라가도록 구현 */
	    $('.btn_top').click(function() {
	        $('html, body').animate({
	            scrollTop: 0
	        }, 400);
	        return false;
	    });
	});
</script>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>