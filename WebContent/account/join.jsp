<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/join.css?time=${currentTime}" />
 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.css?time=${currentTime}" />

    <!-- 형식 검사 필수 -->
    <form class="form-horizontal" name="join_form" id="join_form">
        <div class="form-group">
            <h3 class="account-menu text-center">회원가입</h3>
        </div>
        <div class="form-group">
            <label for="email" class="col-md-4">이메일<span class="identify">*</span></label>
            <div class="col-md-6">
                <!-- 중복확인이 끝났더라도 아이디 창에 새로 키를 입력하면 중복확인을 초기화시킬것 -->
                <!-- onkeydown="inputEmail()" -->
                <input type="email" name="email" id="email" class="form-control" placeholder="이메일을 입력하세요." />
            </div>
            <!-- 클릭 시 db에서 값을 받아와 사용자가 입력한 email 값과 일치하는 데이터가 있는지 조회, 일치하는 값이 있으면 email-duplication의 value를 email-unuse, 없으면 email-chk로 변경 (js로 할 것) -->
            <!-- onclick = "emailChk()" -->
            <input type="button" value="중복확인" class="chk-email" />
            <!-- 여기의 값이 email-chk가 되면 중복확인 통과, email-unchk면 중복확인이 이루어지지 않음, email-unuse면 이미 사용중인 이메일이 있음 표시, submit 방지-->
            <input type="hidden" name="emailChk" value="email-chk" />
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
                <input type="text" name="user_name" id="user_name" class="form-control" placeholder="이름을 입력하세요."/>
            </div>
        </div>
        <div class="form-group">
            <label for="tel" class="col-md-4">전화번호<span class="identify">*</span></label>
            <div class="col-md-6">
                <input type="tel" name="tel" id="tel" class="form-control" placeholder="휴대폰 번호를 - 없이 입력하세요."/>
            </div>
        </div>
        <div class="form-group">
            <label for='birthdate' class="col-md-4">생년월일 <span class='identify'>*</span></label>
            <div class="col-md-6">
                <input type="date" name="birthdate" id="birthdate" class="form-control" placeholder="0000-00-00"/>
            </div>
        </div>
        <div class="form-group">
            <label for='address' class="col-md-4">주소 <span class='identify'>*</span></label>
            <div class="col-md-8">
                <div class="col-md-6">
                    <input type="text" class="form-control" name="postcode" id="postcode" readonly="우편번호" placeholder="우편번호">
                </div>
                <input type="button" onclick="execDaumPostcode()" class="chk-email" value="우편번호 찾기"><br/><br/>
                <input type="text" class="form-control" name="address" id="address" readonly="주소" placeholder="도로명 주소"><br/><br/>
                <input type="text" class="form-control" name="detailAddress" id="detailAddress" placeholder="기타 상세 주소">
            </div>
        </div>
        <div class="form-group">
            <label for='user_agreements' class="col-md-4">이용 약관 <span class='identify'>*</span></label>
            <div class="col-md-8">
                <h4>개인정보 이용 약관</h4>
                <div class="terms-box">이용약관</div>
                <label><input type='checkbox' name='terms' id='info-term' value='개인정보 이용약관'>개인정보 이용 약관 동의</label>
                <h4>사이트 이용 약관</h4>
                <div class="terms-box">이용약관</div>
                <label><input type='checkbox' name='terms' id='site-term' value='사이트 이용약관'>사이트 이용 약관 동의</label>
                <label><input type='checkbox' name='terms' id='terms' value='이용약관'>이용 약관 전체 동의</label>
            </div>
        </div>
        <div class="form-group">
            <div class="text-center">
                <button type="submit">가입하기</button>
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