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
				<button class="cancel_order">주문취소</button></td>
				
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
				<button class="write_review">후기쓰기</button></td>
			</tr>

		</tbody>
	</table>
</div>