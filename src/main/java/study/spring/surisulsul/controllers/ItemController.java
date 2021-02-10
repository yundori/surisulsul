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
	@RequestMapping(value = "/item_filtered.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String item_filtered(Model model, HttpServletResponse response,
			@RequestParam(value = "types", required=false) List<String> types,
			@RequestParam(value = "areas", required=false) List<String> locs,
			@RequestParam(value = "incense", required=false) List<String> keys,
			@RequestParam(value = "sweet", defaultValue = "0") int sweet,
			@RequestParam(value = "sour", defaultValue = "0") int sour,
			@RequestParam(value = "degree", defaultValue = "0") int degree,
			@RequestParam(value = "title_search", required=false) String search,
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {
		
		int totalCount = 0; // 전체 게시글 수
		int listCount = 16; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수
		
		String check_types = ""; //선택된 types(리스트)를 in연산자의 문자열로 변환하고 담을 변수
		String check_locs = ""; //선택된 locs(리스트)를 in연산자의 문자열로 변환하고 담을 변수
		String check_keys = ""; //선택된 keys(리스트)를 in연산자의 문자열로 변환하고 담을 변수
		
		Product input = new Product(); //선택된 값을 넘겨줄 객체
		
		/** 
		 * 리스트를 in연산자에 넣을 문자열로 바꾸기
		 * 파라미터값이 있고 전체선택("0")이 포함되지 않은 경우에만 input 객체에 담기
		 */
		// 종류별
		if(types != null && types.size() != 0 && !types.get(0).equals("0")) {
			for(String t : types) {
				t = "'" + t + "',";
				check_types += t;
			}
			//마지막 , 제거
			check_types = check_types.substring(0, check_types.length() - 1);
			input.setTypes(check_types);
		}
		// 지역별
		if(locs != null && locs.size() != 0 && !locs.get(0).equals("0")) {
			for(String l : locs) {
				l = "'" + l + "',";
				check_locs += l;
			}
			check_locs = check_locs.substring(0, check_locs.length() - 1);
			input.setLocs(check_locs);
		}
		//향별
		if(keys != null && keys.size() != 0 && !keys.get(0).equals("0")) {
			for(String k : keys) {
				k = "'" + k + "',";
				check_keys += k;
			}
			check_keys = check_keys.substring(0, check_keys.length() - 1);
			input.setKeys(check_keys);
		}

		/**
		 * 당도, 산미, 도수 등급 나누기
		 * 당도, 산미 : 1 -> 1,2 / 2 -> 3,4 / 3 -> 5,6
		 * 도수 : 1 -> 1~10 / 2 -> 11~20 / 3 -> 21~
		 * 
		 * input 객체에 넣기
		 */
		if(sweet != 0) {
			sweet *= 2;
			input.setSweet1(sweet - 1);
			input.setSweet2(sweet);
		}
		if(sour != 0) {
			sour *= 2;
			input.setSour1(sour - 1);
			input.setSour2(sour);
		}
		if(degree != 0) {
			degree *= 10;
			input.setDegree1(degree - 9);
			if(degree != 30) { //3 -> 21 ~ 이기 때문
				input.setDegree2(degree);
			}
		}
		
		List<Product> output = null; //조회결과가 저장될 객체
		PageData pageData = null;
		
		try {
			// 전체 게시글 수 조회
			totalCount = productService.getProductCount(input);
			System.out.println(">>>>>>>>상품목록개수 : " + totalCount);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Product.setOffset(pageData.getOffset());
			Product.setListCount(pageData.getListCount());
			
			//데이터 조회하기
			output = productService.filtered_ProductList(input);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("pageData", pageData);
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
