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
    				<td><b>${orderInfo.r_name }</b><br/>${orderInfo.r_phone }<br/>${orderInfo.r_address1 } ${orderInfo.r_address2 }</td>
    			</tr>
    			<tr>
    				<td>주문번호</td>
    				<td><b>${orderInfo.o_id}</b></td>
    			</tr>
    		<%-- 조회 결과에 따른 반복 처리 --%>
    		<c:forEach var="item" items="${orderSubList }" varStatus="status">
    			<tr>
    				<td></td>
    				<td><img src="${contextPath}/assets/img/items/item${item.p_id}.jpg"/>${item.p_name } (${item.p_qty }개)</td>
    			</tr>
    		</c:forEach>
    		</table>
    		<a href="${pageContext.request.contextPath }/mypage/mypage.do" id="go_mypage">구매내역</a>
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