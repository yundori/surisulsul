<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_wishlist.css?time=${currentTime}" />

<div class="content">
	<h2>위시리스트 관리</h2>




	<div style="display: block; width: 805px;">
		<div style="display: inline-block;">
			<a href="${pageContext.request.contextPath}/manage_wishlist_asc.do"
				class="mng_btn_wish">인기순 정렬</a> <a
				href="${pageContext.request.contextPath}/manage_wishlist.do"
				class="mng_btn_id">번호순 정렬</a>

			<form method="get"
				action="${pageContext.request.contextPath }/manage_wishlist.do" class="search_by_name">
				<div>
					<input type="search" name="keyword" id="keyword"
						placeholder="상품명 검색" value="${keyword }" />
					<button type="submit">검색</button>
				</div>
			</form>
		</div>


		<table class=manage_wish_table>
			<thead>
				<tr>
					<th width="100">상품번호</th>
					<th width="500">상품명</th>
					<th width="100">❤</th>
					<th width="100">장바구니</th>

				</tr>
			</thead>
			<tbody>
				<c:choose>
					<%--c:when test 조건 -> 상품이 존재하는가 -> 검색 DB 내용 존재 --%>
					<c:when test="${result }">
						<c:forEach var="output" items="${output }" varStatus="status">
							<tr>
								<td>${output.id }</td>
								<td>${output.name }</td>
								<td>${output.wish }</td>
								<td>${output.basket }</td>
							</tr>
						</c:forEach>
					</c:when>
					<%--c:otherwise --> 상품이 없는 경우 -> 데이터 X --%>
					<c:otherwise>
						<tr>
							<td colspan='4'>해당 상품이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>




		<div class="pageNumber">
			<c:choose>
				<c:when test="${pageLink eq 'ById' }">
					<!-- 페이지 번호 구현 -->
					<%-- 이전 그룹에 대한 링크 --%>
					<c:choose>
						<%-- 이전 그룹으로 이동 가능하다면? --%>
						<c:when test="${pageData.prevPage > 0}">
							<%-- 이동할 URL 생성 --%>
							<c:url value="/manage_wishlist.do" var="prevPageUrl">
								<c:param name="page" value="${pageData.prevPage}" />
							</c:url>
							<a href="${prevPageUrl}" class="page-link">[이전]</a>
						</c:when>
						<c:otherwise>
					[이전]
				</c:otherwise>
					</c:choose>

					<%-- 페이지 번호(시작 페이지부터 끝 페이지까지 반복) --%>
					<c:forEach var="i" begin="${pageData.startPage}"
						end="${pageData.endPage}" varStatus="status">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/manage_wishlist.do" var="pageUrl">
							<c:param name="page" value="${i}" />
						</c:url>

						<%-- 페이지 번호 출력 --%>
						<c:choose>
							<%-- 현재 머물고있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
							<c:when test="${pageData.nowPage == i}">
								<strong>${i}</strong>
							</c:when>
							<%-- 나머지 페이지의 경우 링크 적용함 --%>
							<c:otherwise>
								<a href="${pageUrl}" class="page-link">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<%-- 다음 그룹에 대한 링크 --%>
					<c:choose>
						<%-- 다음 그룹으로 이동 가능하다면? --%>
						<c:when test="${pageData.nextPage > 0}">
							<%-- 이동할 URL 생성 --%>
							<c:url value="/manage_wishlist.do" var="nextPageUrl">
								<c:param name="page" value="${pageData.nextPage}" />
							</c:url>
							<a href="${nextPageUrl}" class="page-link">[다음]</a>
						</c:when>
						<c:otherwise>
					[다음]
				</c:otherwise>
					</c:choose>
				</c:when>
				<c:when test="${pageLink eq 'ByWish' }">
					<!-- 페이지 번호 구현 -->
					<%-- 이전 그룹에 대한 링크 --%>
					<c:choose>
						<%-- 이전 그룹으로 이동 가능하다면? --%>
						<c:when test="${pageData.prevPage > 0}">
							<%-- 이동할 URL 생성 --%>
							<c:url value="/manage_wishlist_asc.do" var="prevPageUrl">
								<c:param name="page" value="${pageData.prevPage}" />
							</c:url>
							<a href="${prevPageUrl}" class="page-link">[이전]</a>
						</c:when>
						<c:otherwise>
					[이전]
				</c:otherwise>
					</c:choose>

					<%-- 페이지 번호(시작 페이지부터 끝 페이지까지 반복) --%>
					<c:forEach var="i" begin="${pageData.startPage}"
						end="${pageData.endPage}" varStatus="status">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/manage_wishlist_asc.do" var="pageUrl">
							<c:param name="page" value="${i}" />
						</c:url>

						<%-- 페이지 번호 출력 --%>
						<c:choose>
							<%-- 현재 머물고있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
							<c:when test="${pageData.nowPage == i}">
								<strong>${i}</strong>
							</c:when>
							<%-- 나머지 페이지의 경우 링크 적용함 --%>
							<c:otherwise>
								<a href="${pageUrl}" class="page-link">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<%-- 다음 그룹에 대한 링크 --%>
					<c:choose>
						<%-- 다음 그룹으로 이동 가능하다면? --%>
						<c:when test="${pageData.nextPage > 0}">
							<%-- 이동할 URL 생성 --%>
							<c:url value="/manage_wishlist_asc.do" var="nextPageUrl">
								<c:param name="page" value="${pageData.nextPage}" />
							</c:url>
							<a href="${nextPageUrl}" class="page-link">[다음]</a>
						</c:when>
						<c:otherwise>
					[다음]
				</c:otherwise>
					</c:choose>
				</c:when>
			</c:choose>

		</div>
	</div>
</div>


