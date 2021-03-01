package study.spring.surisulsul.controllers;

import java.util.List;

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

import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Member;
import study.spring.surisulsul.service.ManageOrdersService;
import study.spring.surisulsul.service.MemberService;
import study.spring.surisulsul.service.OrderService;
import study.spring.surisulsul.service.ReviewAndQnaService;

@Controller
public class ManageBasicController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	MemberService memberService;

	@Autowired
	OrderService orderService;

	@Autowired
	ManageOrdersService manageService;

	@Autowired
	ReviewAndQnaService reviewAndQnaService;

	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 관리자 - 로그인 페이지 이동 처리 */
	@RequestMapping(value = "/manage.do", method = RequestMethod.GET)
	public ModelAndView manage_login(Model model, HttpServletRequest request) throws Exception {
		// 세션값 받아오기
		HttpSession session = request.getSession();
		String manageLoginSession = (String) session.getAttribute("manager_id");

		if (manageLoginSession != null) {
			return webHelper.redirect(null, "관리자 페이지 로그인이 이미 되어있습니다.");
		}

		return new ModelAndView("manage/manage_login");

	}

	/** 관리자 - 로그인 action 페이지 */
	@RequestMapping(value = "/manage_login_ok.do", method = RequestMethod.POST)
	public ModelAndView login_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "manager_id", required = false) String id,
			@RequestParam(value = "manager_pw", required = false) String pw) {

		/** 관리자 ID / password와 일치하는지 확인 */
		if (id.equals("managerSuri")) {
			if (pw.equals("sul123!@#")) {
				// 로그인 성공 시 세션 객체 생성
				HttpSession session = request.getSession();
				session.setAttribute("manager_id", id);
			} else {
				return webHelper.redirect(null, "패스워드가 잘못되었습니다. 다시 시도해주세요.");
			}
		} else {
			return webHelper.redirect(null, "ID가 잘못되었습니다. 다시 시도해주세요.");
		}

		/** 관리자 홈으로 이동 */
		String redirectUrl = contextPath + "/manage_home.do";
		return webHelper.redirect(redirectUrl, "관리자 로그인 성공");
	}

	/** 관리자 - 로그인 확인 후 manage_home 페이지로 이동 처리 */
	@RequestMapping(value = "/manage_home.do", method = RequestMethod.GET)
	public ModelAndView manage_login_ok(Model model, HttpServletRequest request) {
		// 세션 값 받아오기
		HttpSession session = request.getSession();
		String manageLoginSession = (String) session.getAttribute("manager_id"); // 관리자 로그인 세션

		// 로그인 세션이 없을 경우 = 로그인되어있지 않을 경우 alert 발생
		if (manageLoginSession == null) {
			return webHelper.redirect(contextPath + "/manage.do", "관리자 로그인 후 이용해주세요..");
		}

		// 값 저장할 객체
		int todayIn = 0; // 오늘 가입 회원 수
		int todayOut = 0; // 오늘 탈퇴 회원 수
		int qnaCount = 0; // 오늘 문의 수
		int orderCount = 0; // 오늘 주문 수

		// 조회한 데이터 저장하기 : 가입 회원 수
		try {
			todayIn = memberService.getMemberInTodayCount();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 조회한 데이터 저장하기 : 탈퇴 회원 수
		try {
			todayOut = memberService.getMemberOutTodayCount();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 조회한 데이터 저장하기 : 문의 수
		try {
			qnaCount = reviewAndQnaService.getNewQnaCount();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 조회한 데이터 저장하기 : 주문 수
		try {
			orderCount = manageService.getNewOrderCount();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("todayIn", todayIn);
		model.addAttribute("todayOut", todayOut);
		model.addAttribute("qnaCount", qnaCount);
		model.addAttribute("orderCount", orderCount);

		return new ModelAndView("manage/manage_home");
	}
}
