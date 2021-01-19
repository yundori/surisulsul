<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/mypage.css?time=${currentTime}" />

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
				<a class="psn_edit" href=#>수정하기</a>
				<a class="psn_deactivate" href=#>탈퇴하기</a>
		</div>
	</div>
	<hr />
	<!-- Tab Set -->
	<nav class="psn_tab">
		<ul class="psn_tab_inner">
			<li class="tab_item tab_forme">
				<a class="tab-button-item-link selected" href="#tab-page-1">나를 위한 추천술</a>
			</li>
			<li class="tab_item tab_wishlist">
				<a class="tab-button-item-link" href="#tab-page-2">관심있어요</a>
			</li>
			<li class="tab_item tab_buy">
				<a class="tab-button-item-link" href="#tab-page-3">구매했어요</a>
			</li>
			<li class="tab_item tab_comment">
				<a class="tab-button-item-link" href="#tab-page-4">나의 의견</a>
			</li>
		</ul>
	</nav>
	<div class="tab-panel">
            <div id="tab-page-1">
                <%@ include file="../mypage/my_recommend.jsp"%>
            </div>
            <div id="tab-page-2" class="hide">
                <%@ include file="../mypage/wishlist.jsp"%>
            </div>
            <div id="tab-page-3" class="hide">
                <%@ include file="../mypage/past_order.jsp"%>
            </div>
            <div id="tab-page-4" class="hide">
                <%@ include file="../mypage/my_opinion.jsp"%>
            </div>
        </div>


<script src="${contextPath}/assets/js/mypage.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>