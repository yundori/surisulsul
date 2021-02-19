<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_itemlist.css?time=${currentTime}" />


<div class="content">
	<h2>상품관리</h2>
	<h3 class="item_total">총 등록상품 수 : 50개</h3>
	<table class="manage_itemlist_table">
		<tr>
			<th rowspan="2" width="60">상품ID</th>
			<th width="200">상품명</th>
			<th rowspan="3" width="110">상품가격</th>
			<th colspan="6">타입별(분류)</th>
			<th rowspan="2" width="80">용량(ml)</th>
			<th rowspan="2" width="200">음식</th>
			<th rowspan="2" width="200">원재료</th>
			<th colspan="2" width="400">상품설명</th>
			<th rowspan="2" width="40">주능결과</th>
			<th rowspan="2" width="100">관리</th>
		</tr>
		<tr>
			<th>이미지</th>
			<th width="90">종류</th>
			<th width="90">지역</th>
			<th width="90">향</th>
			<th width="50">당도</th>
			<th width="50">산미</th>
			<th width="50">도수</th>
			<th>상세설명</th>
		</tr>
	</table>
</div>