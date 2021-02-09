package study.spring.surisulsul.controllers;


import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.helper.PageData;
import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Product;
import study.spring.surisulsul.service.ProductService;

@Controller
@Slf4j
public class ItemController {
	/** WebHelper 주입 
	@Autowired
	WebHelper webHelper;*/

	/** RegexHelper 주입 
	@Autowired
	RegexHelper regexHelper;*/

	/** Service 패턴 구현체 주입 */
	@Autowired
	ProductService productService;
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/* 인기있는술 페이지로 이동 */
	@RequestMapping(value = "/best_items.do", method = RequestMethod.GET)
	public String best_item(Model model) {
		
		return "items/best_items";
	}
	
	/* 내가찾는술 페이지로 이동 */
	@RequestMapping(value = "/item_filtered.do", method = RequestMethod.GET)
	public String item_filtered(Model model, HttpServletResponse response) {
		//@RequestParam(value = "page", defaultValue = "1") int nowPage
		//int totalCount = 0; // 전체 게시글 수
		//int listCount = 16; // 한 페이지당 표시할 목록 수
		//int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수
		
		//Product input = new Product();
		
		List<Product> output = null;	//조회결과가 저장될 객체
		//PageData pageData = null;
		
		try {
			// 전체 게시글 수 조회
			//totalCount = productService.getProductCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			//pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			//Product.setOffset(pageData.getOffset());
			//Product.setListCount(pageData.getListCount());
			
			//데이터 조회하기
			output = productService.filtered_ProductList(null);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*
		System.out.println(">>>>>>>>>>>>controller 출력결과");
		for(Product res : output) {
			System.out.println(res);
		}
		*/
		model.addAttribute("output",output);
		
		return "items/item_filtered";
	}
	
	/* 상품상세페이지로 이동 */
	@RequestMapping(value = "/item_details.do", method = RequestMethod.GET)
	public String item_details(Model model) {
		
		return "items/item_details";
	}
	
	/* 상품정보 탭페이지로 이동 */
	@RequestMapping(value = "/item_info.do", method = RequestMethod.GET)
	public String item_info(Model model) {
		
		return "items/item_info";
	}
	
	/* 상품리뷰 탭페이지로 이동 */
	@RequestMapping(value = "/item_reviews.do", method = RequestMethod.GET)
	public String item_reviews(Model model) {
		
		return "items/item_reviews";
	}
	
	/* 상품문의 탭페이지로 이동 */
	@RequestMapping(value = "/item_question.do", method = RequestMethod.GET)
	public String item_question(Model model) {
		
		return "items/item_question";
	}

}
