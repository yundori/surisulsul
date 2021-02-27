package study.spring.surisulsul.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.surisulsul.helper.PageData;
import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Qna;
import study.spring.surisulsul.model.Review;
import study.spring.surisulsul.service.ProductService;
import study.spring.surisulsul.service.ReviewAndQnaService;

@Controller
public class ManageRAQController {

	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	ReviewAndQnaService reviewAndQnaService;
	
	@Autowired
	ProductService productService;
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 리뷰 관리 페이지로 이동 */
	@RequestMapping(value = "/manage_review.do", method = RequestMethod.GET)
	public ModelAndView manage_review(Model model,
			//검색 조건
			@RequestParam(value="type", defaultValue="0") int type,
			//검색어
			@RequestParam(value="keyword", required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) throws Exception {
		
		/** 1) 페이지 구현에 필요한 변수값 생성*/
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Review input = new Review();

		// 검색 조건으로 상품명을 선택했을 때 
		if (type==1){ input.setP_name(keyword); }
		// 검색 조건으로 이름을 선택했을 때 
		else if (type==2){ input.setM_name(keyword); }
		
		List<Review> output = null; // 조회 결과가 저장될 객체
		PageData pageData = null;
		
		try {
			// 전체 게시글 수 조회
			totalCount = reviewAndQnaService.getReviewCount(input);
						
			// 페이지 번호 계산 --> 계산 결과를 로그르 출력
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
						
			// SQL의 limit 절에서 사용될 값을 Beans의 static 변수에 저장
			Review.setOffset(pageData.getOffset());
			Review.setListCount(pageData.getListCount()); 
			// 데이터 조회
			output = reviewAndQnaService.getManageReview(input);
			
		} catch(Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		return new ModelAndView("manage/manage_review");
	}
	
	/** 문의 관리 페이지로 이동 */
	@RequestMapping(value="/manage_question.do", method=RequestMethod.GET)
	public ModelAndView manage_question(Model model,
			//검색 조건
			@RequestParam(value="type", defaultValue="0") int type,
			//검색어
			@RequestParam(value="keyword", required=false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage)  throws Exception {
		/** 1) 페이지 구현에 필요한 변수값 생성*/
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Qna input = new Qna();

		// 검색 조건으로 상품명을 선택했을 때 
		if (type==1){ input.setP_name(keyword); }
		// 검색 조건으로 이름을 선택했을 때 
		else if (type==2){ input.setM_name(keyword); }
		
		List<Qna> output = null; // 조회 결과가 저장될 객체
		PageData pageData = null;
		
		try {
			// 전체 게시글 수 조회
			totalCount = reviewAndQnaService.getQnaCount(input);
						
			// 페이지 번호 계산 --> 계산 결과를 로그르 출력
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
						
			// SQL의 limit 절에서 사용될 값을 Beans의 static 변수에 저장
			Qna.setOffset(pageData.getOffset());
			Qna.setListCount(pageData.getListCount()); 
			// 데이터 조회
			output = reviewAndQnaService.getManageQna(input);
			
		} catch(Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		return new ModelAndView("manage/manage_question");
	}
}
