<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_orders.css?time=${currentTime}" />
	
<div class="content">
    <h2>미완료 주문</h2>
    <p class="total_cnt">전체 2,504건</p>
    <form name="uncmpl_form" id="uncmpl_form" method="POST">
    	<table class="manage_order_table">
    		<tr>
    			<th><input type="checkbox" name="all" class="check_all"></th>
    			<th>주문번호</th>
    			<th>처리상태</th>
    			<th>주문자 이메일</th>
    			<th>주문자 전화</th>
    			<th>받는분</th>
    			<th>주문금액</th>
    			<th>결제방법</th>
    			<th>주문일시</th>
    			<th>관리</th>
    		</tr>
    		<tr>
    			<td>
    				<input type="checkbox" name="uncmplItem" class="ab" value="">
    			</td>
    			<td>item.id</td>
    			<td>배송대기</td>
    			<td>surisulsul@gmail.com</td>
    			<td>01012345678</td>
    			<td>마수리</td>
    			<td>98,000원</td>
    			<td>무통장(국민)</td>
    			<td>2021-02-18 00:00:00</td>
    			<td>
    				<input type="submit" value="보기" onclick="javascript: form.action='/manage/update';" class="show_button"/>
    			</td>
    		</tr>
    		<tr>
    			<td>
    				<input type="checkbox" name="uncmplItem" class="ab" value="">
    			</td>
    			<td>item.id2</td>
    			<td>입금대기</td>
    			<td>surisulsul@gmail.com</td>
    			<td>01012345678</td>
    			<td>마수리</td>
    			<td>120,000원</td>
    			<td>카드</td>
    			<td>2021-02-19 00:00:00</td>
    			<td>
    				<a href="#" class="show_button">보기</a>
    			</td>
    		</tr>
    	</table>
    	<div class="submit_buttons">
    		<input type="submit" value="입금완료" onclick="javascript: form.action='/manage/update';" class="pay_button"/>
    		<input type="submit" value="배송완료" onclick="javascript: form.action='/manage/update';" class="send_button"/>
    	</div>
    </form>
    
    <!-- 페이지네이션 처리 -->
</div>

</body>

</html>