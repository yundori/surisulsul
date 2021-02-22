<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


    <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/cscenter.css?time=${currentTime}" />
    <div class="collapse">
    	<c:choose>
    		<%-- 조회 결과가 없는 경우 --%>
			<c:when test="${output==null||fn:length(output)==0}">
				<hr />
				<div class="review_none">
					<table>
						<tr>
							<td><h1>작성된 공지사항이 없습니다.</h1></td>
						</tr>
					</table>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="item" items="${output}" varStatus="status">
					<div class='collapse-item'>
	            		<div class="collapse-title clearfix">
	                		<span class="article-number">${status.index+1}</span>
                			<a href="#content${status.index}">${item.title}</a>
                			<span class="reg-date">${item.reg_date}</span>
            			</div>
            			<div id="content${status.index}" class="content">${item.content}</div>
       				</div>
				</c:forEach>
				<div class="pageNumber">
				<!-- 페이지 번호 구현 -->
				<%-- 이전 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/cscenter/notice.do" var="prevPageUrl">
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
					<c:url value="/cscenter/notice.do" var="pageUrl">
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
						<c:url value="/cscenter/notice.do" var="nextPageUrl">
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
       
        <!-- 게시글이 많다면 페이지네이션 -->
    </div>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
    $(function() {
        $(".collapse-title a").click(function(e) {
            e.preventDefault();

            var target = $(this).attr('href');
            $(target).slideToggle(100);
            $(".content").not($(target)).slideUp(100);
        });
    });
    $(document).on("click", ".page-link", function(e) {
		e.preventDefault();
		const url = $(this).attr('href');
		console.log(url);

		$(".collapse").load(url, function() {
			$("html, body").scrollTop(".collapse");
		});
	});
    </script>

