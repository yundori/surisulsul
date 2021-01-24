<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/mypage_detail.css?time=${currentTime}" />

<div class="psn_past_order">
	<div class="psn_title">
		<h2 class="psn_title_txt">구매했어요</h2>
	</div>
</div>

<div class="order_table">
	<table>
		<thead>
 			<tr>
				<th class="psn_order_date" rowspan="5">주문날짜 : 2021-01-19</th>			
			</tr> 
		</thead>
		<tbody>
			<tr>

				<td>
					<span class="order_number">20210000-00000</span>
				</td>
				<td>
					<div class="table_min_height">
					<a href="#" class="item_thumb">
						<img src="${contextPath}/assets/img/items/best1.PNG"/>
					</a>
					<div class="order_item_info">
						<a href="#" class="item">
							<p class="order_item_name">상품명</p>
							<p class="order_item_price">00,000원</p>
						</a>
					</div>
					</div>
				</td>
				<td>1
				</td>
				<td>00,000원</td>
				<td>상품준비중<br/>
				<a href="#" class="cancel_order btn_nor" type="button" return false;>주문취소</a></td>
				
			</tr>
			<tr>
				<td>
					<span class="order_number">20210000-00000</span>
				</td>
				<td>
				<div class="table_min_height">
					<a href="#" class="item_thumb">
						<img src="${contextPath}/assets/img/items/best2.PNG"/>
					</a>
					<div class="order_item_info">
						<a href="#" class="item">
							<p class="order_item_name">상품명</p>
							<p class="order_item_price">00,000원</p>
						</a>
					</div>
					</div>
				</td>
				<td>1
				</td>
				<td>00,000원</td>
				<td>배송완료<br/>
				<a href="#" class="write_review btn_yellow" onClick="openPop()" return false;>후기쓰기</a></td>
			</tr>

		</tbody>
	</table>
	<!--***** 여기에 PAGINATION 들어가야 함 *****-->
</div>

<script>
//팝업열기
function openPop() {
	var popup = window.open(
	'../mypage/write_review.jsp','후기쓰기',
	'width=700, height=960, toolbar=no, menubar=no, scrollbars=yes, resizable=no');
	}
	
//주문취소
$(function(){
	$(".cancel_order").click(function(){
		//확인, 취소버튼에 따른 후속 처리 구현
		swal({
			title : '주문 취소',
			text : "정말 주문을 취소하시겠습니까?",
			type : 'question',
			confirmButtonText : '아니오',
			showCancelButton : true,
			cancelButtonText : '네',
		}).then(function(result){
			if(result.value){
				swal('확인', '주문이 그대로 진행됩니다.', 'success');
			}else if(result.dismiss === 'cancel'){
			swal({
			title : '주문 취소',
			text : "주문취소가 완료되었습니다.",
			type : 'success',
			confirmButtonText : '확인',
			}).then(function(){
				window.location='../mypage/mypage.jsp';
			});
			}
		});
	});
});

	</script>