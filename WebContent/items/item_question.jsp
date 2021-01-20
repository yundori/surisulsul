<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/item_reviews.css?time=${currentTime}" />

<div class="item_question">
	<div>
		<h3 class="title">
			이 술에 대해 궁금하다면 <span>상품에 대한 문의를 남길 수 있습니다.</span>
		</h3>

		<table>
			<tr>
				<th class="th_que_number">번호</th>
				<th class="th_que_type">문의 유형</th>
				<th class="th_que_content">문의 내용</th>
				<th class="th_que_answer">답변 상태</th>
				<th class="th_que_date">작성 일시</th>
			</tr>
			<tr>
				<td class="que_number">1</td>
				<td class="que_type">배송</td>
				<td class="que_content">배송은 얼마나 걸리나요?</td>
				<td class="que_answer">대기</td>
				<td class="que_date">2021-01-19</td>
			</tr>
			<tr>
				<td class="que_number">2</td>
				<td class="que_type"></td>
				<td class="que_content"></td>
				<td class="que_answer"></td>
				<td class="que_date"></td>
			</tr>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>