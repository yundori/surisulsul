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
			<td>상품</td>
			<td>가격</td>
			<td>수량</td>
			<td>총 가격</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="item1" class="ab"></td>
			<td id="left_align" class="clearfix"><img src="${contextPath}/assets/img/items/best1.PNG"/>블루베리 생 막걸리 * 6병</td>
			<td>25,000</td>
			<td><button1</td>
			<td>25,000</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="item1" class="ab"></td>
			<td id="left_align" class="clearfix"><img src="${contextPath}/assets/img/items/best2.PNG"/>아이엠더문 오리지날/화이트 에디션</td>
			<td>59,000</td>
			<td>2</td>
			<td>118,000</td>
		</tr>
		<tr>
			<td colspan="5" class="clearfix">
				<input type="checkbox" name="all" class="check_all"> 
				<label>전체선택</label>
				<a href="" id="delete_this">선택상품 삭제</a>
			</td>
		</tr>
	</table>
</div>

<script src="${contextPath}/assets/js/order.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>