<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/order.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/join.css?time=${currentTime}" />

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
	<form action="" method="post" class="basket_order_form" name="order_form" id="order_form">
		<fieldset>
			<legend>주문자 정보</legend>
            <label for="user_name" class="col-md-4">주문자</label>
            <div class="col-md-6"><input type="text" name="user_name" id="user_name" class="form-control" placeholder="이름을 입력하세요."/></div>
            <label for="tel" class="col-md-4">이메일</label>
            <div class="col-md-6"><input type="text" name="email" id="email" class="form-control" placeholder="이메일을 입력하세요."/></div>
            <label for="tel" class="col-md-4">연락처</label>
            <div class="col-md-6"><input type="tel" name="tel" id="tel" class="form-control" placeholder="휴대폰 번호를 - 없이 입력하세요."/></div>
		</fieldset>
		
		<div class="make_form_same clearfix">
			<input type="checkbox" name="same" id="same"/>주문자 정보와 동일
		</div>
		
		<fieldset>
			<legend>배송 정보</legend>
			
			<label for='address' class="col-md-4">주소</label>
            <div class="col-md-6">
                <input type="text" class="form-control" id="postcode" placeholder="우편번호" readonly>
            </div>
            <input type="button" onclick="execDaumPostcode()" class="chk-email" value="우편번호 찾기">
            
            <div class="set_location">
	            <input type="text" class="form-control" id="address" placeholder="도로명 주소" readonly>
	            <input type="text" class="form-control" id="detailAddress" placeholder="기타 상세 주소">
            </div>
		
            <label for="user_name" class="col-md-4">수령인</label>
            <div class="col-md-6"><input type="text" name="receiver_name" id="receiver_name" class="form-control" placeholder="이름을 입력하세요."/></div>
			<label for="tel" class="col-md-4">이메일</label>
            <div class="col-md-6"><input type="text" name="receiver_email" id="receiver_email" class="form-control" placeholder="이메일을 입력하세요."/></div>
            <label for="tel" class="col-md-4">연락처</label>
            <div class="col-md-6"><input type="tel" name="receiver_tel" id="receiver_tel" class="form-control" placeholder="휴대폰 번호를 - 없이 입력하세요."/></div>
		</fieldset>
		
		<fieldset>
		<legend>결제 정보</legend>
		</fieldset>
	
	</form>
	
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath}/assets/js/common.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>