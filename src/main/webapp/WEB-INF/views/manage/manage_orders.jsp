<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_orders.css?time=${currentTime}" />
	
<div class="content">
    <h2>주문내역</h2>
    <div class="manage_orders_count">
    전체 <fmt:formatNumber value="${output.size() }" pattern="#,###"/>건
    </div>
    <form action="${pageContext.request.contextPath}/manage_orders.do" method="POST" name="manage_orders_form" id="manage_orders_form">
    	<div class="manage_orders_details">
	    	<label for="order_status"><b>주문상태</b></label>
	    	<input type="radio" name="order_status" value="all" <c:if test="${order_status=='all' or order_status==null}">checked</c:if> />전체
	    	<input type="radio" name="order_status" value="order_cmpl" <c:if test="${order_status == 'order_cmpl'}">checked</c:if>/>주문완료
	    	<input type="radio" name="order_status" value="pay_cmpl" <c:if test="${order_status == 'pay_cmpl'}">checked</c:if>/>입금완료
	    	<input type="radio" name="order_status" value="send_cmpl" <c:if test="${order_status == 'send_cmpl'}">checked</c:if>/>배송완료
    	</div>
    	
    	<div class="manage_orders_details">
	    	<label for="pay_method"><b>결제수단</b></label>
	    	<input type="radio" name="pay_method" value="all" <c:if test="${pay_method=='all' or pay_method==null}">checked</c:if>/>전체
	    	<input type="radio" name="pay_method" value="cash" <c:if test="${pay_method == 'cash'}">checked</c:if>/>무통장
	    	<input type="radio" name="pay_method" value="card" <c:if test="${pay_method == 'card'}">checked</c:if>/>카드
    	</div>
    	
    	<div class="manage_orders_details">
	    	<label for="date"><b>주문일자</b></label>
	    	<input type="date" name="from_date" <c:if test="${from_date!=null or from_date!=''}">value="${from_date }"</c:if>/> ~ 
	    	<input type="date" name="to_date" <c:if test="${to_date!=null or to_date!=''}">value="${to_date }"</c:if>/>
    	<button type="submit" class="search_button">조회</button>
    	</div>
    </form>
    <table class="manage_order_table">
    	<tr>
    		<th colspan="3">주문일-주문번호</th>
    		<th>주문자</th>
    		<th>주문자전화</th>
    		<th>받는분</th>
    		<th rowspan="2">주문합계</th>
    		<th rowspan="2">입금합계</th>
    		<th rowspan="2">미수금</th>
    		<th rowspan="2">상세보기</th>
    	</tr>
    	<tr>
    		<th>주문상태</th>
    		<th>결제수단</th>
    		<th>최근변경일</th>
    		<th colspan="2">주문상품수</th>
    		<th>누적주문수</th>
    	</tr>
    	<c:choose>
    		<c:when test="${output.size()>0 }">
				<%-- 조회 결과에 따른 반복 처리 --%>
		    	<c:forEach var="item" items="${output }" varStatus="status">
			    	<tr>
			    		<td colspan="3">${item.reg_date }-${item.o_id }</td>
			    		<td>${item.b_name }</td>
			    		<td>${item.b_phone }</td>
			    		<td>${item.r_name }</td>
			    		<td rowspan="2" class="price"><fmt:formatNumber value="${item.price }" pattern="#,###"/></td>
			    		<td rowspan="2" class="price">
			    			<c:choose>
			    				<c:when test="${item.pay_result=='Y' }"><fmt:formatNumber value="${item.price }" pattern="#,###"/></c:when>
			    				<c:otherwise>0</c:otherwise>
			    			</c:choose>
			    		</td>
			    		<td rowspan="2" class="price">
			    			<c:choose>
			    				<c:when test="${item.pay_result=='Y' }">-</c:when>
			    				<c:otherwise><fmt:formatNumber value="${item.price }" pattern="#,###"/></c:otherwise>
			    			</c:choose>
						</td>
			    		<td rowspan="2"><a href="${pageContext.request.contextPath}/manage_order_details.do?o_id=#{item.o_id}" class="show_button">보기</a></td>
			    	</tr>
			    	<tr>
			    		<td>
				    		<c:choose>
				    			<c:when test="${item.pay_result=='N' and item.send_result=='N'}">입금대기</c:when>
				    			<c:when test="${item.pay_result=='Y' and item.send_result=='N'}">입금완료</c:when>
				    			<c:when test="${item.pay_result=='Y' and item.send_result=='Y'}">배송완료</c:when>
				    		</c:choose>
			    		</td>
			    		<td>
				    		<c:choose>
				    			<c:when test="${item.payment=='cash'}">무통장</c:when>
				    			<c:otherwise>카드</c:otherwise>
				    		</c:choose>
				    	</td>
			    		<td>${item.edit_date }</td>
		    			<td colspan="2">3개</td>
		    			<td>${item.order_cnt }건</td>
			    	</tr> 
		    	</c:forEach>
	    	</c:when>
	    	<c:otherwise>
	    		<tr>
	    			<td rowspan="2" colspan="10">조회결과가 없습니다</td>
	    		</tr>
	    	</c:otherwise>
    	</c:choose>   	
    </table>
</div>

</body>

</html>