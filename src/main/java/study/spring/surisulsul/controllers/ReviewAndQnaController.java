package study.spring.surisulsul.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.surisulsul.helper.PageData;
import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Member;
import study.spring.surisulsul.model.Product;
import study.spring.surisulsul.model.Qna;
import study.spring.surisulsul.model.Review;
import study.spring.surisulsul.service.ProductService;
import study.spring.surisulsul.service.ReviewAndQnaService;

@Controller
public class ReviewAndQnaController {
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
	
	/** 리뷰 작성 페이지로 이동 */
	@RequestMapping(value="/mypage/write_review.do", method=RequestMethod.GET)
	public ModelAndView write_review(Model model,
			@RequestParam(value="p_id", defaultValue="0") int p_id,
			@RequestParam(value="o_id", defaultValue="0") int o_id) {	
				
		/** 1) 제품 정보 조회하기 */
		// 조회할 조건 객체
		Product input = new Product();
		input.setId(p_id);
		
		// 결과를 받을 객체
		Product output = null;
		
		try {
			// 데이터 조회
			output = productService.details_ProductItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 작성 폼 페이지에 제품 정보 보내기 */
		model.addAttribute("output", output);
		model.addAttribute("o_id", o_id);
		return new ModelAndView("mypage/write_review");
	}
	
	/** 리뷰 수정 페이지로 이동 */
	@RequestMapping(value="/mypage/edit_review.do", method=RequestMethod.GET)
	public ModelAndView edit_review(Model model,
			@RequestParam(value="id", defaultValue="0") int id) {
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 수정이 불가능하므로 반드시 필수값으로 처리해야 한다.
		if(id==0) {
			return webHelper.redirect(null, "잘못된 접근입니다.");
		}
		/** 2) 데이터 조회하기 */
		Review input = new Review();
		input.setId(id);
		
		Review output = null;
		
		// 페이지에 불러올 제품 정보를 조회할 객체
	    Product inputProduct = new Product();
		
		Product product = null;
		
		try {
			output = reviewAndQnaService.getReviewItem(input);
			inputProduct.setId(output.getP_id());
			product = productService.details_ProductItem(inputProduct);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("product",product);
		return new ModelAndView("mypage/edit_review");
	}
	
	/** 문의 작성 페이지로 이동 */
	@RequestMapping(value="/items/write_question.do", method=RequestMethod.GET)
	public ModelAndView write_question(Model model,
			@RequestParam(value="p_id", defaultValue="0") int p_id) {
		/** 1) 제품 정보 조회하기 */
		// 조회할 조건 객체
		Product input = new Product();
		input.setId(p_id);
		
		// 결과를 받을 객체
		Product output = null;
		
		try {
			// 데이터 조회
			output = productService.details_ProductItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 작성 폼 페이지에 제품 정보 보내기 */
		model.addAttribute("output", output);
		return new ModelAndView("items/write_question");
	}
	
	/** 문의 수정 페이지로 이동 */
	@RequestMapping(value="/items/edit_question.do", method=RequestMethod.GET)
	public ModelAndView edit_question(Model model,
			@RequestParam(value="id", defaultValue="0") int id) {
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 수정이 불가능하므로 반드시 필수값으로 처리해야 한다.
		if(id==0) {
			return webHelper.redirect(null, "잘못된 접근입니다.");
		}
		/** 2) 데이터 조회하기 */
		Qna input = new Qna();
		input.setId(id);
		
		Qna output = null;
		
		// 페이지에 불러올 제품 정보를 조회할 객체
	    Product inputProduct = new Product();
		
		Product product = null;
		
		try {
			output = reviewAndQnaService.getQnaItem(input);
			inputProduct.setId(output.getP_id());
			product = productService.details_ProductItem(inputProduct);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("output", output);
		model.addAttribute("product",product);
		return new ModelAndView("mypage/edit_Qna");
	}

	/** 상품 상세 - 리뷰 페이지로 이동 */
	@RequestMapping(value="/item_reviews.do/{p_id}", method=RequestMethod.GET)
	public ModelAndView item_reviews(Model model,
			//상세 페이지에서 조회할 상품 번호
			@PathVariable int p_id,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		/** 1) 페이지 구현에 필요한 변수값 생성*/
		int totalCount = 0;
		int listCount = 5;
		int pageCount = 5;
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Review input = new Review();
		input.setP_id(p_id);
		
		List<Review> output = null; // 조회 결과가 저장될 객체
		PageData pageData = null;
		
		try {
			// 전체 게시글 수 조회
			totalCount = reviewAndQnaService.getProductReviewCount(input);
			
			// 페이지 번호 계산 --> 계산 결과를 로그르 출력
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// SQL의 limit 절에서 사용될 값을 Beans의 static 변수에 저장
			Review.setOffset(pageData.getOffset());
			Review.setListCount(pageData.getListCount());
			
			// 데이터 조회하기
			output = reviewAndQnaService.getProductReviewList(input);
		}catch(Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("p_id", p_id);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		return new ModelAndView("items/item_reviews");
	}
	
	/** 상품 상세 - 문의 페이지로 이동 */
	@RequestMapping(value="/item_question.do/{p_id}", method=RequestMethod.GET)
	public ModelAndView item_question(Model model,
			//상세 페이지에서 조회할 상품 번호
			@PathVariable int p_id,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		
		/** 1) 페이지 구현에 필요한 변수값 생성*/
		int totalCount = 0;
		int listCount = 5;
		int pageCount = 5;
		
		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Qna input = new Qna();
		input.setP_id(p_id);
		
		List<Qna> output = null; // 조회 결과가 저장될 객체
		PageData pageData = null;
		
		try {
			// 전체 게시글 수 조회
			totalCount = reviewAndQnaService.getProductQnaCount(input);
			
			// 페이지 번호 계산 --> 계산 결과를 로그르 출력
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// SQL의 limit 절에서 사용될 값을 Beans의 static 변수에 저장
			Review.setOffset(pageData.getOffset());
			Review.setListCount(pageData.getListCount());
			
			// 데이터 조회하기
			output = reviewAndQnaService.getProductQnaList(input);
		}catch(Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) View 처리 */
		model.addAttribute("p_id", p_id);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		return new ModelAndView("items/item_question");
	}
}
