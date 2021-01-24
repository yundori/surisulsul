<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/index.css" />
<!-- ========== 컨텐츠 영역 시작 ========== -->
<div class="content">
	<!-- 1. 메인배너 3개 -> 슬라이드 화살표, 버튼 구현 -->
	<div id="main_banner">
		<div id="slides">
			<ul class="slides-container">
				<!-- 슬라이드 1 -->
				<li><a href="${contextPath}"><img
						src="${contextPath}/assets/img/index/ex.jpg" alt="로고" /></a>
				</li>
				<!-- 슬라이드 2 -->
				<li><a href="${contextPath}"><img
						src="${contextPath}/assets/img/index/main_banner2.png" alt="로고" /></a>
				</li>
				<!-- 슬라이드 3 -->
				<li><a href="${contextPath}"><img
						src="${contextPath}/assets/img/index/main_banner3.png" alt="로고" /></a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 2. 주능 테스트 결과
        1. 로그인 ok , 테스트 ok -> 주능 결과에 맞게 요약 보여줌
        2. 로그인 ok , 테스트 x -> 주능 테스트 해보세요 ! 배너 띄움 -->
	<c:choose>
		<%-- 여기서 test에 들어가있는 첫번째 true의 의미 = 로그인 여부 (로그인 되어있으면 true)
			test에 들어가있는 두번째 boolean값의 의미 = 로그인 된 사용자의 주능 테스트 이력 여부 (테스트한적 있으면 true) 
		 --%>
		<c:when test="true">
			<%-- 로그인 여부가 true이고, 동시에 본 사용자의 주능 테스트 이력 역시 true(주능 본적 있음)일 때 index에 출력할 내용 --%>
			<div class="main_best">
		<h1>취향에 맞는 술을 추천해드려요 ! </h1>
		<!-- 밑의 a 태그 경로는 임시 설정입니다 ! 추후 세부 페이지가 생기면 변경 -->
		<a href="${contextPath}/extra/juneung.jsp">
		<div class="main_best_img" id="best_img1">
			<img src="${contextPath}/assets/img/mypage/rec_01.jpg" alt="추천하는술1" />
			<div class="over">
				<div class="main_best_over">
					<span class="over_title">상품명 입력</span>
					<p class="over_des">00,000원</p>
				</div>
			</div>
		</div>
		</a>
		<!-- 밑의 a 태그 경로는 임시 설정입니다 ! 추후 세부 페이지가 생기면 변경 -->
		<a href="${contextPath}/extra/juneung.jsp">
		<div class="main_best_img" id="best_img2">
			<img src="${contextPath}/assets/img/mypage/rec_02.jpg" alt="추천하는술2" />
			<div class="over">
				<div class="main_best_over">
					<span class="over_title">상품명 입력</span>
					<p class="over_des">00,000원</p>
				</div>
			</div>
		</div>
		</a>
		<!-- 밑의 a 태그 경로는 임시 설정입니다 ! 추후 세부 페이지가 생기면 변경 -->
		<a href="${contextPath}/extra/juneung.jsp">
		<div class="main_best_img" id="best_img3">
			<img src="${contextPath}/assets/img/mypage/rec_03.jpg" alt="추천하는술3" />
			<div class="over">
				<div class="main_best_over">
					<span class="over_title">상품명 입력</span>
					<p class="over_des">00,000원</p>
				</div>
			</div>
		</div>
		</a>
		<!-- 밑의 a 태그 경로는 임시 설정입니다 ! 추후 세부 페이지가 생기면 변경 -->
		<a href="${contextPath}/extra/juneung.jsp">
		<div class="main_best_img" id="best_img4">
			<img src="${contextPath}/assets/img/mypage/rec_04.jpg" alt="추천하는술4" />
			<div class="over">
				<div class="main_best_over">
					<span class="over_title">상품명 입력</span>
					<p class="over_des">00,000원</p>
				</div>
		</div>
	</div>
	</a>
	<button type="button" class="login_ok_button1" onclick="location.href='${contextPath}/mypage/mypage.jsp'">결과 자세히 보기</button>
		<button type="button" class="login_ok_button2" onclick="location.href='${contextPath}/extra/juneung.jsp'">주능 다시하기</button>
	</div>
		</c:when>
		<c:otherwise>
			<%-- 로그인 여부가 false이던지, 로그인이 true여도 주능결과가 없을 경우 index에 출력되는 내용 
				주능을 보시겠습니까? + 주능보러가기 버튼 --%>
			<div class="juneung_empty">
				<div class="test_img">
					<a href="${contextPath}"><img
						src="${contextPath}/assets/img/index/main_banner3.png"
						alt="주능 테스트배너" /></a>
					<p class="test_text">
						아직 당신을 위한 술을 추천 받지 못하셨나요? <br /> 
						지금 바로 주능 테스트를 해보세요 ! <br />
						<button type="button" class="login_no_button" onclick="location.href='${contextPath}/extra/juneung.jsp'">주능 테스트하기</button>
					</p>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<!-- 3. 인기 많은 술best !
         상품에 hover 시, 이미지 어두워지고 가격과 상품명 노출 -->
	<div class="main_best">
		<h1>인기 많은 술</h1>
		<!-- 밑의 a 태그 경로는 임시 설정입니다 ! 추후 세부 페이지가 생기면 변경 -->
		<a href="${contextPath}/extra/juneung.jsp">
		<div class="main_best_img" id="best_img1">
			<img src="${contextPath}/assets/img/items/best1.PNG" alt="인기많은술1" />
			<div class="over">
				<div class="main_best_over">
					<span class="over_title">고도리 복숭아 와인</span>
					<p class="over_des">35,000원</p>
				</div>
			</div>
		</div>
		</a>
		<!-- 밑의 a 태그 경로는 임시 설정입니다 ! 추후 세부 페이지가 생기면 변경 -->
		<a href="${contextPath}/extra/juneung.jsp">
		<div class="main_best_img" id="best_img2">
			<img src="${contextPath}/assets/img/items/best2.PNG" alt="인기많은술2" />
			<div class="over">
				<div class="main_best_over">
					<span class="over_title">혼디주</span>
					<p class="over_des">8,000원</p>
				</div>
			</div>
		</div>
		</a>
		<!-- 밑의 a 태그 경로는 임시 설정입니다 ! 추후 세부 페이지가 생기면 변경 -->
		<a href="${contextPath}/extra/juneung.jsp">
		<div class="main_best_img" id="best_img3">
			<img src="${contextPath}/assets/img/items/best3.PNG" alt="인기많은술3" />
			<div class="over">
				<div class="main_best_over">
					<span class="over_title">술샘 16</span>
					<p class="over_des">10,000원</p>
				</div>
			</div>
		</div>
		</a>
		<!-- 밑의 a 태그 경로는 임시 설정입니다 ! 추후 세부 페이지가 생기면 변경 -->
		<a href="${contextPath}/extra/juneung.jsp">
		<div class="main_best_img" id="best_img4">
			<img src="${contextPath}/assets/img/items/best4.PNG" alt="인기많은술4" />
			<div class="over">
				<div class="main_best_over">
					<span class="over_title">땅콩막걸리(6병)</span>
					<p class="over_des">25,000원</p>
				</div>
			</div>
		</div>
		</a>
	</div>
	<!-- 4. 우리 술 종류
         각 종류의 대표 이미지 , hover시 강조효과
         img, 종류명 클릭 시 각 페이지로 이동 가능(a태그에 같은 페이지 걸어두기) -->
         <span id="main_drink"></span>
	<div class="main_drink">
		<h1>우리 술 종류</h1>
		<ul class="box" id="box1">
			<li><a href="${contextPath}"><img
					src="${contextPath}/assets/img/drinks/takju.jpg" alt="탁주" /></a> <br />
				<span class="main_drink_text">탁주</span></li>
		</ul>
		<ul class="box">
			<li><a href="${contextPath}"><img
					src="${contextPath}/assets/img/drinks/fruit_drink.jpg" alt="과실주" /></a>
				<br /> <span class="main_drink_text">과실주</span></li>
		</ul>
		<ul class="box">
			<li><a href="${contextPath}"><img
					src="${contextPath}/assets/img/drinks/cheongju.png" alt="약주/청주" /></a>
				<br /> <span class="main_drink_text">약주/청주</span></li>
		</ul>
		<div class="main_drink_2">
			<ul class="box" id="box2">
				<li><a href="${contextPath}"><img
						src="${contextPath}/assets/img/drinks/soju.jpg" alt="증류주" /></a> <br />
					<span class="main_drink_text">증류주</span></li>
			</ul>
			<ul class="box">
				<li><a href="${contextPath}"><img
						src="${contextPath}/assets/img/drinks/extra_drink.jpg" alt="기타주류" /></a>
					<br /> <span class="main_drink_text">기타주류</span></li>
			</ul>
		</div>
	</div>
</div>

<!--// ========== 컨텐츠 영역 끝 ========== -->
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>
<!--  스크립트 적용 -->
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 플러그인 JS 참조 -->
<script
	src="${contextPath}/assets/plugins/superslides/jquery.easing.1.3.js?time=${currentTime}"
	type="text/javascript" charset="utf-8"></script>
<script
	src="${contextPath}/assets/plugins/superslides/jquery.superslides.min.js?time=${currentTime}"
	type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/assets/js/index.js?time=${currentTime}"
	type="text/javascript" charset="utf-8"></script>
