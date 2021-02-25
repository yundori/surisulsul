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
<title>surisulsul</title>
<!-- 크로스 브라우징 호환성 시작 -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/reset.css" />
<!-- 크로스 브라우징 호환성 끝 -->
<!-- CSS 파일 참조 처리 -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_common.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_cscenter.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/popup.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.css?time=${currentTime}" />

</head>

<body>
	<div class="pop-up">
		<div class="pop-up-title">알립니다 & 자주묻는질문 등록</div>
		<div class="pop-up-content">
			<form id="cscenter_add" action="${pageContext.request.contextPath}/manage_cscenter_add_ok.do" method="POST" name="form_cs">
				<input type="hidden" name="add_cs" value="" />
				<div class="form-group">
					<label class="label text-center">분류 선택</label> <br /> <select
						id="category" class="category" name="type">
						<option value="0">--------</option>
						<option value="A">알립니다</option>
						<option value="B">자주묻는질문</option>
					</select>
				</div>
				<div class="form-group">
					<label class="label text-center">제목 작성</label> <br /> <input
						type="text" placeholder="제목을 입력해 주세요." id="title_add" name="title"/>
				</div>
				<div class="form-group">
					<label class="label text-center">등록 내용 작성하기</label> <br />
					<textarea class="write-content" placeholder="내용을 입력해 주세요."
						name="content"></textarea>
					<span class="input-limit">0/1,000</span>
				</div>
				<div>
					<button type="submit" id="cs_add_btn">등록하기</button>
				</div>
			</form>
		</div>
	</div>

	<!--Google CDN 서버로부터 jQuery 참조 -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- jQuery Ajax Form plugin CDN -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
	<!-- jQuery Ajax Setup -->
	<script
		src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
	<script
		src="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.js?time=${currentTime}"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		// 등록하기 누르면 -> 입력 값이 cscenter에 들어가고, 내용이 추가됨
		// 내용을 다 입력하기 전에 등록하기를 누르면 , alert -> "입력하지 않은 값이 존재합니다. 다시 한번 확인해주세요."
		window.onload = function() {
			var cs_add_btn = document.getElementById('cs_add_btn');
			
			cs_add_btn onclick = function() {
				document.form_cs.target = opener.name; // 호출하고자하는 부모창의 이름
				document.form_cs.submit(); // 폼 전송
				self.close(); //창 닫기 
			}
		};


		$('.write-content').keyup(function(e) {
			var content = $(this).val();
			$('.input-limit').html(content.length + "/1,000"); //글자수 실시간 카운팅

			if (content.length > 1000) {
				alert("최대 1,000자까지 입력 가능합니다.");
				$(this).val(content.substring(0, 1000));
				$('.input-limit').html("1,000/1,000");
			}
		});
	</script>
</body>