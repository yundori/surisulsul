<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/css/item_reviews,question.css?time=${currentTime}" /> --%>

<div class="item_question">
	<div>
		<div class="header">
			<h3 class="title">
			이 술에 대해 궁금하다면 <span>상품에 대한 문의를 남길 수 있습니다.</span>
			</h3>
		
			<a href="#" class="write_question_btn">문의 작성</a>
		</div>
		
		<div class="question_lists">
			<div class="question_list_head">
				<span class="que_number">번호</span>
				<span class="que_type">문의 유형</span>
				<div class="que_content">문의 내용</div>
				<span class="que_answer">답변 상태</span>
				<span class="que_date">작성 일시</span>
			</div>
			
			<c:choose>
			<c:when test="true">
			<%-- <forEach var="i" begin="0" end="select 데이터 수" varStatus="status" > --%>
			
			<div class="question_list">
				<div class="question_default">
					<span class="que_number">4</span>
					<span class="que_type">배송</span>
					<div class="que_content">배송은 얼마나 걸리나요? 3일이상 소요되면 취소할 수 있을까요? 빠른 답변 부탁드립니다!!!!!!!!!!!!</div>
					<span class="que_answer">대기</span>
					<span class="que_date">2021-01-19</span>
					<div class="question_detail">
						<span>배송은 얼마나 걸리나요? 3일이상 소요되면 취소할 수 있을까요? 빠른 답변 부탁드립니다.</span><br />
						배송은 2~3일 정도 소요됩니다.
					</div>
				</div>
			</div>
			
			<div class="question_list">
				<div class="question_default">
					<span class="que_number">3</span>
					<span class="que_type">환불</span>
					<div class="que_content">아직 배송전인데 환불 안되나요?</div>
					<span class="que_answer">완료</span>
					<span class="que_date">2021-01-19</span>
					<div class="question_detail">
						<span>아직 배송전인데 환불 안되나요?</span><br />
						수리술술에서는 주문과 동시에 술제조가 들어가기 때문에 환불이 어렵습니다. 죄송합니다.
					</div>
				</div>
			</div>
			
			<div class="question_list">
				<div class="question_default">
					<span class="que_number">2</span>
					<span class="que_type">교환</span>
					<div class="que_content">상품하자가 있어 교환가능한가요?</div>
					<span class="que_answer">대기</span>
					<span class="que_date">2021-01-18</span>
					<div class="question_detail">
						<span>상품하자가 있어 교환가능한가요?</span><br />
						확인 후 바로 조치해드리겠습니다. 불편을 드려 죄송합니다.
					</div>
				</div>
			</div>
			
			<div class="question_list">
				<div class="question_default">
					<span class="que_number">1</span>
					<span class="que_type">배송</span>
					<div class="que_content">배송지 변경 가능할까요?</div>
					<span class="que_answer">완료</span>
					<span class="que_date">2021-01-17</span>
					<div class="question_detail">
						<span>배송지 변경 가능할까요?</span><br />
						확인 후 바로 연락드리겠습니다. 감사합니다.
					</div>
				</div>
				
			</div>
			
			</c:when>
			<c:otherwise>
				<hr />
				<div class="question_none">
					<h1>상품 문의가 없습니다.</h1>
				</div>
			</c:otherwise>
			</c:choose>
		</div>
		<%-- 페이지네이션 영역 --%>
	</div>
</div>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
    $(function() {
        $(".question_default").click(function(e) {
            e.preventDefault();
            
            var target = $(this).find(".question_detail");
            $(target).slideToggle(200);
        });
    });
</script>