<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/mypage_detail.css?time=${currentTime}" />

<div class="psn_recommend">
<c:choose>
		<%--c:when test 조건 -> 주능 테스트 이력이 있는 경우 -> 주능 결과 DB 내용 존재 --%>
		<c:when test="false">
	<div class="psn_title">
		<h2 class="psn_title_txt">나의 주(酒)능 결과 : Flower_type</h2>
		<h3 class="psn_title_dsc">Drink_type 을 좋아하는 당신을 위해 추천하는 술</h3>
		<div class="psn_keyword">
			<a class="psn_keyword1" href=#>#keyword1</a>
			<a class="psn_keyword2" href=#>#keyword2</a>
			<a class="psn_keyword3" href=#>#keyword3</a>
			<a class="psn_keyword4" href=#>#keyword4</a>
		</div>
	</div>
	
	<div class="psn_result">
	<ul class="psn_result_inner">
		<li class="pick_item"><a href="#" class="pick_link"> <span
				class="psn_pick_bg psn_pick1"></span> <span class="psn_pick_text">
					<h3 class="psn_pick_title">상품명</h3>
					<p class="psn_pick_price">00,000원</p>
			</span>
		</a></li>
		<li class="pick_item"><a href="#" class="pick_link"> <span
				class="psn_pick_bg psn_pick2"></span> <span class="psn_pick_text">
					<h3 class="psn_pick_title">상품명</h3>
					<p class="psn_pick_price">00,000원</p>
			</span>
		</a></li>
		<li class="pick_item"><a href="#" class="pick_link"> <span
				class="psn_pick_bg psn_pick3"></span> <span class="psn_pick_text">
					<h3 class="psn_pick_title">상품명</h3>
					<p class="psn_pick_price">00,000원</p>
			</span>
		</a></li>
		<li class="pick_item"><a href="#" class="pick_link"> <span
				class="psn_pick_bg psn_pick4"></span> <span class="psn_pick_text">
					<h3 class="psn_pick_title">상품명</h3>
					<p class="psn_pick_price">00,000원</p>
			</span>
		</a></li>
	</ul>
	</div>
	</c:when>
		<%--c:otherwise --> 주능 테스트 이력이 없는 경우 -> 주능 결과 DB에 데이터 X --%>
		<c:otherwise>
		<div class="psn_title">
		<h2 class="psn_title_txt">나의 주(酒)능 결과</h2>
	</div>
	<div class="psn_no_result">
		<img src="${contextPath}/assets/img/mypage/mark_alert.png"/>
		<h3 class="psn_title_dsc">
		아직 주(酒)능 응시 기록이 없습니다<br/>
		<span class="psn_gotest">나만을 위한 술을 추천받기 위해 술학능력시험:주(酒)능을 응시하러 가볼까요? </span>
		</h3>
		<a href="${contextPath}/extra/juneung.jsp" class="btn_yellow">👉1분 만에 보는 주(酒)능</a>
		<%--나중에 윗 줄 <a> 주소 수정 --%>
	</div>
		</c:otherwise>
</c:choose>
</div>
