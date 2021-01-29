<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/order.css?time=${currentTime}" />

<div id="basket">
	<h1>장바구니</h1>
	<c:choose>
		<%--c:when test 조건 -> 장바구니에 담아온 상품이 있는 경우 -> 장바구니 DB 내용 존재 --%>
		<c:when test="true">
			<table id="basket_table">
				<tr>
					<td colspan="5" class="clearfix">
						<input type="checkbox" name="all" class="check_all"> 
						<label>전체선택</label>
						<a href="" id="delete_this">선택상품 삭제</a><!-- 컨트롤러로 연결 -> 장바구니 내 해당 아이템 지우고, 페이지 재출력 -->
					</td>
				</tr>
				<tr>
					<td></td>
					<td><b>상품</b></td>
					<td><b>가격</b></td>
					<td><b>수량</b></td>
					<td><b>총 가격</b></td>
				</tr>
				<!--<c:forEach var="i" begin="${first }" end="${last }" varStatus="status">-->
				<tr>
					<td><input type="checkbox" name="item1" id="item1" class="ab"></td>
					<td id="left_align"><img src="${contextPath}/assets/img/items/best1.PNG" class="clearfix"/>블루베리 생 막걸리 * 6병</td>
					<td>25,000</td>
					<td>1병</td>
					<td>25,000원</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="item2" id="item2" class="ab"></td>
					<td id="left_align"><img src="${contextPath}/assets/img/items/best2.PNG" class="clearfix"/>아이엠더문 오리지날/화이트 에디션</td>
					<td>59,000</td>
					<td>2병</td>
					<td>118,000원</td>
				</tr>
				<!--</c:forEach>-->
				<tr>
					<td colspan="5" class="clearfix">
						<input type="checkbox" name="all" class="check_all"> 
						<label>전체선택</label>
						<a href="" id="delete_this">선택상품 삭제</a>
					</td>
				</tr>
			</table>
			
			<table id="basket_summary">
				<tr>
					<td><b>총 상품 금액</b></td>
					<td>143,000원</td>
				</tr>
				<tr>
					<td><b>배송비</b></td>
					<td>무료</td>
				</tr>
				<tr>
					<td><b>총 주문 금액</b></td>
					<td>143,000원</td>
				</tr>
			</table>
			
			<a href="" id="go_order">주문/결제 하기</a>
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
			<a href="" id="go_shopping">상품 담으러 가기</a><!-- index나 키워드선택 페이지로 이동 -->			
		</c:otherwise>
	</c:choose>
	
</div>

<script src="${contextPath}/assets/js/order.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>