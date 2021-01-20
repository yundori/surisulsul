<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/order.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/join.css?time=${currentTime}" />
 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.css?time=${currentTime}" />

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
		<fieldset id="sender_info">
			<legend>주문자 정보</legend>
			<div>
		        <label for="user_name" class="col-mdd-4">주문자</label>
		        <span class="col-mdd-6" id="user_name">마수리</span>
            </div>
            <div>        
		        <label for="email" class="col-mdd-4">이메일</label>
		        <span class="col-mdd-6" id="email">surisul@gmail.com</span>
            </div>
            <div>
		        <label for="tel" class="col-mdd-4">연락처</label>
		        <span class="col-mdd-6" id="tel">01012345678</span>
            </div>
		</fieldset> 
		
		<div class="make_form_same clearfix">
			<input type="checkbox" name="same" id="same"/>주문자 정보와 동일
		</div>
		
		<fieldset id="receiver_info">
			<legend>배송 정보</legend>
			
			<label for='address' class="col-md-4">주소</label>
            <div class="col-md-6">
                <input type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호" readonly>
            </div>
            <input type="button" onclick="execDaumPostcode()" class="chk-email" value="우편번호 찾기">
            
            <div class="set_location">
	            <input type="text" class="form-control" id="address" name="address" placeholder="도로명 주소" readonly>
	            <input type="text" class="form-control" id="detailAddress" placeholder="기타 상세 주소">
				<div class="details_info">제주도 및 산간지역은 배송기간이 1~2일 추가될 수 있습니다.</div>
            </div>
		
            <label for="receiver_name" class="col-md-4">수령인</label>
            <div class="col-md-6"><input type="text" name="receiver_name" id="receiver_name" class="form-control" placeholder="이름을 입력하세요."/></div>
            <label for="receiver_tel" class="col-md-4">연락처</label>
            <div class="col-md-6"><input type="tel" name="receiver_tel" id="receiver_tel" class="form-control" placeholder="휴대폰 번호를 - 없이 입력하세요."/></div>
		</fieldset>
		
		<fieldset id="pay_info">
			<legend>결제 정보</legend>
			<label for="pay_money" class="col-md-4">결제 방법</label>
			<div class="col-md-6">
				<input type="radio" name="payment" value="pay_money" class="payment_info" checked="checked"/> 무통장 입금
				<input type="radio" name="payment" value="pay_card" class="payment_info"/> 카드결제<br/><br/>
			</div>
			
			<div id="pay_details_money">
				<label for="payed_name" class="col-md-4">입금자명</label>
            	<div class="col-md-6"><input type="text" name="payed_name" id="payed_name" class="form-control" placeholder="이름"/></div>
            	<label for="payed_bank" class="col-md-4">입금은행정보</label>
            	<div class="col-md-6">
            		<select name="bank" class="form-control">
            			<option value="etc">--------입금은행을 선택해주세요-------</option>
            			<option value="kb">국민은행 123456-01-789012 (수리술술)</option>
            			<option value="sh">신한은행 123-123-123456 (수리술술)</option>
            			<option value="nh">농협은행 123-5678-1234-01 (수리술술)</option>
            			<option value="wr">우리은행 1234-567-890123 (수리술술)</option>
            		</select>
            	</div>
			</div>
			<div id="pay_details_card" class="hidden">
				카드결제 들어왔습니다.
			</div>
		</fieldset>
		
		<fieldset id="personal_info">
			<legend>개인정보 수집/제공</legend>
			<div class="personal_info_details">
				<div class="details_info">구매 시 참고사항 : 본 상품은 식품/주류 상품이므로 수령 후 반품/교환이 불가합니다.</div>
				<div id="personal_info_all">
					<input type="checkbox" name="items" id="all" class="check_all">
					약관 전체동의 (원활한 주문 처리를 위하여 이용약관에 동의해주시기 바랍니다.)
				</div>
				<div>
					<input type="checkbox" name="items" id="item1" class="ab">
					주문하실 상품, 가격, 배송정보 등을 확인하였으며 구매에 동의하시겠습니까? (전자상거래법 제8조 2항)
				</div>
				<div>
					<input type="checkbox" name="items" id="item2" class="ab">
					<div id="personal_info_item2">
					1. 접근매체의 양도 및 양수, 대여 및 사용위임, 질권설정 기타 담보 제공 및 이의 알선과 접근 매체를 제 3자에게 누설 및 노출, 방치하는 것은 금지됨. (제 17조, 제 21조, 제 23조)<br/><br/>
					2. 소비자가 재화를 공급받는 날부터 3영업일이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 통보하지 않는 경우 소비자의 동의 없이 판매자에게 결제 대금을 지급할 수 있으며,
					회사가 결제대금을 지급하기 전 소비자가 그 결제대금을 환급받을 사유가 발생한 경우 이를 소비자에게 환급함. (제 19조) <br/><br/>
					3. 이용자의 선불전자지급수단 잔액이 구매 취소 사유 발생으로 회사가 이용자로부터 환수해야 하는 환수 대상액보다 작을 경우 회사는 당 이용자의 선불전자지급수단을 마이너스로 처리할 수 있음. (제 27조)
					</div>
				</div>
			</div>
		</fieldset>
		<div class="text-center">
			<button type="submit" id="go_payment">결제하기</button>
		</div>
	</form>
	
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/assets/plugins/validate/jquery.validate.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/assets/plugins/validate/additional-methods.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
    
<script src="${contextPath}/assets/js/common.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/assets/js/order.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>