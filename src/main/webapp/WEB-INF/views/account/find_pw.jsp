<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/join.css?time=${currentTime}" />
  <link rel="stylesheet" type="text/css" href="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.css?time=${currentTime}" />
    <!-- 비밀번호 재발급에 필요한 정보를 입력하는 폼 : 데이터 조회(where) 조건 -->
    <!-- 형식 검사 할 것인지? -->
    <form class="form-horizontal" name="join_form" id="find_pw_form" action="${pageContext.request.contextPath}/find_pw">
        <div class="form-group">
            <h3 class="account-menu text-center">비밀번호 찾기</h3>
            <span class="account-menu-detail text-center">
                <p>가입 시 입력한 비밀번호를 잊으셨나요?<br />
                    수리술술에 가입한 이름, 핸드폰 번호, 이메일을 정확히 입력해 주세요.</p>
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
            <label for="email" class="col-md-4">이메일</label>
            <div class="col-md-8">
                <input type="email" name="email" id="email" class="form-control" placeholder="이메일을 입력하세요." />
            </div>
        </div>
        <div class="form-group">
            <div class="text-center">
                <button type="submit">새 비밀번호 발급</button>
            </div>
        </div>
    </form>
    
    <!--Google CDN 서버로부터 jQuery 참조 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    <script src="${contextPath}/assets/js/jquery.barrating.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
    <script src="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
    <script src="${contextPath}/assets/plugins/validate/jquery.validate.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
    <script src="${contextPath}/assets/plugins/validate/additional-methods.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
    <script src="${contextPath}/assets/js/common.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
    <script src="${contextPath}/assets/js/join.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
    $(function() {
        // #addForm에 대한 submit이벤트를 가로채서 Ajax요청을 전송한다.
        $("#find_pw_form").ajaxForm({
            // 전송 메서드 지정
            method: "POST",
            // 서버에서 200 응답을 전달한 경우 실행됨
            success: function(json) {
                console.log(json);
                
                // json에 포함된 데이터를 활용하여 상세페이지로 이동한다.                
                if (json.result == "OK") {
                	swal({
	                    title: "비밀번호 찾기",
	                    text: "새 비밀번호가 이메일로 발급되었습니다. 다시 로그인 해주세요.",
	                    type: "success"
	                }).then((value)=>{ window.location="${pageContext.request.contextPath}/account/login.do"; });                   
                } else if (json.result=="INPUT_ERROR") {
                	swal({
	                    title: "비밀번호 찾기",
	                    text: "입력하신 회원 정보가 올바르지 않습니다.",
	                    type: "warning"
	                });
                } else {
                	swal({
	                    title: "비밀번호 찾기",
	                    text: "비밀번호 재발급에 실패했습니다.",
	                    type: "error"
	                });
                }
            }
        });
    });
	</script>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>