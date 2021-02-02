<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<div class="footer">
	<h1>
		<img src="${contextPath}/assets/img/logo.png" alt="footer_logo" />
	</h1>
	<br />
	<div class="sitemap">
		<ul>
			<li class="title"><a href="${pageContext.request.contextPath}/cscenter/cscenter_main.do">알립니다</a></li>
		</ul>
		<ul>
			<li class="title"><a href="${pageContext.request.contextPath}/cscenter/cscenter_main.do">자주 묻는 질문</a></li>
		</ul>
		<ul>
			<li class="title"><a href="${pageContext.request.contextPath}/item_filtered.do">내가 찾는 술</a></li>
		</ul>
		<ul>
			<li class="title"><a href="${pageContext.request.contextPath}/best_items.do">인기 많은 술</a></li>
		</ul>
		<ul class="sitemap_drink">
			<li class="title"><a href="#">우리 술 종류</a></li>
			<br />
			<li class="drink"><a href="${pageContext.request.contextPath}/takju.do">탁주</a></li>
			<li class="drink"><a href="${pageContext.request.contextPath}/fruit_drink.do">과실주</a></li>
			<li class="drink"><a href="${pageContext.request.contextPath}/cheongju.do">약주/청주</a></li>
			<li class="drink"><a href="${pageContext.request.contextPath}/spirits.do">증류주</a></li>
			<li class="drink"><a href="${pageContext.request.contextPath}/liquerurs.do">기타주류</a></li>
		</ul>
		<ul>
			<li class="title"><a href="${pageContext.request.contextPath}/juneung.do">주(酒)능 </a></li>
		</ul>
	</div>
	<div class="award">
		<img src="${contextPath}/assets/img/footer1_award.jpg" alt="어워드_1">
		<img src="${contextPath}/assets/img/footer2_award.jpg" alt="어워드_2">
	</div>
	<div class="info">
		<p>
			(주)수리술술 주식회사 대표이사:신예원,양세림,윤두리,정우주,정현수 TEL:1577-1234
			사업자등록번호:123-45-67890 개인정보 책임자:마수리 <br /> <br />
		<address>ⓒ2021 surisulsul Company.All Rights Reserved</address>
		</p>
	</div>
</div>
</body>

</html>