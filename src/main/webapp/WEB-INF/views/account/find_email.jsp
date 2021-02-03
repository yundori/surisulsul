<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

    <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/join.css?time=${currentTime}" />
    <!-- 이메일을 찾는 데필요한 정보를 입력하는 폼 : 데이터 조회(where) 조건 -->
    <!-- 형식 검사 할 것인지? -->
    <form class="form-horizontal" name="join_form" id="join_form" method="post" action="${pageContext.request.contextPath}/account/find_email_ok.do">
        <div class="form-group">
            <h3 class="account-menu text-center">이메일 찾기</h3>
            <span class="account-menu-detail text-center">
                <p>가입 시 입력한 이메일을 잊으셨나요?<br />
                    수리술술에 가입한 이름과 핸드폰 번호를 정확히 입력해 주세요.</p>
            </span>
        </div>
        <div class="form-group">
            <label for='user_name' class="col-md-4">이름</label>
            <div class="col-md-8">
                <input type="text" name="user_name" id="user_name" class="form-control" placeholder="이름을 입력하세요." />
            </div>
        </div>
        <div class="form-group">
            <label for='tel' class="col-md-4">전화번호</label>
            <div class="col-md-8">
                <input type="tel" name="tel" id="tel" class="form-control" placeholder="휴대폰 번호를 - 없이 입력하세요." />
            </div>
        </div>
        <div class="form-group">
            <div class="text-center">
                <button type="submit">이메일 확인</button>
            </div>
        </div>
        <div class="form-group">
            <div class="print-alert text-center">
                <!-- 데이터 조회에 성공했을 때 해당 텍스트를 출력하기 -->
                <c:choose>
                	<c:when test="${findEmailCount>0}">
                		<p>회원님이 수리술술에 가입한 이메일은 ${findEmail.email} 입니다.</p>
                	</c:when>
                	<c:when test="${findEmailCount==0}">
                		<p><font color="#ff0000">해당 정보로 사이트에 등록된 이메일이 없습니다.</font></p>
                	</c:when>
                </c:choose>
            </div>
        </div>
    </form>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>