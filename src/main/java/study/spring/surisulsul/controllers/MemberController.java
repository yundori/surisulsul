package study.spring.surisulsul.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;

@Controller
public class MemberController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 로그인 페이지로 이동 */
	@RequestMapping(value="/account/login.do", method=RequestMethod.GET)
	public String login(Model model) {
		return "account/login";
	}
	
	/** 로그인에 대한 action 페이지 */
	@RequestMapping(value="/account/login_ok.do", method=RequestMethod.GET)
	public String login_ok(Model model) {
		return "account/login";
	}
	
	/** 회원가입 페이지로 이동 */
	@RequestMapping(value="/account/join.do", method=RequestMethod.GET)
	public String join(Model model) {
		return "account/join";
	}
	
	/** 회원가입에 대한 action 페이지 */
	@RequestMapping(value="/account/join_ok.do", method=RequestMethod.GET)
	public String join_ok(Model model) {
		return "account/join";
	}
	
	/** 이메일 찾기 페이지로 이동 */
	@RequestMapping(value="/account/find_email.do", method=RequestMethod.GET)
	public String find_email(Model model) {
		return "account/find_email";
	}
	
	/** 이메일 찾기에 대한 action 페이지 */
	@RequestMapping(value="/account/find_email_ok.do", method=RequestMethod.GET)
	public String find_email_ok(Model model) {
		return "account/find_email";
	}
	
	/** 비밀번호 찾기 페이지로 이동 */
	@RequestMapping(value="/account/find_pw.do", method=RequestMethod.GET)
	public String find_pw(Model model) {
		return "account/find_pw";
	}
	
	/** 비밀번호 찾기에 대한 action 페이지 */
	@RequestMapping(value="/account/find_pw_ok.do", method=RequestMethod.GET)
	public String find_pw_ok(Model model) {
		return "account/find_pw";
	}
	
	/** 비밀번호 확인 페이지로 이동 */
	@RequestMapping(value="/mypage/chk_pw.do", method=RequestMethod.GET)
	public String chk_pw(Model model) {
		return "mypage/chk_pw";
	}
	/** 회원정보 수정 페이지로 이동 */
	@RequestMapping(value="/mypage/update_info.do", method=RequestMethod.GET)
	public String update_info(Model model) {
		return "mypage/update_info";
	}
}
