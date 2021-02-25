package study.spring.surisulsul.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.helper.PageData;
import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Product;
import study.spring.surisulsul.model.Wishlist;
import study.spring.surisulsul.service.MemberService;
import study.spring.surisulsul.service.ProductService;
import study.spring.surisulsul.service.SalesService;
import study.spring.surisulsul.service.WishlistService;

@Controller
@Slf4j
public class ManageMembersController {
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
	MemberService memberService;

	@Autowired
	WishlistService wishlistService;

	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 관리자 - 회원목록 페이지 **/
	@RequestMapping(value = "/manage_members.do", method = RequestMethod.GET)
	public ModelAndView manage_members(Model model, HttpServletRequest request,
			@RequestParam(value = "page", defaultValue="1") int nowPage) throws Exception {

		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		PageData pageData = null;

		return new ModelAndView("manage/manage_members");
	}

	/** 관리자 - 위시리스트 페이지 : 상품id순 정렬 **/
	@RequestMapping(value = "/manage_wishlist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView manage_wishlist(Model model, HttpServletResponse response,
			@RequestParam(value = "keyword", required=false) String search,
			@RequestParam(value = "page", defaultValue="1") int nowPage
			) throws Exception {

		int totalCount = 0; // 전체 게시글 수
		int listCount = 15; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		PageData pageData = null;
		
		Product input = new Product(); // 선택된 값을 넘겨줄 객체	
		List<Product> p_output = null;
		boolean result; //검색 결과 존재 여부
		String pageLink = "ById";
		
		//검색어 input 객체에 담기
		if(search != null) {
			input.setSearch(search);
		}
		
		try {
			// 전체 게시글 수 조회
			totalCount = productService.getProductCount(input);

			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Product.setOffset(pageData.getOffset());
			Product.setListCount(pageData.getListCount());
			
			//상품 리스트 불러오기
			p_output = productService.manage_wish_ProductList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//검색 조건
		if(p_output == null) {
			result = false;
		}else {
			result = true;
		}
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageData", pageData);
		model.addAttribute("output", p_output);
		model.addAttribute("result", result);
		model.addAttribute("pageLink", pageLink);
		model.addAttribute("keyword", search);
		return new ModelAndView("manage/manage_wishlist");
	}
	
	/** 관리자 - 위시리스트 페이지 : 인기순 정렬 **/
	@RequestMapping(value = "/manage_wishlist_asc.do", method = RequestMethod.GET)
	public ModelAndView manage_wishlist_asc(Model model, HttpServletResponse response,
			@RequestParam(value = "keyword", required=false) String search,
			@RequestParam(value = "page", defaultValue="1") int nowPage) throws Exception {

		int totalCount = 0; // 전체 게시글 수
		int listCount = 15; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		PageData pageData = null;
		
		Product input = new Product(); // 선택된 값을 넘겨줄 객체	
		List<Product> p_output = null;
		boolean result; //검색 결과 존재 여부
		String pageLink = "ByWish";
		
		//검색어 input 객체에 담기
				if(search != null) {
					input.setSearch(search);
				}
		
		try {
			// 전체 게시글 수 조회
			totalCount = productService.getProductCount(input);

			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Product.setOffset(pageData.getOffset());
			Product.setListCount(pageData.getListCount());
			
			//상품 리스트 불러오기
			p_output = productService.manage_by_wish_ProductList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//검색 조건
		if(p_output == null) {
			result = false;
		}else {
			result = true;
		}
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageData", pageData);
		model.addAttribute("output", p_output);
		model.addAttribute("result", result);
		model.addAttribute("pageLink", pageLink);
		model.addAttribute("keyword", search);
		return new ModelAndView("manage/manage_wishlist");
	}
}
