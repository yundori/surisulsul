<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/mypage.css?time=${currentTime}" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.css?time=${currentTime}" />

	<!-- 개인정보 확인 -->
	<div class="psn_info clean">
		<h2 class="psn_info_h2">나의 수리술술</h2>
		<h3 class="psn_info_h3">나에 대하여</h3>
		<table class="psn_table" >
			<tbody>
				<tr>
					<td class="psn_td_tab">이름</td>
					<td class="psn_td_normal">name</td>
					<td class="psn_td_tab">이메일</td>
					<td class="psn_td_special">email/sbd1234@sbd.com/
				</tr>
				<tr>
					<td class="psn_td_tab">핸드폰번호</td>
					<td class="psn_td_normal">phone_number</td>
					<td class="psn_td_tab">생년월일</td>
					<td>birthdate</td>
				</tr>
				<tr>
					<td class="psn_td_tab">주소</td>
					<td class="psn_td_special" colspan="3">address/경기도 용인시 수지구 상현동 형제자이아파트 자매동 구리시/경기도 용인시 수지구 상현동/경기도 용인시 수지구 상현동</td>
				</tr>
			</tbody>
		</table>
		<!-- 개인정보 버튼 세트 -->
		<div class="psn_btn">
				<a class="psn_edit" href="${pageContext.request.contextPath}/mypage/update_info.do" onClick="openPw()" return false;>수정하기</a>
				<a href="#" class="psn_deactivate" type="button" return false;>탈퇴하기</a>
		</div>
	</div>
	<hr />
	<!-- Tab Set -->
	<nav class="psn_tab">
		<ul class="psn_tab_inner">
			<li class="tab_forme">
				<a data-tab="my_recommend" class="tab-button-item-link" href="#"  id="default">나를 위한 추천술</a>
			</li>
			<li class="tab_wishlist">
				<a data-tab="wishlist" class="tab-button-item-link" href="#">관심있어요</a>
			</li>
			<li class="tab_buy">
				<a data-tab="past_order" class="tab-button-item-link" href="#">구매했어요</a>
			</li>
			<li class="tab_comment">
				<a data-tab="my_opinion" class="tab-button-item-link" href="#">나의 의견</a>
			</li>
		</ul>
	</nav>
	<div class="tab-panel">
<%--             <div id="tab-page-my_recommend">
                <%@ include file="../mypage/my_recommend.jsp"%>
            </div>
            <div id="tab-page-wishlist" class="hide">
                <%@ include file="../mypage/wishlist.jsp"%>
            </div>
            <div id="tab-page-past_order" class="hide">
                <%@ include file="../mypage/past_order.jsp"%>
            </div>
            <div id="tab-page-my_opinion" class="hide">
                <%@ include file="../mypage/my_opinion.jsp"%>
            </div> --%>
        </div>

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
    
<script src="${contextPath}/assets/js/mypage.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>