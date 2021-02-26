<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- JSTL로 변수 생성 --%>
<%-- 1) 캐시를 방지하기 위해 자주 수정되는 css,js 파일에 설정하는 용도 --%>
<c:set var="currentTime" value="<%=System.currentTimeMillis()%>" />
<%-- 2) 프로젝트이름 기반의 절대경로값 --%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>수리술술 관리자 페이지</title>
<!-- 크로스 브라우징 호환성 시작 -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/reset.css" />
<!-- 크로스 브라우징 호환성 끝 -->
<!-- 모바일 아이콘 지원 -->
<link rel="shortcut icon" href="${contextPath}/assets/img/favicon.png" />
<link rel="icon" href="${contextPath}/assets/img/favicon.png" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_common.css?time=${currentTime}" />
</head>

<body>
	<div class="manage_login">
	<!-- 로그인에 필요한 정보를 입력하는 폼 : 데이터 조회(where) 조건 -->
	<form name="manage_login_form" id="manage_login_form"
		method="post"
		action="${pageContext.request.contextPath}/manage_home.do">
		<div class="form-group">
			<h3 class="account-menu" id="text-center">로그인</h3>
		</div>
		<div class="form-group">
			<label for="manager_id" class="col-md-4">이메일</label>
			<div class="col-md-8">
				<input type="text" name="manager_id" id="manager_id" class="form-control"  placeholder="관리자 아이디를 입력하세요." />
			</div>
		</div>
		<div class="form-group">
			<label for="manager_pw" class="col-md-4">비밀번호</label>
			<div class="col-md-8">
				<input type="password" name="manager_pw" id="manager_pw" class="form-control" placeholder="관리자 비밀번호를 입력하세요." />
			</div>
		</div>
		<div class="form-group">
			<div class="text-center">
				<button type="submit">로그인</button>
			</div>
		</div>
	</form>
	
	</div>
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.js?time=${currentTime}"
		type="text/javascript" charset="utf-8"></script>
	<script src="${contextPath}/assets/js/common.js?time=${currentTime}"
		type="text/javascript" charset="utf-8"></script>


</body>

</html>