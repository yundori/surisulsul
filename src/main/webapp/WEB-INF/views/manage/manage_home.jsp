<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_common.css" />

<div class="content_home">
	<h1>관리자 페이지</h1>
	<hr />
	<div class="all_main">
		<div class="chart">
			<canvas id="canvas">
			</canvas>
		</div>
		<div class="manage_main">
			<ul>
				<li><a href="#">새로 가입한 회원 수</a> : n 명</li>
				<li><a href="#">새로 들어온 질문</a> : n 건</li>
				<li><a href="#">탈퇴한 회원 수</a> : n 명</li>
				<li><a href="#">오늘 방문 고객</a> : n 명</li>
			</ul>
		</div>
	</div>
</div>

</body>

</html>