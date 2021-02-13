<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/best_items.css?time=${currentTime}" />
    
	<div class="best_items">
		<div class="item_contents">
			<span class="title">인기 많은 술 <span class="comment">회원분들이 자주 찾는 인기 상품입니다.</span></span>
			<ul class="item_list">
			<c:forEach var="item" items="${output}" varStatus="status">
			
				<li class="item_info">
					<%-- 상세페이지로 이동하기 위한 URL --%>
					<c:url value="/item_details.do" var="viewUrl">
						<c:param name="prodid" value="${item.id}" />
					</c:url>
					
					<a href="${viewUrl}">
						<c:if test="${status.count == 1}">
							<img class="best_ranking" src="${contextPath}/assets/img/items/first.png" />
						</c:if>
						<c:if test="${status.count == 2}">
							<img class="best_ranking rank2" src="${contextPath}/assets/img/items/second.png" />
						</c:if>
						<c:if test="${status.count == 3}">
							<img class="best_ranking rank3" src="${contextPath}/assets/img/items/third.png" />
						</c:if>
						
						<img class="item_img" src="${contextPath}/assets/img/items/${item.img}" /> <br/>
						<span class="item_title">${item.name}</span>
						<span class="item_price"><fmt:formatNumber value="${item.price}" pattern="#,###"/>원</span> <br/>
                    	<div class="clean"></div>
						<span class="item_rating">
							<c:set var="stars" value="${item.star}" />
							<c:choose>
							<c:when test="${stars != 0}">
								<c:forEach var="i" begin="1" end="${stars}">★</c:forEach>
								<c:if test="${stars} < 5">
									<c:forEach var="j" begin="${stars}" end="5">☆</c:forEach>
								</c:if>
							</c:when>
							<c:otherwise>☆☆☆☆☆</c:otherwise>
							</c:choose>
						</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#${item.type}</li>
							<li class="item_tag item_area_tag">#${item.loc}</li>
							<li class="item_tag item_keyword_tag">#${item.key1}</li>
						</ul>
					</a>
				</li>
				
				</c:forEach>
			</ul>
			<div class="clean"></div>
		</div>
		
	</div>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
