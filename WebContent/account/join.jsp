<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>수리술술 가입하기</title>
        <!-- 크로스 브라우징 호환성 시작 -->
<link rel="stylesheet" type="text/css" href="../assets/css/reset.css" />
<!-- 크로스 브라우징 호환성 끝 -->
<!-- CSS 파일 참조 처리 -->
<link rel="stylesheet" type="text/css" href="../assets/css/common.css" />
<link rel="stylesheet" type="text/css" href="../assets/css/join.css" />
</head>

<body>
    <h3>회원가입</h3>
    <!-- 형식 검사 필수 -->
    <form class="form-horizontal" name="join_form" id="join_form">
        <div class="form-group">
            <label for="email" class="col-md-2">이메일<span class="identify">*</span></label>
            <div class="col-md-10">
                <input type="email" name="email" id="email" class="form-control" placeholder="이메일을 입력하세요." />
            </div>
            <button type="submit">중복확인</button>
        </div>
        <div class="form-group">
            <label for="user_pw" class="col-md-2">비밀번호<span class="identify">*</span></label>
            <div class="col-md-10">
                <input type="password" name="user_pw" id="user_pw" class="form-control" placeholder="비밀번호를 입력하세요." />
            </div>
        </div>
        <div class="form-group">
            <label for="user_pw_re" class="col-md-2">비밀번호 확인<span class="identify">*</span></label>
            <div class="col-md-10">
                <input type="password" name="user_pw_re" id="user_pw_re" class="form-control" placeholder="비밀번호와 동일하게 입력하세요." />
            </div>
        </div>
        <div class="form-group">
            <label for="user_name" class="col-md-2">이름<span class="identify">*</span></label>
            <div class="col-md-10">
                <input type="text" name="user_name" id="user_name" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label for="tel" class="col-md-2">전화번호<span class="identify">*</span></label>
            <div class="col-md-10">
                <input type="tel" name="tel" id="tel" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label for='birthdate' class="col-md-2">생년월일 <span class='identify'>*</span></label>
            <div class="col-md-10">
                <input type="date" name="birthdate" id="birthdate" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label for='address' class="col-md-2">주소 <span class='identify'>*</span></label>
            <div class="col-md-10">
                <input type="text" id="postcode" placeholder="우편번호">
                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" id="address" placeholder="도로명 주소"><br>
                <input type="text" id="detailAddress" placeholder="기타 상세 주소">
            </div>
        </div>
        <div class="form-group">
            <label for='user_agreements' class="col-md-2">이용 약관 <span class='identify'>*</span></label>
            <div class="col-md-10">
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
</body>

</html>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>