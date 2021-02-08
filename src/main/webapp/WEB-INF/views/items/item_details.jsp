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
			<img class="item_img" src="${contextPath}/assets/img/items/best1.PNG" />
			<div class="item_detail_info">
				<h3 class="item_name">고도리 복숭아와인</h3>
			 	<h5 class="item_plain_info">제품 간략 설명(1줄 내외)</h5>
			 	<h5 class="item_ingre">원재료 : 무엇무엇(주재료, %)</h5>
			 	<h5 class="item_plain_info">용량 : 350 ml</h5>
			 	<h5 class="item_period">예상 배송 기간 : 2일</h5>
			 	<h5 class="item_price_text">판매가격</h5>
			 	<h4 class="item_price">00,000원</h4>
			 	<h5 class="item_rating_text">소비자 평점</h5>
			 	<h4 class="item_rating">★★★★☆</h4>
			</div>
		</div>
		<div class="order_info">
			<form method="post" action="${pageContext.request.contextPath}/basket/add_ok.do" name="basket_form" id="basket_form">
			<h3 class="order_title">주문 안내</h3>
			<h4 class="order_item_name">제품명 : <span name="p_name">고도리 복숭아와인</span></h4>
			<!-- <fmt:formatNumber value="${mynumber }" pattern="#,###"/> -->
			<h4 class="order_item_price">개당 판매가 : <span name="p_price">00,000</span>원</h4>
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
			<div class="btn_div">
				<button type="submit" class="order_btn" >장바구니 담기</a>
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
			//var activeTab = $(this).attr('data-tab');
			var activeTab = $(this).data('tab');
			$('.tab_menu').css('background-color', 'white');
			$(this).css('background-color', '#FBD14B');
			$.ajax({
				type : 'GET',
				url : activeTab + ".do",
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
	
	/** 차트 구현 **/
	$(document).ready(function() {
		var ctx = document.getElementById('item_chart').getContext('2d');
		var itemChart = new Chart(ctx, {
			type : 'horizontalBar', //가로막대그래프
			data : {
				labels : [ "당도", "산미", "도수" ], // 각각의 bar에 표시할 x축 라벨
				datasets : [ {
					data : [ 1, 3, 4 ], // 각 bar에 대한 y축 좌표 데이터
					backgroundColor : [// 각 bar의 배경 색상
								'rgba(142, 68, 173, 0.6)',
								'rgba(74, 68, 173, 0.6)',
								'rgba(177, 101, 159, 0.7)' 
								],
					borderColor : [// 각 bar의 테두리 색상
								'rgba(142, 68, 173, 1)',
								'rgba(74, 68, 173, 1)',
								'rgba(177, 101, 159, 1)'
								],
					borderWidth : 2	// 각 bar의 테두리 굵기
				} ]
			},
			options : {
				tooltips: {
					enabled: false
				},
				hover: {
					animationDuration: 0
				},
				animation: {
					duration: 1,
					onComplete: function () {
						var chartInstance = this.chart,
							ctx = chartInstance.ctx;
						ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
						ctx.fillStyle = 'black';
						ctx.textSize = '20';
						ctx.textAlign = 'center';
						ctx.textBaseline = 'middle';

						this.data.datasets.forEach(function (dataset, i) {
							var meta = chartInstance.controller.getDatasetMeta(i);
							meta.data.forEach(function (bar, index) {
								var data = dataset.data[index];							
								ctx.fillText(data, bar._model.x + 10, bar._model.y);
							});
						});
					}
				},
				responsive : false,
				legend: {
					display: false
				},
				scales : {
					xAxes : [{
						ticks :{
							display: false,
							//autoSkip : false,
							beginAtZero: true,
							//stepSize: 10,
							min : 0,
							max : 6
						},
						gridLines: {
			                display:false
			            }
					}],
						yAxes : [{
							ticks :{
								autoSkip : false,
								fontColor : 'rgba(0, 0, 0, 1)',
								fontSize : 16
							},
							gridLines: {
				                display:false
				            }
						}]
					}
				}
			});
		
	});
	
</script>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>