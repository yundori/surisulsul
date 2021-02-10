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
import study.spring.surisulsul.model.Member;
import study.spring.surisulsul.model.Product;
import study.spring.surisulsul.service.MemberService;
import study.spring.surisulsul.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class HomeController {
	
	/** Service 패턴 구현체 주입 */
	@Autowired
	ProductService productService;
	
	@Autowired
	MemberService memberService;
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * */
	 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		// 세션 값 받아오기
		HttpSession session = request.getSession();		
		Member loginSession = (Member) session.getAttribute("loginInfo");
		
		boolean jn_result = false;
		List<Product> jn_output = null;
		
		// 로그인 세션이 없을 경우 = 로그인이 안됐을 경우 alert 발생
		if(loginSession == null) { 
			jn_result = false;
		} else { //로그인 세션이 있는 경우 = 로그인 된 사용자가 있을 경우
			if(loginSession.getJn_result() == null) { // 로그인 O , 주능결과 X
				jn_result=false;
			} else {// 로그인 O , 주능결과 O
				jn_result=true;

				Product input = new Product();
				input.setJn_result(loginSession.getJn_result());
				
				jn_output = new ArrayList<Product>();
				
				/**주능 결과에 해당하는 술 가져오기 */
				// Mapper안에 해당하는 주능 결과를 가져오는 SQL문 작성
				// public List<Product> jn_output(Product);
				// input.setJn_result(jn_result); 
				
				
				try {
					jn_output = productService.jn_ProductList(input);
				} catch (Exception e) { e.printStackTrace(); }
				
					
				// output = productService.jn_ProductList(input);
			}
		}
		
		// 인기 많은 술 best 4 
		List<Product> best_output = new ArrayList<Product>();
		try {
			//Mapper안에 SQL문 작성 따로 해야될 0,4
			//Impl에 어떤 메서드로 들어가는지 확인해서 아래 구문 수정
			best_output = productService.main_best_ProductList(null);
		} catch (Exception e) {	e.printStackTrace(); }
		
		/** View 처리  */
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