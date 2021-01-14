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
<link rel="stylesheet" type="text/css" href="../assets/css/reset.css" />
<!-- 크로스 브라우징 호환성 끝 -->

<!-- CSS 파일 참조 처리 -->
<link rel="stylesheet" type="text/css" href="../assets/css/common.css" />
<link rel="stylesheet" type="text/css" href="../assets/css/mypage.css" />

</head>

<body>
	<!-- 개인정보 확인 -->
	<div class="psn_info clean">
		<h2 class="psn_info_h2">나의 수리술술</h2>
		<h3 class="psn_info_h3">나에 대하여</h3>
		<table class="psn_table" >
			<tbody>
				<tr>
					<td class="psn_td_tab">이름</td>
					<td class="psn_td_normal">name</td>
					<td class="psn_td_tab">이메일</td>
					<td class="psn_td_special">email/sbd1234@sbd.com/
				</tr>
				<tr>
					<td class="psn_td_tab">핸드폰번호</td>
					<td class="psn_td_normal">phone_number</td>
					<td class="psn_td_tab">생년월일</td>
					<td>birthdate</td>
				</tr>
				<tr>
					<td class="psn_td_tab">주소</td>
					<td class="psn_td_special" colspan="3">address/경기도 용인시 수지구 상현동 형제자이아파트 자매동 구리시/경기도 용인시 수지구 상현동/경기도 용인시 수지구 상현동</td>
				</tr>
			</tbody>
		</table>
		<!-- 개인정보 버튼 세트 -->
		<div class="psn_btn">
				<a class="psn_edit" href=#>수정하기</a>
				<a class="psn_deactivate" href=#>탈퇴하기</a>
		</div>
	</div>
	<hr />
	<!-- Tab Set -->
	<nav class="psn_tab">
		<ul class="psn_tab_inner">
			<li class="tab_item tab_forme">
				<a href="#">나를 위한 추천술</a>
			</li>
			<li class="tab_item tab_wishlist">
				<a href="#">관심있어요</a>
			</li>
			<li class="tab_item tab_buy">
				<a href="#">구매했어요</a>
			</li>
			<li class="tab_item tab_comment">
				<a href="#">나의 의견</a>
			</li>
		</ul>
	</nav>
	
	<!-- Tab 서브페이지 -->
	<%@ include file="../mypage/my_recommend.jsp" %>
</body>

</html>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>