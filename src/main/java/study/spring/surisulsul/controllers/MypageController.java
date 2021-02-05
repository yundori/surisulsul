package study.spring.surisulsul.controllers;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.service.MemberService;

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

	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 회원 정보 확인 */
	//@RequestMapping(value = "/mypage/mypage.do", method = RequestMethod.GET)
	//public String mypage(Model model, @RequestParam(value = "id") int id) {
	//	model.addAttribute("id", id);
	//	return "mypage/mypage";
	//}
	/** 회원 정보 확인 - Ajax Test용 */
	@RequestMapping(value = "/mypage/mypage.do", method = RequestMethod.GET)
	public String mypage(Model model) {
		return "mypage/mypage";
	}

	/** 주능 결과 확인 */
	@RequestMapping(value = "/mypage/my_recommend.do", method = RequestMethod.GET)
	public String my_recommend(Model model) {
		System.out.println("mypage/my_recommend 메서드 정상적으로 들어옴.");
		return "mypage/my_recommend";
	}

	/** 상품 상세페이지 이동 --> ItemController */

	/** 위시리스트 확인 */
	@RequestMapping(value = "/mypage/wishlist.do", method = RequestMethod.GET)
	public String wishlist(Model model) {
		return "mypage/wishlist";
	}

	/** 내가 주문한 내역 확인 --> OrderController */

	/** 내가 작성한 리뷰/문의 확인 */
	@RequestMapping(value = "/mypage/my_opinion.do", method = RequestMethod.GET)
	public String my_opinion(Model model) {
		return "mypage/my_opinion";
	}

}