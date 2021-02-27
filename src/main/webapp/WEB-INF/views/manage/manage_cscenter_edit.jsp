<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_cscenter.css?time=${currentTime}" />

<div class="content_1">
	<h2>알립니다 & 자주묻는질문 수정</h2>
	<form method="post" action="${pageContext.request.contextPath}/manage_cscenter_edit_ok.do" name="csedit_form" id="csedit_form">
		<table class="manage_csedit_table">
			<tr>
				<th>제목</th>
				<td><input type="text" name="cs_title" id="cs_title" class="title_textarea" value="${output.title}" placeholder="제목을 입력해주세요."/></td>
			</tr>
			<tr>
				<th>분류</th>
				<td>
					<select id="cs_section" name="cs_section">
					<option value="A" <c:if test="${output.type == 'A'}">selected</c:if>>알립니다</option>
					<option value="B" <c:if test="${output.type == 'B'}">selected</c:if>>자주묻는질문</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="cs_content" id="cs_content" maxlength="1000" class="content_textarea" value="${output.content}" placeholder="내용을 입력해주세요.">${output.content}</textarea></td>
			</tr>
		</table>
		<button type="submit" class="edit_cs">수정하기</button>
	</form>
</div>