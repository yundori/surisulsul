package study.spring.surisulsul.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

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

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Member;
import study.spring.surisulsul.model.Product;
import study.spring.surisulsul.service.MemberService;
import study.spring.surisulsul.service.ProductService;

@Controller
@Slf4j
public class MypageController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;

	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 회원 정보 확인 */
	@RequestMapping(value = "/mypage/mypage.do", method = RequestMethod.GET)
	public ModelAndView mypage(Model model, HttpServletRequest request) {
		// 세션값 받아오기
		HttpSession session = request.getSession();
		Member loginSession = (Member) session.getAttribute("loginInfo");
		Member output = null;

		// 로그인 세션이 없을 경우 = 로그인되어있지 않을 경우 alert 발생
		if (loginSession == null) {
			String redirectUrl = "../account/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 페이지입니다.");

		} else { // 로그인 세션이 있는 경우 = 로그인된 사용자가 있다는 뜻
			Member member = new Member();
			member.setId(loginSession.getId());

			try {
				output = memberService.getMemberItem(member);
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}

		/** View 처리 */
		model.addAttribute("output", output);	
		}
		return new ModelAndView("mypage/mypage");
	}

	/** 주능 결과 확인 */
	@RequestMapping(value = "/mypage/my_recommend.do", method = RequestMethod.GET)
	public ModelAndView my_recommend(Model model, HttpServletRequest request) {
		// 세션값 받아오기
				HttpSession session = request.getSession();
				Member loginSession = (Member) session.getAttribute("loginInfo");
				Member output = null;
				List<Product> pro_output = null;
				
				boolean jn_result = false;
				List<Product> jn_output = null;
				String jn_result_name = null;

				// 로그인 세션이 없을 경우 = 로그인되어있지 않을 경우 alert 발생
				if (loginSession == null) {
					String redirectUrl = "../account/login.do";
					return webHelper.redirect(redirectUrl, "로그인이 필요한 페이지입니다.");

				} else { // 로그인 세션이 있는 경우 = 로그인된 사용자가 있다는 뜻
					Member member = new Member();
					member.setId(loginSession.getId());

					try {
						output = memberService.getMemberItem(member);
					} catch (Exception e) {
						return webHelper.redirect(null, e.getLocalizedMessage());
					}

					if (output.getJn_result() == null) {// 로그인 O / 주능결과 X
						jn_result = false;
					} else {// 로그인 O / 주능결과 O
						jn_result = true;
						jn_result_name = output.getJn_result();

						Product input = new Product();
						input.setJn_result(output.getJn_result());

						jn_output = new ArrayList<Product>();
						
						/** 주능 결과에 해당하는 술 가져오기 */
						try {
							pro_output = productService.jn_ProductList(input);
							System.out.println(pro_output);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}

				/** View 처리 */
				model.addAttribute("output", output);
				model.addAttribute("jn_output", jn_output);
				model.addAttribute("jn_result", jn_result);
				model.addAttribute("jn_result_name", jn_result_name);
				model.addAttribute("pro_output", pro_output);
				
				return new ModelAndView("mypage/my_recommend");
	}

	/** 상품 상세페이지 이동 --> ItemController */

	/** 위시리스트 확인 */
	@RequestMapping(value = "/mypage/wishlist.do", method = RequestMethod.GET)
	public String wishlist(Model model) {
		return "mypage/wishlist";
	}
	
	/** 내가 작성한 리뷰/문의 확인 */
	@RequestMapping(value = "/mypage/my_opinion.do", method = RequestMethod.GET)
	public String my_opinion(Model model) {
		return "mypage/my_opinion";
	}
	/** 탈퇴하기 */
	@RequestMapping(value = "/mypage/is_out.do", method = RequestMethod.GET)
	public ModelAndView is_out(Model model, HttpServletRequest request) {
		// 세션값 받아오기
		HttpSession session = request.getSession();
		Member loginSession = (Member) session.getAttribute("loginInfo");
		int output = 0;

		// 로그인 세션이 없을 경우 = 로그인되어있지 않을 경우 alert 발생
		if (loginSession == null) {
			String redirectUrl = "../account/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 페이지입니다.");

		} else { // 로그인 세션이 있는 경우 = 로그인된 사용자가 있다는 뜻
			Member member = new Member();
			member.setId(loginSession.getId());

			try {
				output = memberService.outMember(member);
				session.invalidate();
			} catch (Exception e) {
				return webHelper.redirect(null, e.getLocalizedMessage());
			}
		}
		return new ModelAndView("redirect:/");
	}

}