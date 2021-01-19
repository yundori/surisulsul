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
				<th class="psn_order_date">결제일</th>
				<th class="psn_order_items">주문상품</th>
				<th>주문 개수</th>
				<th>결제 금액</th>
				<th>주문 상태</th>				
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<span>2021-00-00<br/></span>
					<span class="order_number">20210000-00000</span>
				</td>
				<td>
				<a href="#">
					<img src="${contextPath}/assets/img/items/best1.PNG"/>
					<span class="order_item_name">상품명</span>
					<span class="order_item_price">00,000원</span>
					</a>
				</td>
				<td>1
				</td>
				<td>00,000원</td>
				<td>상품준비중<br/>
				<button class="cancel_order">주문취소</button></td>
			</tr>
			<tr>
				<td>
					<span>2021-00-00<br/></span>
					<span class="order_number">20210000-00000</span>
				</td>
				<td>
				<a href="#">
					<img src="${contextPath}/assets/img/items/best1.PNG"/>
					<span class="order_item_name">상품명</span>
					<span class="order_item_price">00,000원</span>
					</a>
				</td>
				<td>1
				</td>
				<td>00,000원</td>
				<td>배송완료<br/>
				<button class="write_review">후기쓰기</button></td>
			</tr>
			<tr>
				<td rowspan="2">
					<span>2021-00-00<br/></span>
					<span class="order_number">20210000-00000</span>
				</td>
				<td>
				<a href="#">
					<img src="${contextPath}/assets/img/items/best2.PNG"/>
					<span class="order_item_name">상품명</span>
					<span class="order_item_price">00,000원</span>
					</a>
				</td>
				<td>1
				</td>
				<td rowspan="2">00,000원</td>
				<td>상품준비중<br/>
				<button class="cancel_order">주문취소</button></td>
			</tr>
			<tr>
				
				<td>
				<a href="#">
					<img src="${contextPath}/assets/img/items/best3.PNG"/>
					<span class="order_item_name">상품명</span>
					<span class="order_item_price">00,000원</span>
					</a>
				</td>
				<td>1

				<td>배송완료<br/>
				<button class="write_review">후기쓰기</button></td>
			</tr>

		</tbody>
	</table>
</div>