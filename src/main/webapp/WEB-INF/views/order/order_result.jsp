<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/order.css?time=${currentTime}" />

<div id="order_result">

	 <c:choose>
	 
 		<%-- 주문결과(result)가 true일 경우 (정상 주문 완료 시) --%>
    	<c:when test="${result }"> <!-- test에 들어갈 내용 ==> ${result==true} -->
    		<img src="${contextPath}/assets/img/order/order_success.png" id="result_icon"/>
    		<h1>감사합니다</h1>
    		<h2>정상적으로 주문이 완료되었습니다.<br/> 배송은 영업일 기준 2~3일 가량 소요됩니다.</h2>
    		<table id="order_result_table">
    			<tr>
    				<td>배송지</td>
    				<td><b>수리술</b><br/>010-1234-5678<br/>서울특별시 서초구 서초대로77길 55 에이프로스퀘어 3층</td>
    			</tr>
    			<tr>
    				<td>주문번호</td>
    				<td><b>20210118-주문번호어쩌고</b></td>
    			</tr>
    			<tr>
    				<td rowspan="2">주문상품</td>
    				<!--<c:forEach var="i" begin="${first }" end="${last }" varStatus="status">-->
    				<td><img src="${contextPath}/assets/img/items/best1.PNG"/>블루베리 생 막걸리 * 6병 (1개)</td>
    			</tr>
    			<tr>
    				<td><img src="${contextPath}/assets/img/items/best2.PNG"/>아이엠더문 오리지날/화이트 에디션 (2개)</td>
    				<!--</c:forEach>-->
    			</tr>    			
    		</table>
    		<a href="${pageContext.request.contextPath }/" id="go_mypage">구매내역</a>
    		<a href="${pageContext.request.contextPath }/" id="go_home">쇼핑 계속하기</a>
    	</c:when>
    	
    	<%-- 주문결과(result)가 false일 경우 (주문 처리 실패 / 오류 발생 시) --%>
    	<c:otherwise>
    		<img src="${contextPath}/assets/img/order/order_fail.png" id="result_icon"/>
    		<h1>죄송합니다</h1>
    		<h2>주문 처리 중 문제가 발생하였습니다.</h2>
    		<div id="blank"></div>
    		<a href="${pageContext.request.contextPath }/basket.do" id="go_basket">장바구니로 이동</a>
    	</c:otherwise>
    	
    </c:choose>
    
</div>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>