package study.spring.surisulsul.controllers;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.helper.PageData;
import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Member;
import study.spring.surisulsul.model.Product;
import study.spring.surisulsul.model.Sales;
import study.spring.surisulsul.model.Wishlist;
import study.spring.surisulsul.service.MemberService;
import study.spring.surisulsul.service.ProductService;
import study.spring.surisulsul.service.SalesService;
import study.spring.surisulsul.service.WishlistService;

@Controller
@Slf4j
public class ItemController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	ProductService productService;
	
	@Autowired
	SalesService salesService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	WishlistService wishlistService;
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/* 인기있는술 페이지로 이동 */
	@RequestMapping(value = "/best_items.do", method = RequestMethod.GET)
	public String best_item(Model model) {
		
		List<Product> output = null;
		int sales_cnt = 0;
		
		try {
			
			sales_cnt = salesService.getSalesCount(null);
			
			if(sales_cnt == 0) {
				output = productService.best_ProductList_price(null);
			}
			else {
				output = productService.best_ProductList(null);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("output",output);
		return "items/best_items";
	}
	
	/* 내가찾는술 페이지로 이동 */
	@RequestMapping(value = "/item_filtered.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String item_filtered(Model model, HttpServletResponse response,
			@RequestParam(value = "types", defaultValue = "0") List<String> types,
			@RequestParam(value = "areas", defaultValue = "0") List<String> locs,
			@RequestParam(value = "incense", defaultValue = "0") List<String> keys,
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
			int sweet_res = sweet * 2;
			input.setSweet1(sweet_res - 1);
			input.setSweet2(sweet_res);
		}
		if(sour != 0) {
			int sour_res = sour * 2;
			input.setSour1(sour_res - 1);
			input.setSour2(sour_res);
		}
		if(degree != 0) {
			int degree_res = degree * 10;
			input.setDegree1(degree_res - 9);
			if(degree != 3) { //3 -> 21 ~ 이기 때문
				input.setDegree2(degree_res);
			}
		}
		
		/**
		 * 검색창 검색어 input 객체에 담기
		 */
		if(search != null) {
			input.setSearch(search);
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
		
		model.addAttribute("types", types);	// 선택된 종류별 리스트
		model.addAttribute("locs", locs);	// 선택된 지역별 리스트
		model.addAttribute("keys", keys);	// 선택된 향별 리스트
		model.addAttribute("sweet", sweet);	// 선택된 당도
		model.addAttribute("sour", sour);	// 선택된 산미
		model.addAttribute("degree", degree);	//선택된 도수
		model.addAttribute("search", search);	//검색어
		model.addAttribute("pageData", pageData);
		model.addAttribute("output",output);
		
		return "items/item_filtered";
	}
	
	/* 상품상세페이지로 이동 */
	@RequestMapping(value = "/item_details.do", method = RequestMethod.GET)
	public String item_details(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "prodid", defaultValue = "0") int prodid) {
		// 세션값 받아오기
		HttpSession session = request.getSession();
		Member loginSession = (Member) session.getAttribute("loginInfo");
		
		int same_output = 0;
		String wishlist = null;
		
		//로그인 세션이 있는 경우 - 해당 상품 wishlist 확인
		if(loginSession != null) {
			
			// 데이터 저장하기
			Wishlist input = new Wishlist();
			input.setM_id(loginSession.getId());
			input.setP_id(prodid);
			
			// 위시리스트 존재 여부 확인
			try {
				same_output = wishlistService.getWishlistCount(input);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			//해당 회원의 위시리스트에 이 상품이 있다면 -> 꽉찬 하트
			if(same_output == 1) {
				wishlist = "wishlist_ok_btn";
			}else {//해당 회원의 위시리스트에 이 상품이 없다면 -> 빈 하트
				wishlist="wishlist_btn";
			}
		}
		
		//로그인 세션이 없는 경우
		Product input = new Product();
		input.setId(prodid);
		
		Product output = null;
		try {
			output = productService.details_ProductItem(input);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("output",output);
		model.addAttribute("wishlist", wishlist);
		
		return "items/item_details";
	}
	
	/* 상품정보 탭페이지로 이동 */
	@RequestMapping(value = "/item_info.do/{prodid}", method = RequestMethod.GET)
	public String item_info(Model model, HttpServletResponse response,
			@PathVariable int prodid) {
		
		Product input = new Product();
		input.setId(prodid);
		
		Product output = null;
		try {
			output = productService.info_ProductItem(input);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("output",output);
		return "items/item_info";
	}
	
	/* 상품리뷰 탭페이지로 이동 
	@RequestMapping(value = "/item_reviews.do", method = RequestMethod.GET)
	public String item_reviews(Model model) {
		
		return "items/item_reviews";
	}*/
	
	/* 상품문의 탭페이지로 이동 
	@RequestMapping(value = "/item_question.do", method = RequestMethod.GET)
	public String item_question(Model model) {
		
		return "items/item_question";
	}*/
	
	/**wishlist 추가 action 처리 */
	@RequestMapping(value = "/addWish.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView add_wish(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "prodid", defaultValue = "0") int prodid)  {
		System.out.println("wishlist 추가 기능 시작 >>");
		// 세션값 받아오기
				HttpSession session = request.getSession();
				Member loginSession = (Member) session.getAttribute("loginInfo");
				
				String wishlist = null;
				int same_output = 0;
				
				// 로그인 세션이 없을 경우 = 로그인되어있지 않을 경우 alert 발생
				if (loginSession == null) {
					String redirectUrl = contextPath +"/account/login.do";
					//String redirectUrl = "../account/login.do";
					return webHelper.redirect(redirectUrl, "로그인이 필요합니다.");
				}
				
				//prodid가 0인 경우 = 잘못된 접근
				if(prodid == 0) {
					return webHelper.redirect(contextPath, "잘못된 접근입니다.");
				}

				// 데이터 저장하기
				Wishlist input = new Wishlist();
				input.setM_id(loginSession.getId());
				input.setP_id(prodid);
				
				// 중복 위시리스트 확인
				try {
					same_output = wishlistService.getSameWishlistCount(input);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
				if(same_output == 1) {
					//위시리스트 삭제 구현
					try {
						wishlistService.deleteWishlist(input);
						wishlist = "wishlist_btn";
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}else if(same_output == 0) {
					//위시리스트 추가 구현
					try {
						wishlistService.addWishlist(input);
						wishlist = "wishlist_ok_btn";
					} catch (Exception e) {
						e.printStackTrace();
					}
				}else {
					return webHelper.redirect(contextPath, "error >> 위시리스트에 중복된 상품이 많습니다.");
				}
				
				Product product = new Product();
				product.setId(prodid);
				
				Product output = null;
				try {
					output = productService.details_ProductItem(product);
				} catch(Exception e) {
					e.printStackTrace();
				}
				
				//view 처리
				model.addAttribute("wishlist", wishlist);
				model.addAttribute("output",output);
				
				return new ModelAndView("items/item_details");
	}
}
