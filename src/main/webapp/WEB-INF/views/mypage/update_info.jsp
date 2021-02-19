<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/join.css?time=${currentTime}" />
  <link rel="stylesheet" type="text/css" href="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.css?time=${currentTime}" />

    <!-- 형식 검사 필수 -->
    <form class="form-horizontal" name="update_form" id="update_form" action="${pageContext.request.contextPath}/mypage/update_info_ok.do" method="post">
        <div class="form-group">
            <h3 class="account-menu text-center">회원정보 수정</h3>
        </div>
        <div class="form-group">
            <label for="email" class="col-md-4">이메일<span class="identify">*</span></label>
            <div class="col-md-6">
                <!-- ${output.email} 이런 형식으로 유저 이메일 불러와서 고정시키기 -->
            ${output.email} 
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
                <!-- ${output.name} 이런 형식으로 유저 이름 불러와서 고정시키기 -->
                ${output.name}
            </div>
        </div>
        <div class="form-group">
            <label for="tel" class="col-md-4">전화번호<span class="identify">*</span></label>
            <div class="col-md-6">
                <input type="tel" name="tel" id="tel" class="form-control" value="${output.phone}"/>
            </div>
        </div>
        <div class="form-group">
            <label for='birthdate' class="col-md-4">생년월일 <span class='identify'>*</span></label>
            <div class="col-md-6">
                <!-- ${output.birthdate} 이런 형식으로 유저 생년월일 불러와서 고정시키기 (date.format이나 string 함수 활용할 것을 권장) -->
                ${output.birthdate}
            </div>
        </div>
        <div class="form-group">
            <label for='address' class="col-md-4">주소 <span class='identify'>*</span></label>
            <div class="col-md-8">
                <div class="col-md-6">
                    <input type="text" class="form-control" name="postcode" id="postcode" readonly="우편번호" value="${output.postcode}">
                </div>
                <input type="button" onclick="execDaumPostcode()" class="chk-email" value="우편번호 찾기"><br/><br/>
                <input type="text" class="form-control" name="address" id="address" readonly="주소" value="${output.address1}"><br/><br/>
                <input type="text" class="form-control" name="detailAddress" id="detailAddress" value="${output.address2}">
            </div>
        </div>
        <div class="form-group">
            <div class="text-center">
                <button type="submit">수정하기</button>
            </div>
        </div>
    </form>
    <script src="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
    <script src="${contextPath}/assets/plugins/validate/jquery.validate.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
    <script src="${contextPath}/assets/plugins/validate/additional-methods.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${contextPath}/assets/js/common.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
    <script src="${contextPath}/assets/js/join.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>