package study.spring.surisulsul.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;

@Controller
public class ReviewAndQnaController {
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
	
	/** 리뷰 작성 페이지로 이동 */
	@RequestMapping(value="/mypage/write_review.do", method=RequestMethod.GET)
	public String write_review(Model model) {
		return "mypage/write_review";
	}
	
	/** 리뷰 작성에 대한 action 페이지 */
	@RequestMapping(value="/mypage/write_review_ok.do", method=RequestMethod.POST)
	public void write_review_ok(Model model) {
		
	}
	
	/** 리뷰 수정 페이지로 이동 */
	@RequestMapping(value="/mypage/edit_review.do", method=RequestMethod.GET)
	public String edit_review(Model model) {
		return "mypage/write_review";
	}
	
	/** 리뷰 수정에 대한 action 페이지 */
	@RequestMapping(value="/mypage/edit_review_ok.do", method=RequestMethod.POST)
	public void edit_review_ok(Model model) {
		
	}
	
	/** 문의 작성 페이지로 이동 */
	@RequestMapping(value="/items/write_question.do", method=RequestMethod.GET)
	public String write_question(Model model) {
		return "items/write_question";
	}
	
	/** 문의 작성 페이지로 이동 */
	@RequestMapping(value="/items/write_question_ok.do", method=RequestMethod.POST)
	public void write_question_ok(Model model) {
		
	}
	
	/** 문의 수정 페이지로 이동 */
	@RequestMapping(value="/items/edit_question.do", method=RequestMethod.GET)
	public String edit_question(Model model) {
		return "items/write_question";
	}
	
	/** 문의 수정 페이지로 이동 */
	@RequestMapping(value="/items/edit_question_ok.do", method=RequestMethod.POST)
	public void edit_question_ok(Model model) {
		
	}
	
	/** 상품 상세 - 리뷰 페이지로 이동 */
	@RequestMapping(value="/items/item_reviews.do", method=RequestMethod.GET)
	public String item_reviews(
			//상세 페이지에서 조회할 상품 번호
			@RequestParam(value="p_id", defaultValue="1") int p_id,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		return "items/item_reviews";
	}
	
	/** 상품 상세 - 문의 페이지로 이동 */
	@RequestMapping(value="/items/item_question.do", method=RequestMethod.GET)
	public String item_question(Model model) {
		return "items/item_question";
	}
}
