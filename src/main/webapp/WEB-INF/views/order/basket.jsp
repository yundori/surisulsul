<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/order.css?time=${currentTime}" />
 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.css?time=${currentTime}" />

<div id="basket">
	<h1>장바구니 </h1>
	<c:choose>
		<%--c:when test 조건 -> 장바구니에 담아온 상품이 있는 경우 -> 장바구니 DB 내용 존재 --%>
		<c:when test="${result}">
			<form method="post" action="${pageContext.request.contextPath }/basket/delete_ok.do" name="basket_form" id="basket_form">
				<table id="basket_table">
					<tr>
						<td colspan="5" class="clearfix">
							<input type="checkbox" name="all" class="check_all" checked> 
							<label>전체선택</label>
							<button type="submit" id="delete_this">선택상품 삭제</button><!-- 컨트롤러로 연결 -> 장바구니 내 해당 아이템 지우고, 페이지 재출력 -->
						</td>
					</tr>
					<tr>
						<td></td>
						<td><b>상품</b></td>
						<td><b>가격</b></td>
						<td><b>수량</b></td>
						<td><b>총 가격</b></td>
					</tr>
    				<%-- 조회 결과에 따른 반복 처리 --%>
    				<c:forEach var="item" items="${output }" varStatus="status">
						<tr>
							<td>
								<input type="checkbox" name="basketItem" id="basket${item.id }" class="ab" value="${item.id }" checked>
							</td>
							<td id="left_align"><img src="${contextPath}/assets/img/items/item${item.p_id}.jpg" class="clearfix"/>${item.p_name}</td>
							<td><fmt:formatNumber value="${item.p_price }" pattern="#,###"/></td>
							<td>${item.qty }병</td>
							<td>${item.p_price * item.qty }원</td>
						</tr>
					</c:forEach>
				</table>
				
				<table id="basket_summary">
					<tr>
						<td><b>주문 상품 수</b></td>
						<td>${cnt }건</td>
					</tr>
					<tr>
						<td><b>배송비</b></td>
						<td>무료</td>
					</tr>
					<tr>
						<td><b>총 주문 금액</b></td>
						<td>${total_price }원</td>
					</tr>
				</table>
			</form>
			<a href="${pageContext.request.contextPath }/order.do" id="go_order">주문/결제 하기</a>
			<div id="go_order_comment" class="hidden">장바구니에 담긴 상품을 모두 선택 후 주문해주세요.</div>
		</c:when>
		<%--c:otherwise --> 장바구니에 아무 상품도 없는 경우 -> 장바구니 DB에 데이터 X --%>
		<c:otherwise>
			<table id="basket_table">
				<tr>
					<td colspan="5" class="clearfix">
						<input type="checkbox" name="all" class="check_all" disabled> 
						<label>전체선택</label>
						<a id="delete_this2">선택상품 삭제</a><!-- 비활성화이므로 href 일부러 안넣음 -->
					</td>
				</tr>
				<tr>
					<td></td>
					<td><b>상품</b></td>
					<td><b>가격</b></td>
					<td><b>수량</b></td>
					<td><b>총 가격</b></td>
				</tr>
				<tr>
					<td colspan="5">
						<h2>장바구니에 담긴 상품이 없습니다.</h2><br/>
					</td>
				</tr>
			</table>
			<a href="${pageContext.request.contextPath }/item_filtered.do" id="go_shopping">상품 담으러 가기</a><!-- index나 키워드선택 페이지로 이동 -->			
		</c:otherwise>
	</c:choose>
	
</div>
<script src="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/assets/plugins/validate/jquery.validate.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/assets/plugins/validate/additional-methods.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>

<script src="${contextPath}/assets/js/order.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>