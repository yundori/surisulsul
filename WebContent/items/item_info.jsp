<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%-- 
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>--%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/item_info.css?time=${currentTime}" />

<div class="item_info">
	<div>
		<h3 class="title">
			수리술술의 술 이야기 <span>내가 찾은 술은 어떤 술일까?</span>
		</h3>
		<div class="taste">
			<h4>맛과 향</h4>
			<div class="sugar">
				<h5>당도</h5>
				<div class="sugar_counts">
					<c:forEach var="i" begin="1" end="4" varStatus="status">
						<div class="sugar_count">sugar</div>
					</c:forEach>
				</div>
			</div>
			<div class="acidity">
				<h5>산미</h5>
				<div class="acidity_counts">
					<c:forEach var="i" begin="1" end="2" varStatus="status">
						<div class="acidity_count">acidity</div>
					</c:forEach>
				</div>
			</div>
			<div class="alcohol_degree">
				<h5>도수</h5>
				<div class="alcohol_degree_counts">
					<c:forEach var="i" begin="1" end="6" varStatus="status">
						<div class="alcohol_degree_count">alcohol_degree</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<div class="item_keyword_lists">
			<ul class="keyword_lists_ul">
				<li class="keyword_lists_li type_li">#종류</li>
				<li class="keyword_lists_li area_li">#지역</li>
				<li class="keyword_lists_li incense1_li">#향1</li>
				<li class="keyword_lists_li incense2_li">#향2</li>
			</ul>
		</div>

		<div class="jn_result">
			<h4>주로 찾는 사람들</h4>
			<img src="../assets/img/juneung/sunny.png" />
			<ul>
				<li>이런 타입의 사람들이 많이 찾습니다!</li>
				<li>주능 테스트 타입 요약 항목1</li>
				<li>주능 테스트 타입 요약 항목2</li>
				<li>주능 테스트 타입 요약 항목3</li>
			</ul>
		</div>
		<div class="clear"></div>

		<div class="item_info_suri">
			<h4>고도리 복숭아와인은...?</h4>
			<p>고도리 복숭아와인은 GAP 인증을 받은 황도와 백도를 반씩 사용해 만든 스위트 와인입니다. 병에 붙여져 있는
				라벨의 복숭아 그림만으로도 무슨 맛일지 예상가는데요. 색깔은 연주황색과 약간의 금색을 띄고 있습니다. 향을 맡아보면 복숭아
				통조림을 딱 열었을 때 느껴지는 복숭아의 농익은 달콤한 향기가 입맛을 돋우는데요. 맛을 보면 입안 가득 복숭아의 향과 맛을
				느낄 수 있습니다. 등등</p>
		</div>

		<div class="suri_rules">
			<h4>판매 정책 안내 (모든 상품 공통, 교환/반품)</h4>
			<p>
				<b>수리술술에서 판매하는 주류 제품의 경우</b><br/>
				발송과 동시에 재발송하기 어려운 상품으로 단순 변심, 오주문, 주소불명, 수취인 부재 등 고객 사유로 인한 교환 및 반품이 불가합니다.<br/>
				구매하시기 전 확인 후 구매하시기 바랍니다.<br/><br/>
				
				※ 아래의 법률에 따라 구매 후 출고처리 전 주문 취소가 가능합니다.<br/><br/>
				
				<b>신용카드 가맹점 법률 제8조 (계약의 철회 및 항변)</b><br/>
				가맹점은 할부거래에 관한 법률, 방문판매 등에 관한 법률, 전자상거래 등에서의 소비자 보호에 관한 법률 등에 따라<br/>
				계약에 관한 회원의 철회가 인정되는 거래에 대해서는 관계 법령에서 정한 반에 따라 회원이 철회를 요청하는 경우 이를 수용하여야 한다.
			</p>
		</div>

	</div>
</div>

<%-- 
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%> --%>