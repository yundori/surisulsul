<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_cscenter.css?time=${currentTime}" />
<body>
    
    <div class="content">
    <h1>공지사항 & FAQ 관리 </h1>
    <br />
    <br />
    <input type="submit" value="전체선택" onclick="" class="all_ck"/>
    <input type="submit" value="등록" onclick="" class="cs_add"/>
    <br />
    <form name="m_cscenter_form" id="m_cscenter_form">
    	<table class="manage_cs_table">
    		<tr>
    			<th><input type="checkbox" name="all" class="check_all"></th>
    			<th>분류</th>
    			<th>이름</th>
    			<th>제목</th>
    			<th width=210>등록날짜</th>
    			<th width=60>관리</th>
    		</tr>
    		<tr>
    			<td>
    				<input type="checkbox" name="cscenter" class="ab" value="">
    			</td>
    			<td>공지사항</td>
    			<td>관리자</td>
    			<td>수리술술은 언제나 무료배송 !</td>
    			<td>2021-02-18 00:00:00</td>
    			<td>
    				<input type="submit" value="수정" onclick="" class="edit_button"/>
    			</td>
    		</tr>
    		<tr>
    			<td>
    				<input type="checkbox" name="cscenter" class="ab" value="">
    			</td>
    			<td>FAQ</td>
    			<td>관리자</td>
    			<td>대량 주문도 가능한가요?</td>
    			<td>2021-02-18 00:00:00</td>
    			<td>
    				<input type="submit" value="수정" onclick="" class="edit_button"/>
    			</td>
    		</tr>
    	</table>
    </form>
    <input type="submit" value="삭제" onclick="" class="cs_delete"/>
    
    <!-- 페이지네이션 처리 -->
    
</div>

</body>

</html>