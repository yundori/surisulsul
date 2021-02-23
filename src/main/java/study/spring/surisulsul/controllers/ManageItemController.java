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
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.helper.PageData;
import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Product;
import study.spring.surisulsul.service.ProductService;

@Controller
@Slf4j
public class ManageItemController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired
	ProductService productService;
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 관리자 - 상품목록 페이지 **/
	@RequestMapping(value="/manage_itemlist.do", method=RequestMethod.GET)
	public ModelAndView manage_itemlist(Model model, HttpServletResponse response,
			@RequestParam(value = "page", defaultValue = "1") int nowPage) throws Exception {
		
		int totalCount = 0; // 전체 게시글 수
		int listCount = 5; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수
		
		Product input = new Product(); //선택된 값을 넘겨줄 객체
		List<Product> output = null;
		PageData pageData = null;
		
		try {
			// 전체 게시글 수 조회
			totalCount = productService.getProductCount(input);
			
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Product.setOffset(pageData.getOffset());
			Product.setListCount(pageData.getListCount());
			
			output = productService.getAllProductList(input);
						
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageData", pageData);
		model.addAttribute("output",output);
		
		return new ModelAndView("manage/manage_itemlist");
	}
	
	/** 관리자 - 상품등록 페이지 **/
	@RequestMapping(value="/manage_itemadd.do", method=RequestMethod.GET)
	public ModelAndView manage_itemadd(Model model) throws Exception {
		
		return new ModelAndView("manage/manage_itemadd");
	}
	
	/** 관리자 - 상품수정 페이지 **/
	@RequestMapping(value="/manage_itemedit.do", method=RequestMethod.GET)
	public ModelAndView manage_itemedit(Model model) throws Exception {
		
		return new ModelAndView("manage/manage_itemedit");
	}
	
	/** 관리자 - 인기상품목록 페이지 **/
	@RequestMapping(value="/manage_best_itemlist.do", method=RequestMethod.GET)
	public ModelAndView manage_best_itemlist(Model model) throws Exception {
		
		return new ModelAndView("manage/manage_best_itemlist");
	}
	
}
