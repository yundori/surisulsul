<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/join.css?time=${currentTime}" />

    <!-- 형식 검사 필수 -->
    <form class="form-horizontal" name="join_form" id="join_form">
        <div class="form-group">
            <h3 class="account-menu text-center">회원정보 수정</h3>
        </div>
        <div class="form-group">
            <label for="email" class="col-md-4">이메일<span class="identify">*</span></label>
            <div class="col-md-6">
                masuri@gmail.com
            </div>
        </div>
        <div class="form-group">
            <label for="user_pw" class="col-md-4">비밀번호<span class="identify">*</span></label>
            <div class="col-md-6">
                <input type="password" name="user_pw" id="user_pw" class="form-control" placeholder="비밀번호를 입력하세요." />
            </div>
        </div>
        <div class="form-group">
            <label for="user_pw_re" class="col-md-4">비밀번호 확인<span class="identify">*</span></label>
            <div class="col-md-6">
                <input type="password" name="user_pw_re" id="user_pw_re" class="form-control" placeholder="비밀번호와 동일하게 입력하세요." />
            </div>
        </div>
        <div class="form-group">
            <label for="user_name" class="col-md-4">이름<span class="identify">*</span></label>
            <div class="col-md-6">
                마수리
            </div>
        </div>
        <div class="form-group">
            <label for="tel" class="col-md-4">전화번호<span class="identify">*</span></label>
            <div class="col-md-6">
                <input type="tel" name="tel" id="tel" class="form-control" placeholder="휴대폰 번호를 - 없이 입력하세요." />
            </div>
        </div>
        <div class="form-group">
            <label for='birthdate' class="col-md-4">생년월일 <span class='identify'>*</span></label>
            <div class="col-md-6">
                2021년 1월 18일
            </div>
        </div>
        <div class="form-group">
            <label for='address' class="col-md-4">주소 <span class='identify'>*</span></label>
            <div class="col-md-8">
                <div class="col-md-6">
                    <input type="text" class="form-control" id="postcode" placeholder="우편번호">
                </div>
                <input type="button" onclick="sample6_execDaumPostcode()" class="chk-email" value="우편번호 찾기"><br /><br />
                <input type="text" class="form-control" id="address" placeholder="도로명 주소"><br /><br />
                <input type="text" class="form-control" id="detailAddress" placeholder="기타 상세 주소">
            </div>
        </div>
        <div class="form-group">
            <div class="text-center">
                <button type="submit">수정하기</button>
            </div>
        </div>
    </form>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>