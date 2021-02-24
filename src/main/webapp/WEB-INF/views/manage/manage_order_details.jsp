<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_orders.css?time=${currentTime}" />
	
<div class="content">
    <h2>주문상세 - (주문번호: ${order_details.o_id })</h2>
    
    <div class="manage_orders_count">
    현재 주문상태 
    <b>
    	<c:choose>
			<c:when test="${order_details.pay_result=='N' and order_details.send_result=='N'}">입금대기</c:when>
			<c:when test="${order_details.pay_result=='Y' and order_details.send_result=='N'}">입금완료</c:when>
			<c:when test="${order_details.pay_result=='Y' and order_details.send_result=='Y'}">배송완료</c:when>
		</c:choose>
    </b> | 
    주문일시 <b>${order_details.reg_date }</b> | 
    수정일시 <b>${order_details.edit_date }</b> | 
    주문총액 <b><fmt:formatNumber value="${order_details.price }" pattern="#,###"/>원</b>
    </div>
    
    <table class="manage_order_table">
    	<tr>
    		<th>상품명</th>
    		<th>상태</th>
    		<th>수량</th>
    		<th>판매가</th>
    		<th>소계</th>
    	</tr>
		<%-- 조회 결과에 따른 반복 처리 --%>
		<c:forEach var="item" items="${order_sub }" varStatus="status">
	    	<tr>
	    		<td class="product"><img src="${contextPath}/assets/img/items/item${item.p_id }.jpg" class="small_img"/>${item.p_name }</td>
	    		<td>
	    			<c:choose>
						<c:when test="${order_details.pay_result=='N' and order_details.send_result=='N'}">입금대기</c:when>
						<c:when test="${order_details.pay_result=='Y' and order_details.send_result=='N'}">입금완료</c:when>
						<c:when test="${order_details.pay_result=='Y' and order_details.send_result=='Y'}">배송완료</c:when>
					</c:choose>
				</td>
	    		<td>${item.p_qty }</td>
	    		<td class="price"><fmt:formatNumber value="${item.p_price }" pattern="#,###"/></td>
	    		<td class="price"><fmt:formatNumber value="${item.p_price * item.p_qty }" pattern="#,###"/></td>
	    	</tr>
    	</c:forEach>  	
    </table>
    
    <div class="manage_orders_count">
    	<b>결제 및 수령자 정보</b>
    </div>
    <table class="manage_order_table">
    	<tr>
    		<th>구매자명</th>
    		<th>구매자전화번호</th>
    		<th>수령자명</th>
    		<th>수령자 전화번호</th>
    		<th>수령자 주소</th>
    		<th>결제방식</th>
    	</tr>
    	
    	<tr>
    		<td>${order_details.b_name }</td>
    		<td>${order_details.b_phone }</td>
    		<td>${order_details.r_name }</td>
    		<td>${order_details.r_phone }</td>
    		<td>${order_details.r_address1 } ${order_details.r_address2 } (${order_details.r_postcode })</td>
    		<td>
    			<c:choose>
					<c:when test="${order_details.payment=='cash'}">무통장 : ${order_details.pay_cash }</c:when>
					<c:otherwise>카드</c:otherwise>
				</c:choose>
    		</td>
    	</tr>
    </table>
    <a href="${pageContext.request.contextPath}/manage_orders.do" class="go_list">목록으로</a>
    <a href="${pageContext.request.contextPath}/update_single.do?o_id=${order_details.o_id}&pay=${order_details.pay_result}&send=${order_details.send_result}" class="go_list">상태변경</a>
    
    <div class="warning">
    	※ 상태변경 시 입금대기 > 입금완료 > 배송완료 형식으로 업데이트 됩니다.
    </div>
</div>

</body>

</html>