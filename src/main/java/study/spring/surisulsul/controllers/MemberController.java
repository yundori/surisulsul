package study.spring.surisulsul.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
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
		//int chkLogin = 0;			 // 사용자가 입력한 이메일과 비밀번호로 로그인이 성공하는지 여부를 받을 변수 준비 
		
		try {
			// 사용자가 입력한 이메일과 일치하는 정보 건수 조회
			chkEmailCount = memberService.getLoginEmailCount(input);
			
			// 0 이상이면 입력한 이메일이 회원 정보에 존재한다는 의미, 이메일과 패스워드로 로그인 시도
			if(chkEmailCount>0) {
				// 일치하는 메일이 존재할 시 이메일과 비밀번호로 login 처리 (단일행 조회 결과를 output에 받음, 실패하면 catch 블록으로)
				output = memberService.getMemberLogin(input);
				//chkLogin = 1;
			} else {
				//model.addAttribute("chkEmailCount", chkEmailCount);
				//model.addAttribute("chkLogin", chkLogin);
				return webHelper.redirect(null, "입력한 이메일이 올바르지 않습니다.");
				//return new ModelAndView("account/login");
				// return webHelper.redirect(null, "로그인 실패");
				//return webHelper.sweetalertRedirect(null, "로그인 실패","입력한 이메일이 올바르지 않습니다.","warning");
				
			}
		} catch (Exception e) {
			// 이메일 조회 건수는 있으나 이메일과 비밀번호로 단일행 조회에 실패 : 비밀번호 오류
			// chkEmailCount와 chkLogin 값, 기존에 입력했던 이메일을 넣어서 리다이렉트한다.
			//chkEmailCount = 1;
			//model.addAttribute("chkEmailCount", chkEmailCount);
			//model.addAttribute("chkLogin", chkLogin);
			//model.addAttribute("email", email);
			//return new ModelAndView("account/login");
			return webHelper.redirect(null, "입력한 비밀번호가 올바르지 않습니다.");
			//return webHelper.sweetalertRedirect(null, "로그인 실패","입력한 비밀번호가 올바르지 않습니다.","warning");
		}
		
		/** 3) 로그인 성공 시 Session에 output을 저장, 홈페이지로 이동 */
		// A. Request 객체를 사용해 세션 객체 생성
		HttpSession session = request.getSession();
		
		// B. 세션 저장
		if (output!=null) {
			session.setAttribute("loginInfo", output);
		}
		// C. 홈페이지로 이동
		String redirectUrl = contextPath + "/";
		System.out.println(output.toString());
		return webHelper.redirect(redirectUrl, "수리술술에 오신 것을 환영합니다.");
	}

	/** 회원가입 페이지로 이동 */
	@RequestMapping(value = "/account/join.do", method = RequestMethod.GET)
	public ModelAndView join(Model model) {
		return new ModelAndView("account/join");
	}

	/** 회원가입에 대한 action 페이지 */
	@RequestMapping(value = "/account/join_ok.do", method = RequestMethod.POST)
	public ModelAndView join_ok(Model model,
			@RequestParam(value="email", required=false) String email,
			@RequestParam(value="emailChk", required=false) String emailChk,
			@RequestParam(value="user_pw", required=false) String pw,
			@RequestParam(value="user_pw_re", required=false) String pw_re,
			@RequestParam(value="user_name", required=false) String name,
			@RequestParam(value="tel", required=false) String phone,
			@RequestParam(value="birthdate", required=false) String birthdate,
			@RequestParam(value="postcode", required=false) String postcode,
			@RequestParam(value="address", required=false) String address1,
			@RequestParam(value="detailAddress", required=false) String address2,
			@RequestParam(value="terms", required=false) List<String> terms) {

		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 이메일 유효성 검사
		if(email.equals("")) {return webHelper.redirect(null, "이메일을 입력하세요.");}
		if(!regexHelper.isEmail(email)) {return webHelper.redirect(null, "입력하신 이메일의 형식이 바르지 않습니다."); }
		if(emailChk.equals("email-unchk")) {return webHelper.redirect(null, "이메일 중복확인이 필요합니다.");}
		if(emailChk.equals("email-unuse")) {return webHelper.redirect(null, "입력하신 이메일이 사용중입니다.");}
		
		// 비밀번호+비밀번호 확인 유효성 검사
		if(pw.equals("")) {return webHelper.redirect(null, "비밀번호를 입력하세요.");}
		if(pw_re.equals("")) {return webHelper.redirect(null, "비밀번호 확인란에 비밀번호를 입력하세요.");}
		
		// 이름 유효성 검사
		if(name.equals("")) {return webHelper.redirect(null, "이름을 입력하세요.");}
		if(!regexHelper.isKor(name)) {return webHelper.redirect(null, "이름은 한글만 가능합니다.");}
		
		// 핸드폰 번호 유효성 검사
		if(phone.equals("")) {return webHelper.redirect(null, "핸드폰 번호를 입력하세요.");}
		if(!regexHelper.isCellPhone(phone)) {return webHelper.redirect(null, "핸드폰 번호를 - 없이 올바른 양식으로 입력해 주세요.");}
		
		// 생년월일 유효성 검사
		if(birthdate.equals("")) {return webHelper.redirect(null, "생년월일을 입력하세요.");}
		
		// 주소 유효성 검사
		if(postcode.equals("")) {return webHelper.redirect(null, "우편번호를 입력하세요.");}
		if(address1.equals("")) {return webHelper.redirect(null, "주소를 입력하세요.");}
		if(address2.equals("")) {return webHelper.redirect(null, "상세주소를 입력하세요.");}
		
		// 이용약관 동의 유효성 검사
		if(terms.size()<3) {return webHelper.redirect(null, "이용약관에 모두 동의해주세요.");}
				
		
		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Member input = new Member();
		input.setEmail(email);
		input.setPw(pw);
		input.setName(name);
		input.setPhone(phone);
		input.setBirthdate(birthdate);
		input.setPostcode(postcode);
		input.setAddress1(address1);
		input.setAddress2(address2);
		
		try {
			// 데이터 저장
			// 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK 값이 저장된다.
			memberService.addMember(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장 시 생성된 PK 값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/account/login.do";
		return webHelper.redirect(redirectUrl, "회원가입이 완료되었습니다.\n로그인 후 수리술술을 이용하실 수 있습니다.");
	}

	/** 이메일 찾기 페이지로 이동 */
	@RequestMapping(value = "/account/find_email.do", method = RequestMethod.GET)
	public ModelAndView find_email(Model model,
			@RequestParam(value="findEmailCount", defaultValue="-1") int findEmailCount,
			@RequestParam(value="findEmail", required=false) Member findEmail) {
		model.addAttribute("findEmailCount", findEmailCount);
		if(findEmail!=null) {
			model.addAttribute("findEmail", findEmail);
		} else {
			model.addAttribute("findEmail", null);
		}
		return new ModelAndView("account/find_email");
	}

	/** 이메일 찾기에 대한 action 페이지 */
	@RequestMapping(value = "/account/find_email_ok.do", method = RequestMethod.POST)
	public ModelAndView find_email_ok(Model model,
			@RequestParam(value="user_name", required=false) String name,
			@RequestParam(value="tel", required=false) String phone) {
		
		/** 1) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다. (로그인 시 이메일과 비밀번호 입력, 유효성 검사는 별도로 하지 않음)
		Member input = new Member();
		input.setName(name);
		input.setPhone(phone);

		Member findEmail = null;		 // 사용자가 입력한 정보로 DB를 조회한 결과를 받을 객체 준비
		int findEmailCount = 0;		 // 사용자가 입력한 정보로 조회가 성공하는지 여부를 받을 변수 준비 
		
		try {
			// 사용자가 입력한 이메일과 일치하는 정보 조회
			findEmail = memberService.getMemberEmail(input);
		} catch (Exception e) {
			// 일치하는 정보가 없을 경우
			// chkEmailCount와 chkLogin 값, 기존에 입력했던 이메일을 넣어서 리다이렉트한다.
			findEmailCount = 0;
			model.addAttribute("findEmailCount", findEmailCount);
			model.addAttribute("findEmail", null);
			return new ModelAndView("account/find_email");
		}
		
		/** 3) 입력한 정보가 일치할 경우 조회 성공 여부와 조회 결과를 받아 이메일 찾기 페이지로 리다이렉트 */
		findEmailCount = 1;
		
		model.addAttribute("findEmailCount", findEmailCount);
		model.addAttribute("findEmail", findEmail);
		return new ModelAndView("account/find_email");
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
	
	/** 이메일 중복확인에 대한 action 페이지 */
	@RequestMapping(value = "/account/email_chk.do", method = RequestMethod.POST)
	public void email_chk(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="chk_email", required=false) String email) throws ServletException, IOException {		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");

		Member input = new Member();
		input.setEmail(email);
		String result = "OK";
		try {
			if (memberService.getJoinEmailCount(input)>0) {
				result = "FAIL";
			}
			
		} catch (Exception e) {
			result="OK";
		}
		
		JSONObject json = new JSONObject();
		json.put("result", result);
		response.getWriter().print(json);
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
