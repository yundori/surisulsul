<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_cscenter.css?time=${currentTime}" />

<div class="content_1">
	<h2>알립니다 & 자주묻는질문 등록</h2>
	<form method="post" action="${pageContext.request.contextPath}/manage_cscenter_add_ok.do" name="csadd_form" id="csadd_form">
		<table class="manage_csadd_table">
			<tr>
				<th>제목</th>
				<td><input type="text" name="cs_title" id="cs_title" class="title_textarea" placeholder="제목을 입력해주세요."/></td>
			</tr>
			<tr>
				<th>분류</th>
				<td>
					<select id="cs_section" name="cs_section">
					<option value="0" >--------</option>
					<option value="A" >알립니다</option>
					<option value="B" >자주묻는질문</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="cs_content" id="cs_content" maxlength="1000" class="content_textarea" placeholder="내용을 입력해주세요." ></textarea></td>
			</tr>
		</table>
		<button type="submit" class="add_cs">등록하기</button>
	</form>
</div>

<script src="${contextPath}/assets/manage/manage_cscenter_add.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>