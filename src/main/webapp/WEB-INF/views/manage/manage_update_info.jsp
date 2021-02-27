<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/join.css?time=${currentTime}" />
  <link rel="stylesheet" type="text/css" href="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.css?time=${currentTime}" />

    <!-- 형식 검사 필수 -->
    <form class="form-horizontal" name="update_form" id="update_form" action="${pageContext.request.contextPath}/manage_update_info_ok.do" method="post">
        <input type="hidden"  name="id" id="id" class="form-control" value="${output.id }" />
        
        <div class="form-group">
            <h3 class="account-menu text-center">회원정보 수정</h3>
        </div>
        
        <div class="form-group">
            <label for="is_out" class="col-md-4">상태<span class="identify">*</span></label>
            <input type="hidden" name="is_out" id="is_out" class="form-control" value="${output.is_out }"/>
            <input type="hidden" name="out_date" id="out_date" class="form-control" value="${output.out_date }"/>
            <div class="col-md-6">
            
                <select name="is_out_changed" id="is_out_changed">
                <c:choose>
        			<c:when test="${output.is_out eq 'N' }">
                	<option value="N" selected>정상</option>
                	<option value="Y">탈퇴</option>
                	</c:when>
                	<c:otherwise>
                	<option value="Y" selected>탈퇴</option>
                	<option value="N">정상</option>
                	</c:otherwise>
                </c:choose>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-md-4">이메일<span class="identify">*</span></label>
            <div class="col-md-6">
              <input type="email" name="user_email" id="user_email" class="form-control" value="${output.email }"/>
            </div>
        </div>
        <div class="form-group">
            <label for="user_pw" class="col-md-4">비밀번호<span class="identify">*</span></label>
            <div class="col-md-6">
            	<input type="hidden" name="user_pw" id="user_pw" class="form-control" value="${output.pw }"/>
                <input type="password" name="user_pw_changed" id="user_pw_changed" class="form-control" placeholder="비밀번호를 입력하세요." />
            </div>
        </div>
        <div class="form-group">
            <label for="user_name" class="col-md-4">이름<span class="identify">*</span></label>
            <div class="col-md-6">
                <input type="name" name="user_name" id="user_name" class="form-control" value="${output.name }"/>
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