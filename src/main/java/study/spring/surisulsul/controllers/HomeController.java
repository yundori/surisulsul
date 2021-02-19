package study.spring.surisulsul.controllers;

import java.text.DateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Member;
import study.spring.surisulsul.model.Product;
import study.spring.surisulsul.service.MemberService;
import study.spring.surisulsul.service.ProductService;
import study.spring.surisulsul.service.SalesService;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class HomeController {

	/** Service 패턴 구현체 주입 */
	
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	ProductService productService;

	@Autowired
	MemberService memberService;

	@Autowired
	SalesService salesService;

	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	// private static final Logger logger =
	// LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		// 세션 값 받아오기
		HttpSession session = request.getSession();
		Member loginSession = (Member)session.getAttribute("loginInfo");
		Member output = null;

		boolean jn_result = false;
		List<Product> jn_output = null;

		// 로그인 세션이 없을 경우 = 로그인이 안됐을 경우 alert 발생
		if (loginSession == null) {
			
			jn_result = false;

		} else { // 로그인 세션이 있는 경우 = 로그인 된 사용자가 있을 경우
			Member member = new Member();
			member.setId(loginSession.getId());

			try {
				output = memberService.getMemberItem(member);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if (output.getJn_result() == null) { // 로그인 O , 주능결과 X
				jn_result = false;
			} else {// 로그인 O , 주능결과 O
				jn_result = true;

				Product input = new Product();
				input.setJn_result(loginSession.getJn_result());

				jn_output = new ArrayList<Product>();

				try {
					jn_output = productService.jn_ProductList(input);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		// 인기 많은 술 best 4
		List<Product> best_output = new ArrayList<Product>();

		try {
			best_output = productService.main_best_ProductList(null);
		} catch (Exception e) {
			e.printStackTrace();
		}

		/** View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("jn_output", jn_output);
		model.addAttribute("jn_result", jn_result);
		model.addAttribute("best_output", best_output);

		return "home";
	}

	/** 로그아웃 처리 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

}