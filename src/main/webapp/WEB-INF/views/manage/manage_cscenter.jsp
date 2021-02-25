<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_cscenter.css?time=${currentTime}" />
    
    <div class="content">
    <h1>공지사항 & FAQ 관리 </h1>
    <br />
    <br />
    <input type="submit" value="등록" onclick="javascript:open_cs_add_Pop();" class="cs_add"/>
    <br />
    <form name="m_cscenter_form" id="m_cscenter_form" method="post" action="${pageContext.request.contextPath }/manage/manage_cscenter_delete.do">
    	<table class="manage_cs_table">
    		<tr>
    			<th><input type="checkbox" name="all" class="check_all"></th>
    			<th>분류</th>
    			<th>이름</th>
    			<th>제목</th>
    			<th width=160>등록날짜</th>
    			<th width=160>수정날짜</th>
    			<th width=60>관리</th>
    		</tr>
    		<c:choose>
	    		<c:when test="${output == null}">
	    			<h1>등록된 글이 없습니다.</h1>
	    		</c:when>
	    		<c:otherwise>
	    		<c:forEach var="item" items="${output}" varStatus="status">
	    			<tr>
    			<td>
    				<input type="checkbox" name="cscenter" class="ab" value="${output.id}">
    			</td>
    			<c:choose>
					<c:when test="${output.type == A}">
					알립니다
					</c:when>
					<c:when test="${output.type == B}">
					자주 묻는 질문
					</c:when>
				</c:choose>
    			<td>관리자</td>
    			<td>${output.title}</td>
    			<td>${output.reg_date}</td>
    			<td>${output.edit_date}</td>
    			<td>
    				<input type="button" value="수정" onclick="javascript:open_cs_edit_Pop();" class="edit_button"/>
    			</td>
    		</tr>
	    		</c:forEach>
	    		</c:otherwise>
    		</c:choose>
    	</table>
    	<input type="submit" value="선택 삭제" onclick="javascript: form.action='/manage_cscenter_delete';" class="cs_delete"/>
    </form>
    
    
    <!-- 페이지네이션 처리 -->
    
</div>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

//팝업열기
function open_cs_add_Pop() {
	window.name = "manage_cscenter"
	var popup = window.open('${pageContext.request.contextPath}/manage_cscenter_add.do','_blank',
					'width=648, height=500, toolbar=no, menubar=no, scrollbars=yes, resizable=no');
}

function open_cs_edit_Pop() {
	var popup = window.open('${pageContext.request.contextPath}/manage_cscenter_edit.do','_blank',
					'width=648, height=500, toolbar=no, menubar=no, scrollbars=yes, resizable=no');
}
</script>