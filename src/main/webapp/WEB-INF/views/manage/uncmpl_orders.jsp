<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_orders.css?time=${currentTime}" />
	
<div class="content">
    <h2>미완료 주문</h2>
    <p class="total_cnt">전체 <fmt:formatNumber value="${output.size() }" pattern="#,###"/>건</p>
    <form name="uncmpl_form" id="uncmpl_form" method="POST">
    	<table class="manage_order_table">
    		<tr>
    			<th><input type="checkbox" name="all" class="check_all"></th>
    			<th>주문번호</th>
    			<th>처리상태</th>
    			<th>주문자</th>
    			<th>주문자 전화</th>
    			<th>받는분</th>
    			<th>주문금액</th>
    			<th>결제방법</th>
    			<th>주문일시</th>
    			<th>관리</th>
    		</tr>
    		<%-- 조회 결과에 따른 반복 처리 --%>
		    <c:forEach var="item" items="${output }" varStatus="status">
	    		<tr>
	    			<td>
	    				<input type="checkbox" name="uncmplItem" class="ab" value="${item.o_id }">
	    			</td>
	    			<td>${item.o_id }</td>
	    			<td>
						<c:choose>
				    		<c:when test="${item.pay_result=='N' and item.send_result=='N'}">입금대기</c:when>
				    		<c:when test="${item.pay_result=='Y' and item.send_result=='N'}">입금완료</c:when>
				    		<c:when test="${item.pay_result=='Y' and item.send_result=='Y'}">배송완료</c:when>
				    	</c:choose>
					</td>
	    			<td>${item.b_name }</td>
	    			<td>${item.b_phone }</td>
	    			<td>${item.r_name }</td>
	    			<td><fmt:formatNumber value="${item.price }" pattern="#,###"/>원</td>
	    			<td>
	    				<c:choose>
				    		<c:when test="${item.payment=='cash'}">무통장</c:when>
				    		<c:otherwise>카드</c:otherwise>
				    	</c:choose>
	    			</td>
	    			<td>${item.reg_date }</td>
	    			<td>
	    				<a href="${pageContext.request.contextPath}/manage_order_details.do?o_id=${item.o_id}" class="show_button">보기</a>
	    			</td>
	    		</tr>
    		</c:forEach>
    	</table>
    	<div class="submit_buttons">
    		<input type="button" value="입금완료" onclick="mySubmit(1)" class="pay_button"/>
    		<input type="button" value="배송완료" onclick="mySubmit(2)" class="send_button"/>
    	</div>
    </form>
    
    <!-- 페이지네이션 처리 -->
</div>
<script>
	//체크박스 모두 선택 처리
	$( '.check_all' ).click( function() {
		 var chk = $(".check_all").prop("checked");
		 if(chk) {
		  $(".ab").prop("checked", true);
		 } else {
		  $(".ab").prop("checked", false);
		 }
	} );
	
	// 체크박스 개별적으로 선택 시 모두 체크인지 확인해서 .check_all에도 자동 선택처리 되도록
	$( '.ab' ).click( function() {
		var uncmplItem = $('input:checkbox[name=uncmplItem]').length;
		var selectedUncmplItem = $('input:checkbox[name=uncmplItem]:checked').length;
		
		if(uncmplItem != selectedUncmplItem) {
			$(".check_all").prop("checked", false);
	     	
	    }else{
	    	console.log('basketItem==selectedBasketItem');
		  	$(".check_all").prop("checked", true);
	    }	    
	} );
	
	// form 태그의 action을 부여
	function mySubmit(index){
		if(index==1){
			console.log('mySubmit 인덱스=1 들어왔습니다.');
			$('#uncmpl_form').attr('action', '${pageContext.request.contextPath}/manage/update_pay.do');
			console.log($('#uncmpl_form').attr('action'));
		}else{
			console.log('mySubmit 인덱스=2 들어왔습니다.');
			$('#uncmpl_form').attr('action', '${pageContext.request.contextPath}/manage/update_send.do');
			console.log($('#uncmpl_form').attr('action'));
		}
		$('#uncmpl_form').submit();
	}
</script>

</body>

</html>