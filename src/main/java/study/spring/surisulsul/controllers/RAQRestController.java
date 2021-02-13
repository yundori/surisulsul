package study.spring.surisulsul.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.surisulsul.helper.PageData;
import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Qna;
import study.spring.surisulsul.model.Review;
import study.spring.surisulsul.service.ReviewAndQnaService;

@RestController
public class RAQRestController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired ReviewAndQnaService reviewAndQnaService;
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	
	/** 리뷰 작성에 대한 action 페이지 */
	@RequestMapping(value="/review", method=RequestMethod.POST)
	public Map<String, Object> write_review(
			@RequestParam(value="p_id", defaultValue="0") int p_id,
			@RequestParam(value="title", required = false) String title,
			@RequestParam(value="content", required = false) String content,
			@RequestParam(value="star", defaultValue="0") int star,
			@RequestParam(value="rev_img", required = false) String rev_img) {
		return null;
	}
	
	/** 리뷰 수정에 대한 action 페이지 */
	@RequestMapping(value="/review", method=RequestMethod.PUT)
	public Map<String, Object> edit_review() {
		return null;
	}
	
	/** 문의 작성에 대한 action 페이지 */
	@RequestMapping(value="/question", method=RequestMethod.POST)
	public Map<String, Object> write_question() {
		return null;
	}
	
	/** 문의 수정에 대한 action 페이지 */
	@RequestMapping(value="question", method=RequestMethod.PUT)
	public Map<String, Object> edit_question() {
		return null;
	}
	
	/** 상품 상세 - 리뷰 페이지로 이동 */
	@RequestMapping(value="review", method=RequestMethod.GET)
	public Map<String, Object> get_reviews(
			//상세 페이지에서 조회할 상품 번호
			@RequestParam(value="p_id", defaultValue="1") int p_id,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
	
		/** 1) 페이지 구현에 필요한 변수값 생성*/
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(상품번호)를 Beans에 담는다.
		Review input = new Review();
		input.setP_id(p_id);
		
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
			
			// 데이터 조회하기
			output = reviewAndQnaService.getProductReviewList(input);
		}catch(Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("p_id", p_id);
		data.put("item", output);
		data.put("meta", pageData);

		return webHelper.getJsonData(data);
	}
	
	/** 상품 상세 - 문의 페이지로 이동 */
	@RequestMapping(value="/question", method=RequestMethod.GET)
	public Map<String, Object> get_questions(
			//상세 페이지에서 조회할 상품 번호
			@RequestParam(value="p_id", defaultValue="1") int p_id,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {

		/** 1) 페이지 구현에 필요한 변수값 생성*/
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(상품번호)를 Beans에 담는다.
		Qna input = new Qna();
		input.setP_id(p_id);
		
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
			
			// 데이터 조회하기
			output = reviewAndQnaService.getProductQnaList(input);
		}catch(Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("p_id", p_id);
		data.put("item", output);
		data.put("meta", pageData);

		return webHelper.getJsonData(data);
	}
}
