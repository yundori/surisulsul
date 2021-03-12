package study.spring.surisulsul.controllers;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.surisulsul.helper.MailHelper;
import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Member;
import study.spring.surisulsul.service.MemberService;

@RestController
public class MemberRestController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	MailHelper mailHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	MemberService memberService;

	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 이메일 중복확인에 대한 action 페이지 */
	@RequestMapping(value = "email_chk", method = RequestMethod.POST)
	public Map<String, Object> email_chk(
			HttpServletRequest request,
			@RequestParam(value="chk_email", required=false) String email) {
		
		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리한다.
		if (email.equals("")) {
			return webHelper.getJsonWarning("이메일을 입력하세요.");
		}
		
		/** 2) 데이터 조회하기 */
		// 데이터를 조회하기 위해 필요한 값을 Beans에 담는다.
		Member input = new Member();
		input.setEmail(email);
		
		String result = null;
		
		try {
			if (memberService.getJoinEmailCount(input)==0) {
				result = "OK";
			}
			
		} catch (Exception e) {
			result="FAIL";
		}
		
		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return webHelper.getJsonData(map);
	}
	
	/** 비밀번호 찾기에 대한 action 페이지 */
	@RequestMapping(value = "find_pw", method = RequestMethod.POST)
	public Map<String, Object> find_pw(Model model,
			HttpServletRequest request,
			@RequestParam(value="user_name", required=false) String name,
			@RequestParam(value="tel", required=false) String phone,
			@RequestParam(value="email", required=false) String email) {
		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리한다.
		// 이름에 대한 유효성 검사
		if (name.equals("")) { return webHelper.getJsonWarning("이름을 입력하세요."); }
		if(!regexHelper.isKor(name)) {return webHelper.getJsonWarning("이름은 한글만 가능합니다.");}
		
		// 핸드폰 번호에 대한 유효성 검사
		if (phone.equals("")) { return webHelper.getJsonWarning("핸드폰 번호를 - 없이 입력하세요."); }
		if(!regexHelper.isCellPhone(phone)) {return webHelper.getJsonWarning("핸드폰 번호를 - 없이 올바른 양식으로 입력해 주세요.");}
		
		// 이메일에 대한 유효성 검사
		if (email.equals("")) { return webHelper.getJsonWarning("이메일을 입력하세요."); }
		if(!regexHelper.isEmail(email)) {return webHelper.getJsonWarning("입력하신 이메일의 형식이 바르지 않습니다."); }
		
		/** 2) 데이터 조회하기 */
		// 데이터를 조회하기 위해 필요한 값을 Beans에 담는다.
		Member input = new Member();
		input.setName(name);
		input.setPhone(phone);
		input.setEmail(email);
		
		String result = null;			//  성공 여부를 구분할 문자열
		Member update_info = null;      //  비밀번호 재발급을 위해 로드할 회원 정보 (회원 정보 업데이트용)
		
		try {
			if (memberService.getPasswordCount(input)>0) {  // 입력한 회원 정보 조회에 성공하면
				result = "OK";
				try {
					update_info = memberService.getPasswordMember(input);    // 회원 정보를 불러옴
					
					// 비밀번호 난수 생성을 위한 구문
					StringBuffer newPw = new StringBuffer();     // 새로 생성되는 비밀번호를 입력받을 문자열
					Random rnd = new Random();
					for (int i = 0; i < 9; i++) {
					    int rIndex = rnd.nextInt(3);        // 소문자, 대문자, 숫자를 구분하기 위한 난수
					    switch (rIndex) {
					    case 0:
					        // a-z
					        newPw.append((char) ((int) (rnd.nextInt(26)) + 97));    // 소문자 난수
					        break;
					    case 1:
					        // A-Z
					        newPw.append((char) ((int) (rnd.nextInt(26)) + 65));    // 대문자 난수
					        break;
					    case 2:
					        // 0-9
					        newPw.append((rnd.nextInt(10)));             // 숫자 난수
					        break;
					    }
					}
					
					System.out.println("[CAUTION] 새로 생성된 비밀번호 : "+ newPw.toString());
					
					update_info.setPw(newPw.toString());          // 비밀번호를 새로 세팅
					memberService.editMember(update_info);      // 새로 세팅한 비밀번호로 회원 정보 업데이트
					
					try {
						mailHelper.sendMail(update_info.getEmail(), update_info.getName() +
								" 회원님의 비밀번호가 재발급되었습니다.", "안녕하세요, 회원님. 수리술술에서 발송한 메일입니다.\n " + 
						update_info.getEdit_date()+"에 재발급된 회원님의 비밀번호는 " + newPw.toString() +" 입니다.");
					} catch (Exception e) {
						e.printStackTrace();
						result = "SEND_MAIL_FAIL";
					}
				} catch (Exception e) {
					result = "UPDATE_FAIL";
				}
			} else {
				result="INPUT_ERROR";
			}
			
		} catch (Exception e) {
			result="INPUT_ERROR";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return webHelper.getJsonData(map);
	}
	
	
	/** 비밀번호 확인에 대한 action 페이지 */
	@RequestMapping(value = "chk_pw", method = RequestMethod.POST)
	public Map<String, Object> chk_pw(Model model,
			HttpServletRequest request,
			@RequestParam(value="chk-email", required=false) String email,
			@RequestParam(value="chk-pw", required=false) String password) {
		//세션값 받아오기
		HttpSession session = request.getSession();		
		Member loginSession = (Member) session.getAttribute("loginInfo");
		
				
		//로그인 세션이 없을 경우 = 로그인되어있지 않을 경우 alert 발생
		if(loginSession==null) { 
			return webHelper.getJsonWarning("로그인 후 이용해주세요.");
		} else {
			System.out.println(loginSession.toString());
		}
		
		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리한다.
		if (password.equals("")) {
			return webHelper.getJsonWarning("비밀번호를 입력하세요.");
		}
		
		/** 2) 데이터 조회하기 */
		// 데이터를 조회하기 위해 필요한 값을 Beans에 담는다.
		Member input = new Member();
		input.setEmail(email);
		input.setPw(password);
		
		Member output = null;
		String result = null;
		
		try {
			output = memberService.getChkPw(input);
			if (output.getPw().equals(loginSession.getPw())) {
				result = "OK";
			}
			
		} catch (Exception e) {
			result="FAIL";
		}
		
		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return webHelper.getJsonData(map);
	}

}
