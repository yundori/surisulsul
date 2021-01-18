<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/join.css?time=${currentTime}" />

  <div class="chk-pw-box">
        <div class="box-title">
            비밀번호 확인
        </div>
        <span class="box-alert">회원정보 수정을 위해<br />비밀번호를 한 번 더 입력해 주세요.</span>
        <div class="input-pw-box">
            <label for="chk-pw col-md-4">비밀번호</label>
            <input type="password" name="chk-pw" id="chk-pw" placeholder="비밀번호를 입력해주세요." />
        </div>
        <div>
            <button type="submit">확인</button>
            <button type="reset" class="button-cancle">취소</button>
        </div>
    </div>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>