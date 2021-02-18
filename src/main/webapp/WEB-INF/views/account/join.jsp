<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/join.css?time=${currentTime}" />
 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/plugins/sweetalert/sweetalert2.min.css?time=${currentTime}" />

    <!-- 형식 검사 필수 -->
    <!-- 파라미터 전송 시 RegexHelper로 다시 한 번 형식검사 필수, method=post, action="이동할 페이지"-->
    <form class="form-horizontal" name="join_form" id="join_form" method="post" action="${pageContext.request.contextPath}/account/join_ok.do">
        <div class="form-group">
            <h3 class="account-menu text-center">회원가입</h3>
        </div>
        <div class="form-group">
            <label for="email" class="col-md-4">이메일<span class="identify">*</span></label>
            <div class="col-md-6">
                <!-- 중복확인이 끝났더라도 아이디 창에 새로 키를 입력하면 중복확인을 초기화시킬것 -->
                <!-- onkeydown="inputEmail()" -->
                <input type="email" name="email" id="email" class="form-control" onkeydown="inputEmail()" placeholder="이메일을 입력하세요." />
            </div>
            <!-- 클릭 시 db에서 값을 받아와 사용자가 입력한 email 값과 일치하는 데이터가 있는지 조회, 일치하는 값이 있으면 email-duplication의 value를 email-unuse, 없으면 email-chk로 변경 (js로 할 것) -->
            <!-- onclick = "emailChk()" -->
            <input type="button" value="중복확인" class="chk-email" id="chk-email" />
            <!-- 여기의 값이 email-chk가 되면 중복확인 통과 -->
            <input type="hidden" name="emailChk" id="emailChk" />
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
                <h4 class="term-title">개인정보 이용 약관</h4>
                <div class="terms-box"><b>1. 개인정보의 처리목적</b><br/> <수리술술>은 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.
<br/>
   - 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급․배송 등
<br/>
 <b>2. 개인정보의 처리 및 보유기간</b><br/>
   ① <수리술술>은 정보주체로부터 개인정보를 수집할 때 동의받은 개인정보 보유․이용기간 또는 법령에 따른 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.<br/>
   ② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.<br/>
    - 고객 가입 및 관리 : 서비스 이용계약 또는 회원가입 해지시까지, 다만 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지<br/>
    - 전자상거래에서의 계약․청약철회, 대금결제, 재화 등 공급기록 : 5년<br/>

 <b>3. 개인정보의 제3자 제공</b><br/> <수리술술>은 정보주체의 별도 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조에 해당하는 경우 외에는 개인정보를 제3자에게 제공하지 않습니다. </div>
                <label><input type='checkbox' name='terms' class='term' id='info-term' value='개인정보 이용약관'>&nbsp;개인정보 이용 약관 동의</label>
                <h4 class="term-title">사이트 이용 약관</h4>
                <div class="terms-box"><b>제 1 조 (목적)</b><br/>
본 약관은 통계청이 운영하는 국가통계포털(KOSIS), 마이크로데이터서비스(MDIS), 국가지표체계(e-나라지표/국가주요지표), 통계지리정보서비스(SGIS+plus), 통계데이터센터의 통계정보 사이트 (이하 "당 사이트")에서 제공하는 모든 서비스(이하 “서비스”)의 이용조건 및 절차, 이용자와 각 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br/><br/>

<b>제 2 조 (약관의 효력과 변경)</b><br/>
당 사이트는 이용자가 본 약관 내용에 동의하는 것을 조건으로 이용자에게 서비스를 제공하며, 당 사이트의 서비스 제공 행위 및 이용자의 서비스 사용 행위에는 본 약관을 우선적으로 적용하겠습니다.<br/>
당 사이트는 본 약관을 사전 고지 없이 변경할 수 있으며, 변경된 약관은 당 사이트 내에 공지함으로써 이용자가 직접 확인하도록 할 것입니다. 이용자가 변경된 약관에 동의하지 아니하는 경우 본인의 회원등록을 취소(회원 탈퇴)할 수 있으며, 계속 사용할 경우에는 약관 변경에 대한 암묵적 동의로 간주됩니다. 변경된 약관은 공지와 동시에 그 효력을 발휘합니다.<br/><br/>
<b>제 3 조 (약관외 준칙)</b><br/>
본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신윤리강령, 저작권법 및 기타 관련 법령의 규정에 의합니다.<br/><br/>

<b>제 4 조 (용어의 정의)</b><br/>
본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br/>
이용자 : 본 약관에 따라 당 사이트가 제공하는 서비스를 받는 자<br/>
회원 : 당 사이트에 개인 정보를 제공하여 회원 등록을 한 자로서, 당 사이트의 정보 및 서비스를 이용할 수 있는 자<br/>
아이디 : 당 사이트 회원가입 시 발급받은 회원의 신분을 증명하는 고유 코드<br/>
비밀번호 : 아이디에 대한 본인 여부를 확인하기 위하여 사용하는 문자, 숫자, 특수 문자등의 조합<br/>
가입 : 회원가입 시 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위<br/>
탈퇴 : 회원이 이용계약을 종료시키는 행위<br/>
본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도 약관 및 이용규정에서 정의합니다.<br/></div>
                <label><input type='checkbox' name='terms' class='term' id='site-term' value='사이트 이용약관'>&nbsp;사이트 이용 약관 동의</label><br/>
                <label><input type='checkbox' name='terms' class='all-terms' id='terms' value='이용약관'>&nbsp;이용 약관 전체 동의</label>
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
    <script type="text/javascript">
    $(function() {
		/** 버튼 클릭시 이벤트 */
		$("#chk-email").click(function() {
			// 입력값을 취득하고, 내용의 존재여부를 검사한다.
			var email_val = $("#email").val();

			if (!email_val) {	// 입력되지 않았다면?
				swal({
                    title: "이메일 중복확인",
                    text: "이메일을 입력하세요.",
                    type: "warning"
                });	// <-- 메시지 표시
				$("#email").focus();			// <-- 커서를 강제로 넣기
				return false;					// <-- 실행 중단
			}

			// 위의 if문을 무사히 통과했다면 내용이 존재한다는 의미이므로,
			// 입력된 내용을 Ajax를 사용해서 웹 프로그램에게 전달한다.
			$.post("${pageContext.request.contextPath}/email_chk", { chk_email: email_val }, function(req) {
				// 사용 가능한 아이디인 경우 --> req = { result: "OK" }
				// 사용 불가능한 아이디인 경우 --> req = { result: "FAIL" }
				if (req.result=="OK") {
					swal({
	                    title: "이메일 중복확인",
	                    text: "사용 가능한 이메일입니다.",
	                    type: "success"
	                });
					$("#emailChk").val("중복확인");
					
				} else {
					swal({
	                    title: "이메일 중복확인",
	                    text: "사용할 수 없는 이메일입니다.",
	                    type: "warning"
	                });
					$("#email").val("");
					$("#email").focus();
				}
			}); // end $.get
		}); // end click
	});
    </script>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>