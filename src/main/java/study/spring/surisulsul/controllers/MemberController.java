package study.spring.surisulsul.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Member;
import study.spring.surisulsul.service.MemberService;

@Controller
public class MemberController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	MemberService memberService;

	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 로그인 페이지로 이동 */
	@RequestMapping(value = "/account/login.do", method = RequestMethod.GET)
	public ModelAndView login(Model model) {
		return new ModelAndView("account/login");
	}

	/** 로그인에 대한 action 페이지 */
	@RequestMapping(value = "/account/login_ok.do", method = RequestMethod.POST)
	public ModelAndView login_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "user_pw", required = false) String pw) {

		/** 1) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다. (로그인 시 이메일과 비밀번호 입력, 유효성 검사는 별도로 하지 않음)
		Member input = new Member();
		input.setEmail(email);
		input.setPw(pw);

		Member output = null;		 // 사용자가 입력한 정보로 DB를 조회한 결과를 받을 객체 준비
		int chkEmailCount = 0;		 // 사용자가 입력한 이메일로 조회되는 건수를 받을 변수 준비
		int chkLogin = 0;			 // 사용자가 입력한 이메일과 비밀번호로 로그인이 성공하는지 여부를 받을 변수 준비 
		
		try {
			// 사용자가 입력한 이메일과 일치하는 정보 건수 조회
			chkEmailCount = memberService.getLoginEmailCount(input);
			
			// 0 이상이면 입력한 이메일이 회원 정보에 존재한다는 의미, 이메일과 패스워드로 로그인 시도
			if(chkEmailCount>0) {
				// 일치하는 메일이 존재할 시 이메일과 비밀번호로 login 처리 (단일행 조회 결과를 output에 받음, 실패하면 catch 블록으로)
				output = memberService.getMemberLogin(input);
				chkLogin = 1;
			} else {
				return webHelper.redirect(null, "로그인 실패");
			}
		} catch (Exception e) {
			// 이메일 조회 건수는 있으나 이메일과 비밀번호로 단일행 조회에 실패 : 비밀번호 오류
			// chkEmailCount와 output 값을 넣어서 리다이렉트한다.
			model.addAttribute("chkEmailCount", chkEmailCount);
			model.addAttribute("chkLogin", chkLogin);
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 로그인 성공 시 Session에 output을 저장, 홈페이지로 이동 */
		// A. Request 객체를 사용해 세션 객체 생성
		HttpSession session = request.getSession();
		
		// B. 세션 저장
		if (output!=null) {
			session.setAttribute("loginInfo", output);
		}
		// C. 홈페이지로 이동
		String redirectUrl = contextPath + "/home.do";
		return webHelper.redirect(redirectUrl,"로그인 되었습니다.");
	}

	/** 회원가입 페이지로 이동 */
	@RequestMapping(value = "/account/join.do", method = RequestMethod.GET)
	public String join(Model model) {
		return "account/join";
	}

	/** 회원가입에 대한 action 페이지 */
	@RequestMapping(value = "/account/join_ok.do", method = RequestMethod.POST)
	public void join_ok(Model model) {

	}

	/** 이메일 찾기 페이지로 이동 */
	@RequestMapping(value = "/account/find_email.do", method = RequestMethod.GET)
	public String find_email(Model model) {
		return "account/find_email";
	}

	/** 이메일 찾기에 대한 action 페이지 */
	@RequestMapping(value = "/account/find_email_ok.do", method = RequestMethod.POST)
	public void find_email_ok(Model model) {

	}

	/** 비밀번호 찾기 페이지로 이동 */
	@RequestMapping(value = "/account/find_pw.do", method = RequestMethod.GET)
	public String find_pw(Model model) {
		return "account/find_pw";
	}

	/** 비밀번호 찾기에 대한 action 페이지 */
	@RequestMapping(value = "/account/find_pw_ok.do", method = RequestMethod.POST)
	public void find_pw_ok(Model model) {

	}

	/** 비밀번호 확인 페이지로 이동 */
	@RequestMapping(value = "/mypage/chk_pw.do", method = RequestMethod.GET)
	public String chk_pw(Model model) {
		return "mypage/chk_pw";
	}

	/** 회원정보 수정 페이지로 이동 */
	@RequestMapping(value = "/mypage/update_info.do", method = RequestMethod.GET)
	public String update_info(Model model) {
		return "mypage/update_info";
	}
}
