<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>

<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_itemlist.css?time=${currentTime}" />


<div class="content">
	<h2>상품관리</h2>
	<h3 class="item_total">총 등록상품 수 : ${totalCount}개</h3>
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
				<th width="130">등록날짜</th>
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
				<th>수정날짜</th>
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
				<td>${item.reg_date}</td>
				<td rowspan="2">
					<button>수정</button>
					<button>삭제</button>
				</td>
			</tr>
			<tr>
				<td><img src="${contextPath}/assets/img/items/${item.img}" /></td>
				<td>${item.food}</td>
				<td>${item.des2}</td>
				<td>${item.jn_result}</td>
				<td>${item.edit_date}</td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		
		<div class="pageNumber">
		<!-- 페이지 번호 구현 -->
		<%-- 이전 그룹에 대한 링크 --%>
		<c:choose>
			<%-- 이전 그룹으로 이동 가능하다면? --%>
			<c:when test="${pageData.prevPage > 0}">
				<%-- 이동할 URL 생성 --%>
				<c:url value="/manage_itemlist.do" var="prevPageUrl">
					<c:param name="page" value="${pageData.prevPage}" />
				</c:url>
				<a href="${prevPageUrl}">[이전]</a>
			</c:when>
			<c:otherwise>
				[이전]
			</c:otherwise>
		</c:choose>

		<%-- 페이지 번호(시작 페이지부터 끝 페이지까지 반복) --%>
		<c:forEach var="i" begin="${pageData.startPage}"
			end="${pageData.endPage}" varStatus="status">
			<%-- 이동할 URL 생성 --%>
			<c:url value="/manage_itemlist.do" var="pageUrl">
				<c:param name="page" value="${i}" />
			</c:url>
	
			<%-- 페이지 번호 출력 --%>
			<c:choose>
				<%-- 현재 머물고있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
				<c:when test="${pageData.nowPage == i}">
					<strong>[${i}]</strong>
				</c:when>
				<%-- 나머지 페이지의 경우 링크 적용함 --%>
				<c:otherwise>
					<a href="${pageUrl}">[${i}]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<%-- 다음 그룹에 대한 링크 --%>
		<c:choose>
			<%-- 다음 그룹으로 이동 가능하다면? --%>
			<c:when test="${pageData.nextPage > 0}">
				<%-- 이동할 URL 생성 --%>
				<c:url value="/manage_itemlist.do" var="nextPageUrl">
					<c:param name="page" value="${pageData.nextPage}" />
				</c:url>
				<a href="${nextPageUrl}">[다음]</a>
			</c:when>
			<c:otherwise>
				[다음]
			</c:otherwise>
		</c:choose>
		</div>
</div>