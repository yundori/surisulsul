<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/item_reviews,question.css?time=${currentTime}" /> --%>

<div class="item_question">
	<div>
		<div class="header">
			<h3 class="title">
			이 술에 대해 궁금하다면 <span>상품에 대한 문의를 남길 수 있습니다.</span>
			</h3>
		
			<a href="javascript:openPop(${p_id});" class="write_question_btn">문의 작성</a>
		</div>
		
		<div class="question_lists">
			<div class="question_list_head">
				<span class="que_number">번호</span>
				<span class="que_type">문의 유형</span>
				<div class="que_content">문의 내용</div>
				<span class="que_answer">답변 상태</span>
				<span class="que_date">작성 일시</span>
			</div>

			<c:choose>
			<%-- 조회 결과가 없는 경우 --%>
			<c:when test="${output==null||fn:length(output)==0}">
				<hr />
				<div class="review_none">
					<table>
						<tr>
							<td><h1>상품 문의가 없습니다.</h1></td>
						</tr>
					</table>
				</div>
			</c:when>
			<c:otherwise>
			<c:forEach var="item" items="${output}" varStatus="status">
				<%-- 출력을 위한 상품 번호 --%>
				<c:set var="p_id" value="${item.p_id}"/>
			
			<div class="question_list">
				<div class="question_default">
					<span class="que_number">${status.index+1}</span>
					<span class="que_type">
					<c:choose>
					<c:when test="${item.type==1}">
					상품 문의
					</c:when>
					<c:when test="${item.type==2}">
					배송 문의
					</c:when>
					<c:when test="${item.type==3}">
					대량 구매
					</c:when>
					<c:when test="${item.type==4}">
					기타 문의
					</c:when>
					<c:otherwise>
					분류 없음
					</c:otherwise>
					</c:choose>
					
					</span>
					<div class="que_content">${item.p_name}</div>
					<span class="que_answer"><c:choose><c:when test="${item.status=='Y'}">답변완료</c:when><c:otherwise>대기중</c:otherwise></c:choose></span>
					<span class="que_date">${item.reg_date}</span>
					<div class="question_detail">
						<span>${item.content}</span>
					</div>
				</div>
			</div>
			</c:forEach>
			<div class="pageNumber">
				<!-- 페이지 번호 구현 -->
				<%-- 이전 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/item_reviews.do/${p_id}" var="prevPageUrl">
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
					<c:url value="/item_reviews.do/${p_id}" var="pageUrl">
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
						<c:url value="/item_reviews.do/${p_id}" var="nextPageUrl">
							<c:param name="page" value="${pageData.nextPage}" />
						</c:url>
						<a href="${nextPageUrl}" class="page-link">[다음]</a>
					</c:when>
					<c:otherwise>
					[다음]
				</c:otherwise>
				</c:choose>
			</div>
			</c:otherwise>
			</c:choose>
		</div>
		<%-- 페이지네이션 영역 --%>
	</div>
</div>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
//팝업열기
function openPop(prodId) {
	var popup = window
			.open('${pageContext.request.contextPath }/items/write_question.do?p_id='
							+ prodId, '문의작성',
					'width=700, height=960, toolbar=no, menubar=no, scrollbars=yes, resizable=no');
}
    $(function() {
        $(".question_default").click(function(e) {
            e.preventDefault();
            
            var target = $(this).find(".question_detail");
            $(target).slideToggle(200);
        });
    });
    
    $(document).on("click", ".page-link", function(e) {
    	e.preventDefault();
    	const url = $(this).attr('href');
    	console.log(url);

    	$(".item_question").load(url, function() {
    		$("html, body").scrollTop(".item_question");
    	});
    });
</script>