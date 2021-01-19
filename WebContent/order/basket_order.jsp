<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/order.css?time=${currentTime}" />

<div id="basket_order">
	<h2>주문 내역</h2>
	<table id="basket_table">
		<tr>
			<td>상품</td>
			<td>가격</td>
			<td>수량</td>
			<td>총 가격</td>
		</tr>
		<!--<c:forEach var="i" begin="${first }" end="${last }" varStatus="status">-->
		<tr>
			<td id="left_align"><img src="${contextPath}/assets/img/items/best1.PNG" class="clearfix"/>블루베리 생 막걸리 * 6병</td>
			<td>25,000</td>
			<td>1병</td>
			<td>25,000원</td>
		</tr>
		<tr>
			<td id="left_align"><img src="${contextPath}/assets/img/items/best2.PNG" class="clearfix"/>아이엠더문 오리지날/화이트 에디션</td>
			<td>59,000</td>
			<td>2병</td>
			<td>118,000원</td>
		</tr>
		<!--</c:forEach>-->
		<tr class="final_cost">
			<td colspan="2"><b>총 상품 금액</b></td>
			<td colspan="2"><b>143,000원</b></td>
		</tr>
	</table>
	
	<h2>주문/결제하기</h2>
	<!-- 주문자 정보 table -->
	<table class="order_detail">
		<tr>
			<th colspan="2" class="order_sm_title">주문자 정보</th>
		</tr>
		<tr>
			<th>주문자</th>
			<td><input type="text" placeholder="이름" name="name" id="name"/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" placeholder="이메일" name="email" id="email"/></td>
		</tr>
		<tr>
			<th>연락처</th>		
			<td><input type="text" placeholder="01012345678" name="phone" id="phone"/></td>
		</tr>
	</table>
	
	<table class="order_detail">
		<tr>
			<td colspan="2" class="order_same">
				<input type="checkbox" name="same" id="same"/><label>주문자 정보와 동일</label>
			</td>
		</tr>
		<tr>
			<th colspan="2" class="order_sm_title">배송 정보</th>
		</tr>
		<tr>
			<th>수령인</th>
			<td><input type="text" placeholder="이름" name="receiver_name" id="receiver_name"/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" placeholder="이메일" name="receiver_email" id="receiver_email"/></td>
		</tr>
		<tr>
			<th>연락처</th>		
			<td><input type="text" placeholder="01012345678" name="receiver_phone" id="receiver_phone"/></td>
		</tr>
		<tr>
			<td colspan="2" id="get_address">
				<input type="text" placeholder="우편번호" name="postcode" id="postcode" readonly/>
				<input type="button" value="우편번호 찾기" id="findPC" onclick="execDaumPostcode()"/> <br/>
				<input type="text" placeholder="주소" name="address" id="address" readonly /><br/>
				<input type="text" placeholder="상세주소" name="detailAddress" id="detailAddress" />
				<input type="text" placeholder="참고항목" id="extraAddress" readonly />
				<div id="shipping_details">제주도 및 산간지역은 배송기간이 1~2일 추가될 수 있습니다.</div>
			</td>
		</tr>	
	</table>
	
	<div class="sm_title2">결제방법</div>
		<input type="checkbox" name="directly" id="directly"/><label>무통장 입금</label>
		<input type="checkbox" name="card" id="card"/><label>카드결제</label>
		
	<div id="deposit_directly">
		
	</div>
	
	<div id="deposit_card">
	
	</div>                   
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath}/assets/js/order.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>