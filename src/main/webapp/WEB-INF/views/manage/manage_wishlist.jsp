<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_wishlist.css?time=${currentTime}" />

<div class="content">
	<h2>위시리스트 관리</h2>

	<form method="get" action="${pageContext.request.contextPath }/manage_wishlist.do">
		<fieldset>
			<div class="date_search">
				<input type="date" name="fromdate" id="fromdate" /> <label
					for="todate"> - </label> <input type="date" name="todate"
					id="todate" />
			</div>
		</fieldset>
			<div>
		<input type="search" name="keyword" id="keyword" placeholder="상품명 검색"
			value="${keyword }" />
		<button type="submit">검색</button>
			</div>
	</form>

	<table class=manage_wish_table>
		<thead>
			<tr>
				<th width="100">상품번호</th>
				<th width="200">상품명</th>
				<th width="100">❤</th>
				<th width="100">장바구니</th>
				<th width="100">판매수량</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>id</td>
				<td>고도리주2</td>
				<td>3,400</td>
				<td>2,00</td>
				<td>1,000</td>
			</tr>
		</tbody>
	</table>
</div>

