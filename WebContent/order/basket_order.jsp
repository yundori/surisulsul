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
	
</div>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>