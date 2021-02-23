<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_itemlist.css?time=${currentTime}" />


<div class="content">
	<h2>상품관리</h2>
	<h3 class="item_total">총 등록상품 수 : ${totalCount}</h3>
	<button class="newitem_add">상품 등록</button>
	
	<table class="manage_itemlist_table">
		<tr>
			<th rowspan="2" width="50">상품ID</th>
			<th width="200">상품명</th>
			<th rowspan="2" width="90">상품가격</th>
			<th colspan="6">타입별(분류)</th>
			<th rowspan="2" width="70">용량(ml)</th>
			<th width="200">원재료</th>
			<th width="350">상품설명</th>
			<th width="80">별점</th>
			<th rowspan="2" width="80">관리</th>
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
		<tr>
			<td rowspan="2">${output.id}</td>
			<td>${output.name}</td>
			<td rowspan="2">${output.price}</td>
			<td rowspan="2">${output.type}</td>
			<td rowspan="2">${output.loc}</td>
			<td rowspan="2">${output.key1}, %{output.key2}</td>
			<td rowspan="2">${output.sweet}</td>
			<td rowspan="2">${output.sour}</td>
			<td rowspan="2">${output.degree}</td>
			<td rowspan="2">${output.size}ml</td>
			<td>${output.igd}</td>
			<td>${output.des1}</td>
			<td>${output.star}</td>
			<td rowspan="2">
				<button>수정</button>
				<button>삭제</button>
			</td>
		</tr>
		<tr>
			<td><img src="${contextPath}/assets/img/items/${output.img}" /></td>
			<td>${output.food}</td>
			<td>${output.des2}</td>
			<td>${output.jn_result}</td>
		</tr>
	</table>
</div>