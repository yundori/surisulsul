<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/mypage_detail.css?time=${currentTime}" />
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
				<tr>
					<td><input type="checkbox" name="item1" id="item1" class="ab">
					</td>
					<td><a href="#">블루베리 생막걸리</a></td>
					<td>
						<div class="table_min_height">
							<a href="#" class="review_item_thumb"> <img
								src="${contextPath}/assets/img/no-image.jpg" />
							</a>
							<div class="review_item_info">
								<a href="#" class="item">
									<p class="review_item_name">상품후기 작성내용/상품후기 작성내용/상품후기
										작성내용/상품후기 작성내용/ 상품후기 작성내용/상품후기 작성내용/상품후기 작성내용/상품후기 작성내용/ 상품후기
										작성내용/상품후기 작성내용/상품후기 작성내용/상품후기 작성내용/ 상품후기 작성내용/상품후기 작성내용/상품후기
										작성내용/상품후기 작성내용/</p>
								</a>
							</div>
						</div>

					</td>
					<td>2021-01-19</td>
					<td><a href="#" class="edit_recommend btn_gray" onClick="openPop()" return false;>수정하기</a></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="item2" id="item2" class="ab">
					</td>
					<td><a href="#">블루베리 생막걸리</a></td>
					<td>
						<div class="table_min_height">
							<a href="#" class="review_item_thumb"> <img
								src="${contextPath}/assets/img/no-image.jpg" />
							</a>
							<div class="review_item_info">
								<a href="#" class="item">
									<p class="review_item_name">상품후기 작성내용/상품후기 작성내용/상품후기
										작성내용/상품후기 작성내용/ 상품후기 작성내용/상품후기 작성내용/상품후기 작성내용/상품후기 작성내용/ 상품후기
										작성내용/상품후기 작성내용/상품후기 작성내용/상품후기 작성내용/ 상품후기 작성내용/상품후기 작성내용/상품후기
										작성내용/상품후기 작성내용/</p>
								</a>
							</div>
						</div>

					</td>
					<td>2021-01-19</td>
					<td><a href="#" class="edit_recommend btn_gray" onClick="openPop()" return false;>수정하기</a></td>
				</tr>
			</tbody>
		</table>
	</div>
	<!--***** 여기에 PAGINATION 들어가야 함 *****-->
	<div class="delete_area">
		<a href="#" class="delete_this btn_nor">선택 삭제</a>
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
				<tr>
					<td><input type="checkbox" name="item1" id="item1" class="cd">
					</td>
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
					<td><input type="checkbox" name="item2" id="item2" class="cd">
					</td>
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
			</tbody>
		</table>
	</div>
	<!--***** 여기에 PAGINATION 들어가야 함 *****-->
	<div class="delete_area">
		<a href="#" class="delete_this btn_nor">선택 삭제</a>
	</div>
</div>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${contextPath}/assets/js/my_opinion.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
