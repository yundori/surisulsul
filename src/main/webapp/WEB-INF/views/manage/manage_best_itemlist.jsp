<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_itemlist.css?time=${currentTime}" />
<div class="content">
	<h2>인기상품관리</h2>
	<h3 class="item_total">총 인기상품 수 : ${totalCount}개</h3>
	
	<table class="manage_itemlist_table">
		<tr>
			<th rowspan="2" width="50">순위</th>
			<th rowspan="2" width="50">상품ID</th>
			<th width="200">상품명</th>
			<th rowspan="2" width="90">상품가격</th>
			<th colspan="6">타입별(분류)</th>
			<th rowspan="2" width="70">용량(ml)</th>
			<th width="200">원재료</th>
			<th width="350">상품설명</th>
			<th width="80">별점</th>
		</tr>
		<tr>
			<th>이미지</th>
			<th width="80">종류</th>
			<th width="80">지역</th>
			<th width="80">향</th>
			<th width="40">당도</th>
			<th width="40">산미</th>
			<th width="40">도수</th>
			<th width="150">음식</th>
			<th>상세설명</th>
			<th>주능결과</th>
		</tr>
		<c:choose>
		<c:when test="${output == null || fn:length(output) == 0 }">
			<div class="select_none">
				<img src="${contextPath}/assets/img/mark_alert.png" />
				<h1>검색 결과를 찾을 수 없습니다.</h1>
			</div>
		</c:when>
		<c:otherwise>
		<c:forEach var="item" items="${output}" varStatus="status">
		<tr>
			<td rowspan="2">${status.count}</td>
			<td rowspan="2">${item.id}</td>
			<td>${item.name}</td>
			<td rowspan="2"><fmt:formatNumber value="${item.price}" pattern="#,###"/>원</td>
			<td rowspan="2">${item.type}</td>
			<td rowspan="2">${item.loc}</td>
			<td rowspan="2">${item.key1}, ${item.key2}</td>
			<td rowspan="2">${item.sweet}</td>
			<td rowspan="2">${item.sour}</td>
			<td rowspan="2">${item.degree}</td>
			<td rowspan="2">${item.size}ml</td>
			<td>${item.igd}</td>
			<td>${item.des1}</td>
			<td>${item.star}</td>
		</tr>
		<tr>
			<td><img src="${contextPath}/assets/img/items/${item.img}" /></td>
			<td>${item.food}</td>
			<td>${item.des2}</td>
			<td>${item.jn_result}</td>
		</tr>
		</c:forEach>
		</c:otherwise>
		</c:choose>
	</table>
</div>