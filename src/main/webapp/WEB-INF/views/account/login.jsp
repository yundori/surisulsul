<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/join.css?time=${currentTime}" />
    <!-- 로그인에 필요한 정보를 입력하는 폼 : 데이터 조회(where) 조건 -->
    <form class="form-horizontal" name="join_form" id="join_form">
        <div class="form-group">
            <h3 class="account-menu text-center">로그인</h3>
        </div>
        <div class="form-group">
            <label for="email" class="col-md-4">이메일</label>
            <div class="col-md-8">
                <input type="email" name="email" id="email" class="form-control" placeholder="이메일을 입력하세요." />
            </div>
        </div>
        <div class="form-group">
            <label for="user_pw" class="col-md-4">비밀번호</label>
            <div class="col-md-8">
                <input type="password" name="user_pw" id="user_pw" class="form-control" placeholder="비밀번호를 입력하세요."/>
            </div>
        </div>
        <div class="form-group">
            <div class="text-center">
                <button type="submit">로그인</button>
            </div>
        </div>
        <div class="form-group">
            <div class="print-alert text-center">
            <!-- 입력한 이메일만으로 데이터 조회 실패 시 문구가 뜨도록 할 것 -->
            <!-- <c:if test="${해당 이메일로 조화한 건수}==0"></c:if>-->
            <p>가입한 이메일이 없거나, 입력한 이메일이 올바르지 않습니다.</p>
            <!-- 입력한 이메일만으로는 조회 데이터가 있으나 이메일&비밀번호 조건으로 데이터 조회 실패 시 문구가 뜨도록 할 것 -->
            <!-- <c:if test="${해당 이메일로 조회한 건수}>0 && ${해당 이메일과 비밀번호로 동시 조회한 건수}==0"></c:if>-->
            <p>입력한 비밀번호가 올바르지 않습니다.</p>
            <!-- form에 입력한 결과를 전송해서 데이터를 조회하기 전에는 아무것도 뜨지 않게 할 것 -->
            </div>
        </div>
    </form>
    <div>
        <a href="../join.jsp">회원가입</a>
        <a href="../find_email.jsp">이메일 찾기</a>
        <a href="../find.pw.jsp">비밀번호 찾기</a>
    </div>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>