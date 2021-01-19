<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/order.css?time=${currentTime}" />

<div id="basket">
	<h1>장바구니</h1>
	<table id="basket_table">
		<tr>
			<td colspan="5" class="clearfix">
				<input type="checkbox" name="all" class="check_all"> 
				<label>전체선택</label>
				<a href="" id="delete_this">선택상품 삭제</a>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><b>상품</b></td>
			<td><b>가격</b></td>
			<td><b>수량</b></td>
			<td><b>총 가격</b></td>
		</tr>
		<!--<c:forEach var="i" begin="${first }" end="${last }" varStatus="status">-->
		<tr>
			<td><input type="checkbox" name="item1" id="item1" class="ab"></td>
			<td id="left_align"><img src="${contextPath}/assets/img/items/best1.PNG" class="clearfix"/>블루베리 생 막걸리 * 6병</td>
			<td>25,000</td>
			<td>1병</td>
			<td>25,000원</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="item2" id="item2" class="ab"></td>
			<td id="left_align"><img src="${contextPath}/assets/img/items/best2.PNG" class="clearfix"/>아이엠더문 오리지날/화이트 에디션</td>
			<td>59,000</td>
			<td>2병</td>
			<td>118,000원</td>
		</tr>
		<!--</c:forEach>-->
		<tr>
			<td colspan="5" class="clearfix">
				<input type="checkbox" name="all" class="check_all"> 
				<label>전체선택</label>
				<a href="" id="delete_this">선택상품 삭제</a>
			</td>
		</tr>
	</table>
	
	<table id="basket_summary">
		<tr>
			<td><b>총 상품 금액</b></td>
			<td>143,000원</td>
		</tr>
		<tr>
			<td><b>배송비</b></td>
			<td>무료</td>
		</tr>
		<tr>
			<td><b>총 주문 금액</b></td>
			<td>143,000원</td>
		</tr>
	</table>
	
	<a href="" id="go_order">주문/결제 하기</a>
</div>

<script src="${contextPath}/assets/js/order.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>