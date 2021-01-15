<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8" />
    <title>로그인</title>
            <!-- 크로스 브라우징 호환성 시작 -->
<link rel="stylesheet" type="text/css" href="../assets/css/reset.css" />
<!-- 크로스 브라우징 호환성 끝 -->
<!-- CSS 파일 참조 처리 -->
<link rel="stylesheet" type="text/css" href="../assets/css/common.css" />
<link rel="stylesheet" type="text/css" href="../assets/css/join.css" />
</head>

<body>
    <h3>로그인</h3>
    <!-- 로그인에 필요한 정보를 입력하는 폼 : 데이터 조회(where) 조건 -->
    <form class="form-horizontal" name="join_form" id="join_form">
        <div class="form-group">
            <label for="email" class="col-md-2">이메일<span class="identify">*</span></label>
            <div class="col-md-10">
                <input type="email" name="email" id="email" class="form-control" placeholder="이메일을 입력하세요." />
            </div>
        </div>
        <div class="error_alert">
            <!-- 입력한 이메일만으로 데이터 조회 실패 시 문구가 뜨도록 할 것 -->
            <p>가입한 이메일이 없거나, 입력한 이메일이 올바르지 않습니다.</p>
        </div>
        <div class="form-group">
            <label for="user_pw" class="col-md-2">비밀번호<span class="identify">*</span></label>
            <div class="col-md-10">
                <input type="password" name="user_pw" id="user_pw" class="form-control" placeholder="비밀번호를 입력하세요."/>
            </div>
        </div>
        <div class="error_alert">
            <!-- 입력한 이메일만으로는 조회 데이터가 있으나 이메일&비밀번호 조건으로 데이터 조회 실패 시 문구가 뜨도록 할 것 -->
            <p>입력한 비밀번호가 올바르지 않습니다.</p>
        </div>
        <div class="form-group">
            <div class="text-center">
                <button type="submit">로그인</button>
            </div>
        </div>
    </form>
    <div>
        <a href="../join.jsp">회원가입</a>
        <a href="../find_email.jsp">이메일 찾기</a>
        <a href="../find.pw.jsp">비밀번호 찾기</a>
    </div>
</body>

</html>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>