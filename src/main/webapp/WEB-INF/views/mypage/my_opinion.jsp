<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- JSTL로 변수 생성 --%>
<%-- 1) 캐시를 방지하기 위해 자주 수정되는 css,js 파일에 설정하는 용도 --%>
<c:set var="currentTime" value="<%=System.currentTimeMillis()%>" />
<%-- 2) 프로젝트이름 기반의 절대경로값 --%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />

<div id="psn_recommend_list" class="psn_recommend_list">

	<!-- ************나의 후기 ************ -->
	<div id="recommend-container">
	<div class="psn_title">
		<h2 class="psn_title_txt">나의 후기</h2>
	</div>
	<div class="psn_review_table">
		<form method="post"
			action="${pageContext.request.contextPath }/mypage/delete_ok.do"
			name="review_form" id="review_form">
			<table>
				<thead>
					<tr>
						<th><input type="checkbox" name="all" class="check_all">전체선택
						</th>
						<th>상품</th>
						<th>작성 내용</th>
						<th>작성일</th>
						<th>수정하기</th>
					</tr>
				</thead>

				<tbody>
					<c:choose>
						<%--c:when test 조건 -> 최근 구매 내역이 있는 경우 -> 후기를 작성했는지 여부 -> 주문 내역 DB 내용 존재 --%>
						<c:when test="${reviewOutput.size()!=0 }">
							<c:forEach var="review" items="${reviewOutput }"
								varStatus="status">

								<%--상세 페이지로 이동하는 URL --%>
								<c:url value="/item_details.do" var="viewUrl">
									<c:param name="prodid" value="${review.p_id}" />
								</c:url>

								<tr>
									<td><input type="checkbox" name="reviewItem"
										id="review${review.id }" class="ab" value="${review.id }"></td>
									<td><a href="${viewUrl }">${review.p_name }</a></td>
									<td>
										<div class="table_min_height">
											<a href="#" class="review_item_thumb"> <img
												class="review_img"
												src="${contextPath}/upload/${review.rev_img}" />
											</a>
											<div class="review_item_info">
												<a href="${viewUrl }" class="item"> <c:set var="stars"
														value="${review.star}" /> <c:choose>
														<c:when test="${stars != 0}">
															<c:forEach var="i" begin="1" end="${stars}">⭐</c:forEach>
														</c:when>
													</c:choose>
													<p class="review_item_name">${review.content}</p>
												</a>
											</div>
										</div>

									</td>
									<td>${review.reg_date}</td>
									<td><a href="javascript:openPop(${review.id});"
										class="edit_recommend btn_gray">수정하기</a></td>
								</tr>

							</c:forEach>
						</c:when>

						<%--c:otherwise --> 주문내역이 없는 경우/후기를 작성하지 않은 경우 -> DB에 데이터 X --%>
						<c:otherwise>
							<tr>
								<td colspan="5" style="padding: 30px;">작성한 후기가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

			<div class="delete_area">
				<button type="submit" class="delete_this btn_nor">선택 삭제</button>
			</div>
		</form>
					<!--***** 여기에 PAGINATION 들어가야 함 *****-->
			<div class="pageNumber">
				<!-- 페이지 번호 구현 -->
				<%-- 이전 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/mypage/my_opinion.do" var="prevPageUrl">
							<c:param name="page" value="${pageData.prevPage}" />
							<c:param name="q_page" value="${q_pageData.nowPage}" />
						</c:url>
						<a href="${prevPageUrl}" class="page-link" data-anchor="recommend-container">[이전]</a>
					</c:when>
					<c:otherwise>
					[이전]
				</c:otherwise>
				</c:choose>

				<%-- 페이지 번호(시작 페이지부터 끝 페이지까지 반복) --%>
				<c:forEach var="i" begin="${pageData.startPage}"
					end="${pageData.endPage}" varStatus="status">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/mypage/my_opinion.do" var="pageUrl">
						<c:param name="page" value="${i}" />
						<c:param name="q_page" value="${q_pageData.nowPage}" />
					</c:url>

					<%-- 페이지 번호 출력 --%>
					<c:choose>
						<%-- 현재 머물고있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
						<c:when test="${pageData.nowPage == i}">
							<strong>${i}</strong>
						</c:when>
						<%-- 나머지 페이지의 경우 링크 적용함 --%>
						<c:otherwise>
							<a href="${pageUrl}" class="page-link" data-anchor="recommend-container">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<%-- 다음 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 다음 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.nextPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/mypage/my_opinion.do" var="nextPageUrl">
							<c:param name="page" value="${pageData.nextPage}" />
							<c:param name="q_page" value="${q_pageData.nowPage}" />
						</c:url>
						<a href="${nextPageUrl}" class="page-link" data-anchor="recommend-container">[다음]</a>
					</c:when>
					<c:otherwise>
					[다음]
				</c:otherwise>
				</c:choose>
			</div>
		</div>
</div>


	<!-- ************나의 질문 ************ -->
	<div id="qna-container">
	<div class="psn_title">
		<h2 class="psn_title_txt">나의 질문</h2>
	</div>
	<div class="psn_qna_table">
		<form method="post"
			action="${pageContext.request.contextPath }/mypage/qna_delete_ok.do"
			name="qna_form" id="qna_form">
			<table>
				<thead>
					<tr>
						<th><input type="checkbox" name="all" class="check_all2">전체선택
						</th>
						<th>문의 상품</th>
						<th>문의 내용</th>
						<th>문의 날짜</th>
						<th>답변여부</th>
					</tr>
				</thead>

				<tbody>
					<c:choose>
						<%--c:when test 조건 -> 최근 문의 내역 존재 여부 -> 문의 내역 DB 내용 존재 --%>
						<c:when test="${qnaOutput.size()!=0 }">
							<c:forEach var="qna" items="${qnaOutput }" varStatus="status">
							
							<%--상세 페이지로 이동하는 URL --%>
								<c:url value="/item_details.do" var="view_Url">
									<c:param name="prodid" value="${qna.p_id}" />
								</c:url>
								
								<tr>
									<td><input type="checkbox" name="qnaItem"
										id="qna${qna.id }" class="cd" value="${qna.id }"></td>
									<td><a href="${view_Url }">${qna.p_name }</a></td>
									<td>
										<div class="table_min_height">
											<div class="qna_item_info">
												<a href="${view_Url }">  <span
													class="qna_area">
													<c:choose>
													<c:when test="${qna.type == '1' }">
													[분류 : 상품문의]
													</c:when>
													<c:when test="${qna.type == '2' }">
													[분류 : 배송문의]
													</c:when>
													<c:when test="${qna.type == '3' }">
													[분류 : 대량구매]
													</c:when>
													<c:when test="${qna.type == '4' }">
													[분류 : 기타문의]
													</c:when>
													</c:choose>
													</span>
													<p class="qna_item_name">${qna.content }</p>
												</a>
											</div>
										</div>

									</td>
									<td>${qna.reg_date }</td>
									<c:choose>
									<c:when test="${qna.status eq 'N' }">
									<td>답변 대기중</td>
									</c:when>
									<c:when test="${qna.status eq 'Y' }">
									<td>답변 완료</td>
									</c:when>
									</c:choose>
								</tr>
							</c:forEach>
						</c:when>

						<%--c:otherwise --> 문의 내역이 없는 경우 -> DB에 데이터 X --%>
						<c:otherwise>
							<tr>
								<td colspan="5" style="padding: 30px;">작성한 질문이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="delete_area">
				<button type="submit" class="delete_this btn_nor">선택 삭제</button>
			</div>
		</form>
			<!--***** 여기에 PAGINATION 들어가야 함 *****-->
			<div class="pageNumber">
				<!-- 페이지 번호 구현 -->
				<%-- 이전 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${q_pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/mypage/my_opinion.do" var="prevPageUrl">
							<c:param name="q_page" value="${q_pageData.prevPage}" />
							<c:param name="page" value="${pageData.nowPage}" />
						</c:url>
						<a href="${prevPageUrl}" class="page-link" data-anchor="qna-container">[이전]</a>
					</c:when>
					<c:otherwise>
					[이전]
				</c:otherwise>
				</c:choose>

				<%-- 페이지 번호(시작 페이지부터 끝 페이지까지 반복) --%>
				<c:forEach var="i" begin="${q_pageData.startPage}"
					end="${q_pageData.endPage}" varStatus="status">
					<%-- 이동할 URL 생성 --%>
					<c:url value="/mypage/my_opinion.do" var="pageUrl">
						<c:param name="q_page" value="${i}" />
						<c:param name="page" value="${pageData.nowPage}" />
					</c:url>

					<%-- 페이지 번호 출력 --%>
					<c:choose>
						<%-- 현재 머물고있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
						<c:when test="${q_pageData.nowPage == i}">
							<strong>${i}</strong>
						</c:when>
						<%-- 나머지 페이지의 경우 링크 적용함 --%>
						<c:otherwise>
							<a href="${pageUrl}" class="page-link" data-anchor="qna-container">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<%-- 다음 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 다음 그룹으로 이동 가능하다면? --%>
					<c:when test="${q_pageData.nextPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/mypage/my_opinion.do" var="nextPageUrl">
							<c:param name="q_page" value="${q_pageData.nextPage}" />
							<c:param name="page" value="${pageData.nowPage}" />
						</c:url>
						<a href="${nextPageUrl}" class="page-link" data-anchor="qna-container">[다음]</a>
					</c:when>
					<c:otherwise>
					[다음]
				</c:otherwise>
				</c:choose>
			</div>
	</div>
	</div>
</div>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${contextPath}/assets/js/my_opinion.js?time=${currentTime}"
	type="text/javascript" charset="utf-8"></script>
<script>
$(document).on("click", ".page-link", function(e) {
	e.preventDefault();
	const url = $(this).attr('href');
	//page 이동시 scroll 맨 위로 갈 div id값
	var anchor = "#"+$(this).attr('data-anchor');
	//div id의 상대 좌표
	var offset = $(anchor).offset().top;

	$("#psn_recommend_list").load(url, function(){
		//scrollTop 적용시 고정된 표의 th부분 아래로 이동해서 
		//div 맨 위로 보내기 위해 -100을 적용, 오른쪽은 속도 조절
		$("html, body").animate({scrollTop : offset-100}, 0);
	});
});
</script>