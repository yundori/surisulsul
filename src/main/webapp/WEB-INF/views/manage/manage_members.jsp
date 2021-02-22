<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_members.css?time=${currentTime}" />

<div class="content">
	<h2>회원관리</h2>
	<a href="#" class="manage_members_all"> <span class="btn_total">전체
			</span> <span class="btn_num">0,000명</span>
	</a>
	<a href="#" class="manage_members_out"> <span class="btn_total">탈퇴
			</span> <span class="btn_num">0,000명</span>
	</a>
	<table class=manage_member_table>
		<thead>
			<tr>
				<th><input type="checkbox" name="all" class="check_all">선택
				</th>
				<th>회원번호</th>
				<th>이메일</th>
				<th>이름</th>
				<th>상태</th>
				<th>전화번호</th>
				<th>최종접속일</th>
				<th>가입일자</th>
				<th>생년월일</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" name="man_members" class="ab"
					value="${member.id }"></td>
				<td>id</td>
				<td>email@email.com</td>
				<td>name</td>
				<td>정상</td>
				<td>phone</td>
				<td>edit_date</td>
				<td>reg_date</td>
				<td>birthdate</td>
				<td>
					<button>수정</button>
				</td>
			</tr>
		</tbody>
	</table>
</div>

