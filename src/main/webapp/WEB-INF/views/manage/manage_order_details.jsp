<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_orders.css?time=${currentTime}" />
	
<div class="content">
    <h2>주문상세 - (주문번호: 20)</h2>
    
    <div class="manage_orders_count">
    주문하신분(이메일) <b>surisulsul@gmail.com</b> | 현재 주문상태 <b>주문</b> | 
    주문일시 <b>2021-02-23 00:00:00</b> | 수정일시 <b>2021-02-23 00:00:00</b> | 
    주문총액 <b>106,000원</b>
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
    <a href="${pageContext.request.contextPath}/manage_orders.do" class="go_list">목록으로</a>
</div>

</body>

</html>