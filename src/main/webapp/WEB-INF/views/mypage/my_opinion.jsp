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

<div class="psn_recommend_list">

	<!-- ************나의 후기 ************ -->
	<div class="psn_title">
		<h2 class="psn_title_txt">나의 후기</h2>
	</div>
	<div class="psn_review_table">
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
											src="${contextPath}/assets/img/${review.rev_img}" />
										</a>
										<div class="review_item_info">
											<a href="#" class="item"> <c:set var="stars"
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
		<!--***** 여기에 PAGINATION 들어가야 함 *****-->
		<div class="delete_area">
			<a href="#" class="delete_this btn_nor">선택 삭제</a>
		</div>
	</div>



	<!-- ************나의 질문 ************ -->
	<div class="psn_title">
		<h2 class="psn_title_txt">나의 질문</h2>
	</div>
	<div class="psn_qna_table">
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
							<tr>
								<td><input type="checkbox" name="qnaItem"
									id="qna${qna.id }" class="cd" value="${qna.id }"></td>
								<td><a href="#">${qna.p_name }</a></td>
								<td>
									<div class="table_min_height">
										<div class="qna_item_info">
											<a href="#"> <%--분류 : c:choose와 c:when으로 나누기 --%> <span
												class="qna_area">[분류 : 대량구매]</span>
												<p class="qna_item_name">${qna.content }</p>
											</a>
										</div>
									</div>

								</td>
								<td>${qna.reg_date }</td>
								<%--처리상태 : c:choose와 c:when으로 나누기 --%>
								<td>답변 대기중</td>
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
		<!--***** 여기에 PAGINATION 들어가야 함 *****-->
		<div class="delete_area">
			<a href="#" class="delete_this btn_nor">선택 삭제</a>
		</div>
	</div>

</div>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${contextPath}/assets/js/my_opinion.js?time=${currentTime}"
	type="text/javascript" charset="utf-8"></script>