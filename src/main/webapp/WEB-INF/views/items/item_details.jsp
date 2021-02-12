<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/item_details.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/item_info.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/item_reviews,question.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.css" />

<div class="item_details">
	<%-- <c:choose> --%>
		<%-- <c:when PK값 맞으면> --%>
		
	<span class="title">상품 상세</span>
	<div class="item_detail">
		<div class="item_detail_infos">
			<button type="button" id="wishlist_btn" class="wishlist_btn"></button>
			<img class="item_img" src="${contextPath}/assets/img/items/${output.img}" />
			<div class="item_detail_info">
				<h3 class="item_name">${output.name}</h3>
			 	<h5 class="item_plain_info">${output.des1}</h5>
			 	<h5 class="item_ingre">원재료 : ${output.igd}</h5>
			 	<h5 class="item_plain_info">용량 : ${output.size}ml (개당)</h5>
			 	<h5 class="item_period">예상 배송 기간 : 2일</h5>
			 	<h5 class="item_price_text">판매가격</h5>
			 	<h4 class="item_price"><fmt:formatNumber value="${output.price}" pattern="#,###"/>원</h4>
			 	<h5 class="item_rating_text">소비자 평점</h5>
			 	<h4 class="item_rating">
			 		<c:set var="stars" value="${output.star}" />
					<c:choose>
						<c:when test="${stars != 0}">
							<c:forEach var="i" begin="1" end="${stars}">★</c:forEach>
							<c:if test="${stars} < 5">
								<c:forEach var="j" begin="${stars}" end="5">☆</c:forEach>
							</c:if>
						</c:when>
						<c:otherwise>☆☆☆☆☆</c:otherwise>
					</c:choose>
			 	</h4>
			</div>
		</div>
		<div class="order_info">
			<form method="post" action="${pageContext.request.contextPath}/basket/add_ok.do" name="basket_form" id="basket_form">
				<input type="hidden" name="p_id" value="${output.id}"/>
				<input type="hidden" name="p_name" value="${output.name}"/>
				<input type="hidden" name="p_price" value="${output.price}"/>
				
				<h3 class="order_title">주문 안내</h3>
				<h4 class="order_item_name">제품명 : <span>${output.name}</span></h4>
				<h4 class="order_item_price">개당 판매가 : <span><fmt:formatNumber value="${output.price}" pattern="#,###"/></span>원</h4>
				<label class="order_quantity_label" for="order_quantity">주문 수량 : </label>
				<select name="order_quantity" id="order_quantity">
					<option value="0">수량 선택</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select> <br />
				<label class="total_price_label">총 주문 가격 : </label>
				<input type="text" name="total_price" class="total_price" placeholder="자동 입력" disabled/> <br />
				<div class="btn_div">
					<button type="submit" class="order_btn" >장바구니 담기</button>
				</div>
			</form>
		</div>
		<div class="clear"></div>
	</div>
	
	<div class="item_menu">
		<button data-tab="item_info" class="info_menu tab_menu" id="default">상품 정보</button>
		<button data-tab="item_reviews" class="review_menu tab_menu">상품 후기</button>
		<button data-tab="item_question" class="quest_menu tab_menu">상품 문의</button>
		<div class="tab_content"></div>
	</div>
	
	<div class="item_details_footer">
		<img src="${contextPath}/assets/img/items/cart_top_btn.PNG" class="btn_top" />
	</div>
	
	<%-- </c:when> --%>
	<%-- </c:choose> --%>
</div>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>


<script type="text/javascript">
	/** tab메뉴 구현 **/
	$(function() {
		$('.tab_menu').click(function() {
			var activeTab = $(this).data('tab');
			$('.tab_menu').css('background-color', 'white');
			$(this).css('background-color', '#FBD14B');
			$.ajax({
				type : 'GET',
				url : activeTab + ".do/" + ${output.id},
				dataType : "html",
				error : function() {
					alert('실패');
				},
				success : function(data) {
					$('.tab_content').html(data);
				}
			});
		});
		$('#default').click();
	});
	
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
	
	/** 위시리스트 체크 **/
	$(function() {
		$(".wishlist_btn").click(function(e) {
            e.preventDefault();
            
            $(this).toggleClass("wishlist_ok_btn");
        });
	});
	
</script>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>