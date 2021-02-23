<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_orders.css?time=${currentTime}" />
	
<div class="content">
    <h2>주문상세 - (주문번호: 20)</h2>
    
    <div class="manage_orders_count">
    현재 주문상태 <b>주문</b> | 주문일시 <b>2021-02-23 00:00:00</b> | 
    수정일시 <b>2021-02-23 00:00:00</b> | 주문총액 <b>106,000원</b>
    </div>
    
    <table class="manage_order_table">
    	<tr>
    		<th>상품명</th>
    		<th>상태</th>
    		<th>수량</th>
    		<th>판매가</th>
    		<th>소계</th>
    	</tr>
    	<tr>
    		<td class="product"><img src="${contextPath}/assets/img/items/item1.jpg" class="small_img"/>블루베리생막걸리(6병)</td>
    		<td>주문완료</td>
    		<td>2</td>
    		<td class="price">25,000</td>
    		<td class="price">50,000</td>
    	</tr>
    	<tr>
    		<td class="product"><img src="${contextPath}/assets/img/items/item1.jpg" class="small_img"/>편백숲 산소막걸리 딸기 스파클링 (4병)</td>
    		<td>주문완료</td>
    		<td>1</td>
    		<td class="price">56,000</td>
    		<td class="price">56,000</td>
    	</tr>    	
    </table>
    
    <div class="manage_orders_count">
    	<b>결제 및 수령자 정보</b>
    </div>
    <table class="manage_order_table">
    	<tr>
    		<th>구매자명</th>
    		<th>구매자전화번호</th>
    		<th>수령자명</th>
    		<th>수령자 전화번호</th>
    		<th>수령자 주소</th>
    		<th>결제방식</th>
    	</tr>
    	
    	<tr>
    		<td>마수리</td>
    		<td>01012345678</td>
    		<td>수리술</td>
    		<td>01098765432</td>
    		<td>서울시 서초구 강남대로 7길 3 어쩌고빌딩 301호 (00321)</td>
    		<td>무통장 : 신한(마수리)</td>
    	</tr>
    </table>
    <a href="${pageContext.request.contextPath}/manage_orders.do" class="go_list">목록으로</a>
    <a href="${pageContext.request.contextPath}/update_single.do" class="go_list">상태변경</a>
    
    <div class="warning">
    	※ 상태변경 시 주문완료 > 입금완료 > 배송완료 형식으로 업데이트 됩니다.
    </div>
</div>

</body>

</html>