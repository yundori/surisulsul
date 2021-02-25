<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_orders.css?time=${currentTime}" />

<c:set var="gen_sum" value="0" />
<c:set var="cash_sum" value="0" />
<c:set var="card_sum" value="0" />
<c:set var="unpaid_sum" value="0" />

<div class="content">
    <h2>매출현황</h2>
    <form action="${pageContext.request.contextPath}/manage_sales.do" action="POST" name="sales_form" id="sales_form">
	    <div class="sales">
		    <span class="title"><b>일일매출</b></span>
		    <input type="date" name="day" id="day" value="${today }">
		    <label for="day">일 하루</label>
		    <table class="manage_order_table">
		    	<tr>
		    		<th>주문번호</th>
		    		<th>주문자</th>
		    		<th>주문금액</th>
		    		<th>무통장</th>
		    		<th>카드결제</th>
		    		<th>미수금</th>
		    	</tr>
		    	<%-- 조회 결과에 따른 반복 처리 --%>
		    	<c:forEach var="item" items="${dayOutput }" varStatus="status">
		    	<tr>
		    		<td>${item.o_id }</td>
		    		<td>${item.b_name }</td>
		    		<td class="price">
		    			<fmt:formatNumber value="${item.price }" pattern="#,###"/>
		    			<c:set var="gen_sum" value="${gen_sum+item.price }"/>
		    		</td>
		    		<c:choose>
		    			<c:when test="${item.payment=='cash' }">
		    				<td class='price'><fmt:formatNumber value="${item.price }" pattern="#,###"/></td>
		    				<td class='price'>0</td>
		    				<c:set var="cash_sum" value="${cash_sum+item.price }"/>
		    			</c:when>
		    			<c:otherwise>
		    				<td class='price'>0</td>
		    				<td class='price'><fmt:formatNumber value="${item.price }" pattern="#,###"/></td>
		    				<c:set var="card_sum" value="${card_sum+item.price }"/>
		    			</c:otherwise>
		    		</c:choose>
		    		<td class="unpaid">
		    			<c:choose>
		    				<c:when test="${item.pay_result=='N' }">
		    					<fmt:formatNumber value="${item.price }" pattern="#,###"/>
		    					<c:set var="unpaid_sum" value="${unpaid_sum+item.price }"/>
		    				</c:when>
		    				<c:otherwise>0</c:otherwise>
		    			</c:choose>
		    		</td>
		    	</tr>
		    	</c:forEach>
		    	<tr>
		    		<td colspan="2"><b>합계</b></td>
		    		<td class="price"><b><fmt:formatNumber value="${gen_sum }" pattern="#,###"/></b></td>
		    		<td class="price"><b><fmt:formatNumber value="${cash_sum }" pattern="#,###"/></b></td>
		    		<td class="price"><b><fmt:formatNumber value="${card_sum }" pattern="#,###"/></b></td>
		    		<td class="unpaid"><b><fmt:formatNumber value="${unpaid_sum }" pattern="#,###"/></b></td>
		    	</tr>
		    </table>
	    </div>
	    
	    <div class="sales">
		    <span class="title"><b>월간매출</b></span>
		    <input type="text" name="fromMonth" id="fromMonth" maxlength="6" size="6" value="202101">
		    <label for="fromMonth">월 ~ </label>
		    <input type="text" name="toMonth" id="toMonth" maxlength="6" size="6" value="202102">
		    <label for="toMonth">월</label>
		    <table class="manage_order_table">
		    	<tr>
		    		<th>주문월</th>
		    		<th>주문수</th>
		    		<th>주문금액합계</th>
		    		<th>무통장</th>
		    		<th>카드결제</th>
		    		<th>미수금</th>
		    	</tr>
		    	<tr>
		    		<td>item.regdate</td>
		    		<td>item.cnt</td>
		    		<td class="price">item.price</td>
		    		<td class="price">item.price</td>
		    		<td class="price">0</td>
		    		<td class="unpaid">item.price</td>
		    	</tr>
		    	<tr>
		    		<td>item.regdate</td>
		    		<td>item.cnt</td>
		    		<td class="price">item.price2</td>
		    		<td class="price">0</td>
		    		<td class="price">item.price2</td>
		    		<td class="unpaid">0</td>
		    	</tr>
		    	<tr>
		    		<td><b>합계</b></td>
		    		<td><b>item.cntsum</b></td>
		    		<td class="price"><b>item.sum</b></td>
		    		<td class="price"><b>item.sum2</b></td>
		    		<td class="price"><b>item.sum3</b></td>
		    		<td class="unpaid"><b>item.unpaidsum</b></td>
		    	</tr>
		    </table>
	    </div>
	    
	    <div class="sales">
		    <span class="title"><b>연간매출</b></span>
		    <input type="text" name="fromYear" id="fromYear" maxlength="4" size="4" value="2020">
		    <label for="fromYear">년 ~ </label>
		    <input type="text" name="toYear" id="toYear" maxlength="4" size="4" value="2021">
		    <label for="toYear">년</label>
		    <table class="manage_order_table">
		    	<tr>
		    		<th>주문년도</th>
		    		<th>주문수</th>
		    		<th>주문금액합계</th>
		    		<th>무통장</th>
		    		<th>카드결제</th>
		    		<th>미수금</th>
		    	</tr>
		    	<tr>
		    		<td>item.regdate</td>
		    		<td>item.cnt</td>
		    		<td class="price">item.price</td>
		    		<td class="price">item.price</td>
		    		<td class="price">0</td>
		    		<td class="unpaid">item.price</td>
		    	</tr>
		    	<tr>
		    		<td>item.regdate</td>
		    		<td>item.cnt</td>
		    		<td class="price">item.price2</td>
		    		<td class="price">0</td>
		    		<td class="price">item.price2</td>
		    		<td class="unpaid">0</td>
		    	</tr>
		    	<tr>
		    		<td><b>합계</b></td>
		    		<td><b>item.cntsum</b></td>
		    		<td class="price"><b>item.sum</b></td>
		    		<td class="price"><b>item.sum2</b></td>
		    		<td class="price"><b>item.sum3</b></td>
		    		<td class="unpaid"><b>item.unpaidsum</b></td>
		    	</tr>
		    </table>
	    </div>
	    
	    <div class="submit_buttons">
	    	<input type="submit" value="매출 현황 보기" class="pay_button"/>
	    </div>
	    
    </form>
</div>

<script src="${contextPath}/assets/js/common.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<script>
$(document).ready(function() {
	$('#day').val(new Date().toISOString().substring(0, 10));
});
</script>

</body>

</html>