<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_members.css?time=${currentTime}" />

<div class="content">
	<h2>회원관리</h2>
	<form method="get"
		action="${pageContext.request.contextPath }/manage_members.do"
		style="display: inline-block;">
		<input type="hidden" name="sort" id="all" value="all" />
		<button type="submit" class="manage_members_all">
			<span class="btn_total">전체 </span> <span class="btn_num">${totalCount }명</span>
		</button>
	</form>

	<form method="get"
		action="${pageContext.request.contextPath }/manage_members.do"
		style="display: inline-block;">
		<input type="hidden" name="sort" id="out" value="out" />
		<button type="submit" class="manage_members_out">
			<span class="btn_total">탈퇴 </span> <span class="btn_num">${outCount }명</span>
			</a>
		</button>
	</form>

	<form method="get"
		action="${pageContext.request.contextPath }/manage_members.do">
		<input type="hidden" name="sort" id="out" value="${sort }" /> <input
			type="search" name="keyword" id="keyword" placeholder="회원명 검색"
			value="${keyword }" />
		<button type="submit">검색</button>
	</form>

	<div class="mem_table">
		<table class=manage_member_table>

			<thead>
				<tr>
					<th width="40">번호</th>
					<th>이메일</th>
					<th>이름</th>
					<th width="170">생년월일</th>
					<th width="170">전화번호</th>
					<th width="170">최종접속일</th>
					<th width="170">가입일자</th>
					<th width="70">상태</th>
					<th width="70">회원관리</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<%--c:when test 조건 -> 회원이 존재하는가 -> 검색 DB 내용 존재 --%>
					<c:when test="${result }">
						<c:forEach var="output" items="${output }" varStatus="status">
							<tr>
								<td>${output.id }</td>
								<td>${output.email }</td>
								<td>${output.name }</td>
								<td>${output.birthdate}</td>
								<td>${output.phone }</td>
								<td>${output.edit_date}</td>
								<td>${output.reg_date}</td>
								<c:choose>
									<c:when test="${output.is_out == 'Y' }">
										<td>탈퇴</td>
									</c:when>
									<c:otherwise>
										<td>정상</td>
									</c:otherwise>
								</c:choose>
								<%-- 수정페이지로 이동하기 위한 URL --%>
								<c:url value="/manage_update_info.do" var="editUrl">
									<c:param name="item_id" value="${output.id}" />
								</c:url>
								<td><a href="${editUrl }" class="item_btn">수정</a></td>
							</tr>
						</c:forEach>
					</c:when>
					<%--c:otherwise --> 회원이 없는 경우 -> 데이터 X --%>
					<c:otherwise>
						<tr>
							<td colspan='10'>일치하는 회원이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>


<div class="pageNumber">
	<!-- 페이지 번호 구현 -->
	<%-- 이전 그룹에 대한 링크 --%>
	<c:choose>
		<%-- 이전 그룹으로 이동 가능하다면? --%>
		<c:when test="${pageData.prevPage > 0}">
			<%-- 이동할 URL 생성 --%>
			<c:url value="/manage_members.do" var="prevPageUrl">
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
		<c:url value="/manage_members.do" var="pageUrl">
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
			<c:url value="/manage_members.do" var="nextPageUrl">
				<c:param name="page" value="${pageData.nextPage}" />
			</c:url>
			<a href="${nextPageUrl}" class="page-link">[다음]</a>
		</c:when>
		<c:otherwise>
					[다음]
				</c:otherwise>
	</c:choose>
</div>

</div>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	//팝업열기
	function open_edit() {
		var popup = window
				.open(
						'${pageContext.request.contextPath}/manage_update_info.do',
						'_blank',
						'width=648, height=500, toolbar=no, menubar=no, scrollbars=yes, resizable=no');
		console.log("############################")
	}
</script>