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
<!-- 모바일 아이콘 지원 -->
    <link rel="shortcut icon" href="${contextPath}/assets/img/favicon.png" />
    <link rel="icon" href="${contextPath}/assets/img/favicon.png" />
<!-- CSS 파일 참조 처리 -->
<link rel="stylesheet" type="text/css"
   href="${contextPath}/assets/css/common.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
   <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/mypage_detail.css?time=${currentTime}" />
   <link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/mypage_detail.css?time=${currentTime}" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
</head>
<body>

<div class="psn_recommend_list">

	<!-- ************나의 후기 ************ -->
	<div class="psn_title">
		<h2 class="psn_title_txt">나의 후기</h2>
	</div>
	<div class="psn_review_table">
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" name="all" class="check_all">전체선택
					</th>
					<th>상품</th>
					<th>작성 내용</th>
					<th>작성일</th>
					<th>수정하기</th>
				</tr>
			</thead>

			<tbody>
				<c:choose>
					<%--c:when test 조건 -> 최근 구매 내역이 있는 경우 -> 후기를 작성했는지 여부 -> 주문 내역 DB 내용 존재 --%>
					<c:when test="true">
						<!--<c:forEach var="i" begin="${first }" end="${last }" varStatus="status">-->
						<tr>
							<td><input type="checkbox" name="item1" id="item1"
								class="ab"></td>
							<td><a href="#">블루베리 생막걸리</a></td>
							<td>
								<div class="table_min_height">
									<a href="#" class="review_item_thumb"> <img
										src="${contextPath}/assets/img/no-image.jpg" />
									</a>
									<div class="review_item_info">
										<a href="#" class="item">
											<p class="review_item_name">상품후기 작성내용/상품후기 작성내용/상품후기
												작성내용/상품후기 작성내용/ 상품후기 작성내용/상품후기 작성내용/상품후기 작성내용/상품후기 작성내용/
												상품후기 작성내용/상품후기 작성내용/상품후기 작성내용/상품후기 작성내용/ 상품후기 작성내용/상품후기
												작성내용/상품후기 작성내용/상품후기 작성내용/</p>
										</a>
									</div>
								</div>

							</td>
							<td>2021-01-19</td>
							<td><a href="#" class="edit_recommend btn_gray"
								onClick="openPop()"returnfalse;>수정하기</a></td>
						</tr>
						<tr>
							<td><input type="checkbox" name="item2" id="item2"
								class="ab"></td>
							<td><a href="#">블루베리 생막걸리</a></td>
							<td>
								<div class="table_min_height">
									<a href="#" class="review_item_thumb"> <img
										src="${contextPath}/assets/img/no-image.jpg" />
									</a>
									<div class="review_item_info">
										<a href="#" class="item">
											<p class="review_item_name">상품후기 작성내용/상품후기 작성내용/상품후기
												작성내용/상품후기 작성내용/ 상품후기 작성내용/상품후기 작성내용/상품후기 작성내용/상품후기 작성내용/
												상품후기 작성내용/상품후기 작성내용/상품후기 작성내용/상품후기 작성내용/ 상품후기 작성내용/상품후기
												작성내용/상품후기 작성내용/상품후기 작성내용/</p>
										</a>
									</div>
								</div>

							</td>
							<td>2021-01-19</td>
							<td><a href="#" class="edit_recommend btn_gray"
								onClick="openPop()"returnfalse;>수정하기</a></td>
						</tr>
						<!--</c:forEach>-->
					</c:when>
					<%--c:otherwise --> 주문내역이 없는 경우/후기를 작성하지 않은 경우 -> DB에 데이터 X --%>
					<c:otherwise>
						<tr>
							<td colspan="5" style="padding: 30px;">작성한 후기가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<!--***** 여기에 PAGINATION 들어가야 함 *****-->
		<div class="delete_area">
			<a href="#" class="delete_this btn_nor">선택 삭제</a>
		</div>
	</div>



	<!-- ************나의 질문 ************ -->
	<div class="psn_title">
		<h2 class="psn_title_txt">나의 질문</h2>
	</div>
	<div class="psn_qna_table">
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" name="all" class="check_all2">전체선택
					</th>
					<th>문의 상품</th>
					<th>문의 내용</th>
					<th>문의 날짜</th>
					<th>답변여부</th>
				</tr>
			</thead>

			<tbody>
				<c:choose>
					<%--c:when test 조건 -> 최근 문의 내역 존재 여부 -> 문의 내역 DB 내용 존재 --%>
					<c:when test="false">
						<tr>
							<td><input type="checkbox" name="item1" id="item1"
								class="cd"></td>
							<td><a href="#">제주몬순커피주</a></td>
							<td>
								<div class="table_min_height">
									<div class="qna_item_info">
										<a href="#"> <span class="qna_area">[분류 : 대량구매]</span>
											<p class="qna_item_name">상품문의 남깁니다. 혹시 대량구매 가능할까요?</p>
										</a>
									</div>
								</div>

							</td>
							<td>2021-01-19</td>
							<td>답변 대기중</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="item2" id="item2"
								class="cd"></td>
							<td><a href="#">블루베리 생막걸리</a></td>
							<td>
								<div class="table_min_height">
									<div class="qna_item_info">
										<a href="#"> <span class="qna_area">[분류 : 상품문의]</span>
											<p class="qna_item_name">이거 유통기한이 어떻게 되나요? 제가 2주간 출장을 가게
												되는데 미리 받아놓고 2주 정도 뒤에 마셔도 맛이 괜찮을까요? 혹시 예약일에 맞춰서 주문도 가능할까요?</p>
										</a>
									</div>
								</div>

							</td>
							<td>2021-01-17</td>
							<td>답변완료</td>
						</tr>
					</c:when>
					<%--c:otherwise --> 문의 내역이 없는 경우 -> DB에 데이터 X --%>
					<c:otherwise>
						<tr>
							<td colspan="5" style="padding: 30px;">작성한 질문이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<!--***** 여기에 PAGINATION 들어가야 함 *****-->
		<div class="delete_area">
			<a href="#" class="delete_this btn_nor">선택 삭제</a>
		</div>
	</div>

</div>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${contextPath}/assets/js/my_opinion.js?time=${currentTime}"
	type="text/javascript" charset="utf-8"></script>
	</body>
	</html>
