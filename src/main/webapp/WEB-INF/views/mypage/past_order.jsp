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

<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/common.css?time=${currentTime}" />


<div id="order-container">
	<div class="psn_past_order">
		<div class="psn_title">
			<h2 class="psn_title_txt">구매했어요</h2>
		</div>
	</div>
	<c:choose>
		<%--c:when test 조건 -> 최근 주문 내역이 있는 경우 -> 주문 내역 DB 내용 존재 --%>
		<c:when test="${output.size()!=0 }">

			<div class="order_table">
				<table>
					<%-- 조회 결과에 따른 반복 처리 --%>
					<c:forEach var="item" items="${output }" varStatus="status">
						<c:if
							test="${status.index==0 || output.get(status.index-1).o_id!=item.o_id}">
							<tr>
								<th class="psn_order_date" colspan="4">주문날짜/번호 :
									${item.reg_date } / ${item.o_id }</th>
							</tr>
						</c:if>
						<tr>
							<td>
								<div class="table_min_height">
									<a
										href="${pageContext.request.contextPath }/item_details.do?prodid=${item.p_id}"
										class="item_thumb"> <img
										src="${contextPath}/assets/img/items/item${item.p_id }.jpg" />
									</a>
									<div class="order_item_info">
										<a
											href="${pageContext.request.contextPath }/item_details.do?prodid=${item.p_id}"
											class="item">
											<p class="order_item_name">${item.p_name }</p>
											<p class="order_item_price">
												<fmt:formatNumber value="${item.p_price }" pattern="#,###" />
												원
											</p>
										</a>
									</div>
								</div>
							</td>
							<td>${item.p_qty }</td>
							<td><fmt:formatNumber value="${item.p_price * item.p_qty}"
									pattern="#,###" />원</td>
							<c:choose>
								<c:when test="${item.pay_result=='Y' && item.send_result=='N' }">
									<td>상품준비중<br /> <a
										href="javascript:cancelOrder(${item.o_id});"
										class="cancel_order btn_nor" type="button">주문취소</a></td>
								</c:when>
								<c:when test="${item.pay_result=='N' && item.send_result=='N' }">
									<td>입금대기중<br /> <a
										href="javascript:cancelOrder(${item.o_id});"
										class="cancel_order btn_nor" type="button">주문취소</a></td>
								</c:when>
								<c:otherwise>
									<td>배송완료<br /> <a
										href="javascript:openPop(${item.p_id});"
										class="write_review btn_yellow">후기쓰기</a></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="pageNumber">
				<!-- 페이지 번호 구현 -->
				<%-- 이전 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/mypage/past_order.do" var="prevPageUrl">
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
					<c:url value="/mypage/past_order.do" var="pageUrl">
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
						<c:url value="/mypage/past_order.do" var="nextPageUrl">
							<c:param name="page" value="${pageData.nextPage}" />
						</c:url>
						<a href="${nextPageUrl}" class="page-link">[다음]</a>
					</c:when>
					<c:otherwise>
					[다음]
				</c:otherwise>
				</c:choose>
			</div>
		</c:when>
		<%--c:otherwise --> 주능 테스트 이력이 없는 경우 -> 주능 결과 DB에 데이터 X --%>
		<c:otherwise>

			<div class="psn_no_result">
				<img src="${contextPath}/assets/img/mark_alert.png" />
				<h3 class="psn_title_dsc">최근 주문 내역이 없습니다.</h3>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<script>
	//팝업열기
	function openPop(prodId) {
		var popup = window
				.open(
						'${pageContext.request.contextPath }/mypage/write_review.do?p_id='
								+ prodId, '후기쓰기',
						'width=700, height=960, toolbar=no, menubar=no, scrollbars=yes, resizable=no');
	}

	//주문취소
	function cancelOrder(orderId) {
		//확인, 취소버튼에 따른 후속 처리 구현
		swal({
			title : '정말 주문을 취소하시겠습니까?',
			text : "해당 상품이 포함된 주문이 전체 취소됩니다.",
			type : 'question',
			confirmButtonText : '네',
			showCancelButton : true,
			cancelButtonText : '아니오',
		})
				.then(
						function(result) {
							if (result.value) {
								/*swal({
								title : '주문 취소',
								text : "주문취소가 완료되었습니다.",
								type : 'success',
								confirmButtonText : '확인',
								}).then(function() {*/
								window.location = '${pageContext.request.contextPath }/order/delete_ok.do?orderId='
										+ orderId;
								/*});*/
							} else if (result.dismiss === 'cancel') {
								swal('확인', '주문이 그대로 진행됩니다.', 'success');
							}
						});
	}

	$(document).on("click", ".page-link", function(e) {
		e.preventDefault();
		const url = $(this).attr('href');
		console.log(url);

		$("#order-container").load(url, function() {
			$("html, body").scrollTop("#order-container");
		});
	});
</script>