<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/join.css?time=${currentTime}" />
	<link rel="stylesheet" type="text/css" href="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.css?time=${currentTime}" />
	
<!-- 로그인에 필요한 정보를 입력하는 폼 : 데이터 조회(where) 조건 -->
<form class="form-horizontal" name="join_form" id="join_form"
	method="post"
	action="${pageContext.request.contextPath}/account/login_ok.do">
	<div class="form-group">
		<h3 class="account-menu text-center">로그인</h3>
	</div>
	<div class="form-group">
		<label for="email" class="col-md-4">이메일</label>
		<div class="col-md-8">
			<input type="email" name="email" id="email" class="form-control" value="${email}"
				placeholder="이메일을 입력하세요." />
		</div>
	</div>
	<div class="form-group">
		<label for="user_pw" class="col-md-4">비밀번호</label>
		<div class="col-md-8">
			<input type="password" name="user_pw" id="user_pw"
				class="form-control" placeholder="비밀번호를 입력하세요." />
		</div>
	</div>
	<div class="form-group">
		<div class="text-center">
			<button type="submit">로그인</button>
		</div>
	</div>
	<div class="form-group">
		
	</div>
	<div class="move-page">
		<a class="link"
			href="${pageContext.request.contextPath}/account/join.do">회원가입</a> <a
			class="link"
			href="${pageContext.request.contextPath}/account/find_email.do">이메일
			찾기</a> <a class="link"
			href="${pageContext.request.contextPath}/account/find_pw.do">비밀번호
			찾기</a>
	</div>
</form>
 <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
 <script src="${contextPath}/assets/js/common.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>


<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>