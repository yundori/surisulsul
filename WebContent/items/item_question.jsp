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
		<div class="question_lists">
			<div class="question_list_head">
				<span class="que_number">번호</span>
				<span class="que_type">문의 유형</span>
				<a class="que_content">문의 내용</a>
				<span class="que_answer">답변 상태</span>
				<span class="que_date">작성 일시</span>
			</div>
			
			<div class="question_list">
				<div class="question_default">
					<span class="que_number">4</span>
					<span class="que_type">배송</span>
					<a class="que_content">배송은 얼마나 걸리나요?</a>
					<span class="que_answer">대기</span>
					<span class="que_date">2021-01-19</span>
				</div>
				<div class="question_detail">배송은 2~3일 정도 소요됩니다.</div>
			</div>
		</div>
	</div>
</div>
<%-- 
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
    $(function() {
        $(".que_content").click(function(e) {
            e.preventDefault();

            var target = $(this).attr('href');
            $(target).slideToggle(100);
            $("question_detail").not($(target)).slideUp(100);
        });
    });
    </script>
--%>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>