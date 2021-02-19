<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_orders.css?time=${currentTime}" />
	
<div class="content">
    <h2>매출현황</h2>
    <form action="" action="POST" name="sales_form" id="sales_form">
	    <div class="sales">
		    <span class="title"><b>일일매출</b></span>
		    <input type="date" name="day" id="day">
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
		    	<tr>
		    		<td>item.id</td>
		    		<td>item.b_name</td>
		    		<td class="price">item.price</td>
		    		<td class="price">item.price</td>
		    		<td class="price">0</td>
		    		<td class="unpaid">item.price</td>
		    	</tr>
		    	<tr>
		    		<td>item.id2</td>
		    		<td>item.b_name</td>
		    		<td class="price">item.price2</td>
		    		<td class="price">0</td>
		    		<td class="price">item.price2</td>
		    		<td class="unpaid">0</td>
		    	</tr>
		    	<tr>
		    		<td colspan="2"><b>합계</b></td>
		    		<td class="price"><b>item.sum</b></td>
		    		<td class="price"><b>item.sum2</b></td>
		    		<td class="price"><b>item.sum3</b></td>
		    		<td class="unpaid"><b>item.unpaidsum</b></td>
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