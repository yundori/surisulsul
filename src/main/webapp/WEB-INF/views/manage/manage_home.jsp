<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_home.css" />

<div class="content_home">
	<h1>관리자 페이지</h1>
	<hr />
	<div class="all_main">
		<div class="chart">
			<canvas id="price_chart"></canvas>
		</div>
		<table class="manage_main">
			<tr>
				<th colspan="2">오늘의 수리술술</th>
			</tr>
			<tr>
				<td>새로 가입한 회원 수</td>
				<td width=100>n 명</td>
			</tr>
			<tr>
				<td>오늘 탈퇴한 회원 수</td>
				<td>n 명</td>
			</tr>
			<tr>
				<td>새로 등록된 문의사항</td>
				<td>n 건</td>
			</tr>
			<tr>
				<td>오늘 방문고객 수</td>
				<td>n 명</td>
			</tr>
		</table>
	</div>
</div>

</body>

</html>