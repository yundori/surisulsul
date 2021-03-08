<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/manage_raq.css?time=${currentTime}" />
 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.css?time=${currentTime}" />
<div class="content">
	<h1>소비자 후기 관리</h1>
	<br />
	<br />
	<br />
	
	<%-- 검색 폼 --%>
	<form action="${pageContext.request.contextPath}/manage_review.do">
		<select name="type" id="type">
			<option value="0" <c:if test="${type==0}">selected</c:if>>검색분류</option>
			<option value="1" <c:if test="${type==1}">selected</c:if>>상품명</option>
			<option value="2" <c:if test="${type==2}">selected</c:if>>이름</option>
		</select>
		<input type="search" name="keyword" id="keyword" placeholder="상품명or이름 검색" value="${keyword}"/>
		<button type="submit">검색</button>
	</form>
	
	<%-- 조회 결과 --%>
	<form name="m_review_form" class="item_reviews" id="m_review_form" action="${pageContext.request.contextPath}/review">
		<table class="manage_review_table">
			<c:choose>
			<%-- 조회 결과가 없는 경우 --%>
			<c:when test="${output==null||fn:length(output)==0}">
				<hr />
				<div class="review_none">
					<table>
						<tr>
							<td><h1>조건에 해당하는 후기가 없습니다.</h1></td>
						</tr>
					</table>
				</div>
			</c:when>
			<c:otherwise>
				<%-- 조회 결과를 목록으로 받아오기 --%>
				<table>
				<tr>
				<th><input type="checkbox" name="all" class="check_all"></th>
				<th>이미지</th>
    			<th>후기 내용</th>
    			<th>작성 정보</th>
				</tr>
					<c:forEach var="item" items="${output}" varStatus="status">
						<%-- 출력을 위한 상품명 / 이름 --%>
						<c:set var="p_name" value="${item.p_name}"/>
						<c:set var="m_name" value="${item.m_name}"/>
					<tr>
						<td><input type="checkbox" name="cs_review" class="ab" value="${item.id}"></td>
						<td class="img_area">
						<img class="review_img" src="${contextPath}/surisulsul/assets/upload/${item.rev_img}" />
						</td>
						<td class="content_area">
							<h4 class="content_item">${item.p_name}</h4>
							<div class="content_text">${item.content}</div>
						</td>
						<td class="userinfo_area">
							<h4 class="user_id_filter">${item.m_name}</h4>
							<h4 class="reivew_date">${item.reg_date}</h4>
							<h4 class="review_rating_text">평점</h4>
							
							<h4 class="review_rating">
							<c:forEach var="i" begin="1" end="${item.star}" step="1">★</c:forEach><c:forEach var="i" begin="1" end="${5-item.star}" step="1">☆</c:forEach>
							</h4>
						</td>
					</tr>
					</c:forEach>
				</table>
				<input type="submit" value="삭제" onclick="" class="delete_btn" />
				<div class="pageNumber">
				<!-- 페이지 번호 구현 -->
				<%-- 이전 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/manage_review.do" var="prevPageUrl">
							<c:param name="page" value="${pageData.prevPage}" />
							<c:param name="type" value="${type}" />
						<c:param name="keyword" value="${keyword}" />
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
					<c:url value="/manage_review.do" var="pageUrl">
						<c:param name="page" value="${i}" />
						<c:param name="type" value="${type}" />
						<c:param name="keyword" value="${keyword}" />
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
						<c:url value="/manage_review.do" var="nextPageUrl">
							<c:param name="page" value="${pageData.nextPage}" />
							<c:param name="type" value="${type}" />
						<c:param name="keyword" value="${keyword}" />
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
		</table>
	</form>
	
</div>
<!--Google CDN 서버로부터 jQuery 참조 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    <script src="${contextPath}/assets/js/jquery.barrating.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
    <script src="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
$(function() {
    // #m_review_form에 대한 submit이벤트를 가로채서 Ajax요청을 전송한다.
    $("#m_review_form").ajaxForm({
        // 전송 메서드 지정
        method: "DELETE",
        // 서버에서 200 응답을 전달한 경우 실행됨
        success: function(json) {
            console.log(json);
            
            // json에 포함된 데이터를 활용하여 상세페이지로 이동한다.                
            if (json.rt == "OK") {
            	swal({
                    title: "후기 관리",
                    text: "선택하신 후기가 삭제되었습니다.",
                    type: "success"
                }).then((value)=>{
                	window.location = '${pageContext.request.contextPath}/manage_review.do';
                	                	
                });                   
            } else {
            	swal({
                    title: "후기 삭제",
                    text: "후기 삭제에 실패했습니다. 다시 시도해주세요.",
                    type: "error"
                });
            }
        }
    });
});
</script>
