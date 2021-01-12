<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<!doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>나의 수리술술</title>
<!-- 크로스 브라우징 호환성 시작 -->
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<!-- 크로스 브라우징 호환성 끝 -->
<link rel="apple-touch-icon" href="img/icon.png" />
<!-- CSS 파일 참조 처리 -->
<link rel="stylesheet" type="text/css" href="../assets/css/common.css" />
<link rel="stylesheet" type="text/css" href="../assets/css/mypage.css" />

</head>

<body>
<!-- 개인정보 확인 -->
	<div class="psn_info">
		<h2>나의 수리술술</h2>
		<h3>나에 대하여</h3>
		<table>
			<tbody>
				<tr>
					<td>이름</td>
					<td>name</td>
					<td>이메일</td>
					<td>email</td>
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td>phone_number</td>
					<td>생년월일</td>
					<td>birthdate</td>
				</tr>
				<tr>
					<td>주소</td>
					<td colspan="3">address</td>
				</tr>
			</tbody>
		</table>
		<!-- 개인정보 버튼 세트 -->
		<div class="psn_btn">
			<button class="psn_edit">
				<a href=#>수정하기</a>
			</button>
			<button class="psn_deactivate">
				<a href=#>탈퇴하기</a>
			</button>
		</div>
	</div>
	<hr/>
	<!-- Tab Set -->
	<div class="psn_tab">
	
	</div>
</body>

</html>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>