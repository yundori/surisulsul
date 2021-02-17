<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="item_reviews">
	<div>
		<h3 class="title">
			이 술을 선택한 사람들의 이야기 <span>내가 찾은 술에 대한 후기는 어떨까?</span>
		</h3>
		<c:choose>
			<%-- 조회 결과가 없는 경우 --%>
			<c:when test="${output==null||fn:length(output)==0}">
				<hr />
				<div class="review_none">
					<table>
						<tr>
							<td><h1>상품 후기가 없습니다.</h1></td>
						</tr>
					</table>
				</div>
			</c:when>
			<c:otherwise>
				<%-- 조회 결과를 목록으로 받아오기 --%>
				<table>
					<c:forEach var="item" items="${output}" varStatus="status">
						<%-- 출력을 위한 상품 번호 --%>
						<c:set var="p_id" value="${item.p_id}"/>
					<tr>
						<td class="img_area">
							<%-- <c:choose> --%>
							<%-- <c:when 사진 db있으면 해당 사진 노출> --%>
							<img class="review_img" src="${contextPath}/surisulsul/assets/img/${item.rev_img}" />
							<%-- </c:if> --%>
							<%-- <c:otherwise 없으면 디폴트 이미지 사용> --%>
							<%-- </c:otherwise> --%>
							<%-- </c:choose> --%>
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
			</c:otherwise>
		</c:choose>
		<%-- 페이지네이션 영역 --%>
	</div>
</div>
