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
import study.spring.surisulsul.service.SalesService;

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
	
	@Autowired
	SalesService salesService;
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 관리자 - 상품목록 페이지 **/
	@RequestMapping(value="/manage_itemlist.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView manage_itemlist(Model model, HttpServletResponse response,
			@RequestParam(value = "item_search", required=false) String item_search,
			@RequestParam(value = "page", defaultValue = "1") int nowPage) throws Exception {
		
		int totalCount = 0; // 전체 게시글 수
		int listCount = 5; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수
		
		Product input = new Product(); //선택된 값을 넘겨줄 객체
		
		/** 검색창 검색어 input 객체에 담기 */
		if(item_search != null) {
			input.setSearch(item_search);
		}
		
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
		model.addAttribute("item_search", item_search);	//검색어
		model.addAttribute("output",output);
		
		return new ModelAndView("manage/manage_itemlist");
	}
	
	/** 관리자 - 상품등록 페이지 **/
	@RequestMapping(value="/manage_itemadd.do", method=RequestMethod.GET)
	public ModelAndView manage_itemadd(Model model) throws Exception {
		
		return new ModelAndView("manage/manage_itemadd");
	}
	
	/** 관리자 - 상품등록 action 페이지 **/
	@RequestMapping(value="/manage_itemadd_ok.do", method=RequestMethod.POST)
	public ModelAndView manage_itemadd_ok(Model model, HttpServletResponse response,
			@RequestParam(value = "item_name", required = false) String name,
			@RequestParam(value = "item_price", defaultValue = "0") int price,
			@RequestParam(value = "item_img", required = false) String img,
			@RequestParam(value = "item_type", required = false) String type,
			@RequestParam(value = "item_loc", required = false) String loc,
			@RequestParam(value = "item_incense", required = false) List<String> keys,
			@RequestParam(value = "item_sweet", defaultValue = "0") int sweet,
			@RequestParam(value = "item_sour", defaultValue = "0") int sour,
			@RequestParam(value = "item_degree", defaultValue = "0") int degree,
			@RequestParam(value = "item_size", defaultValue = "0") int size,
			@RequestParam(value = "item_igd", required = false) String igd,
			@RequestParam(value = "item_food", required = false) String food,
			@RequestParam(value = "item_des1", required = false) String des1,
			@RequestParam(value = "item_des2", required = false) String des2,
			@RequestParam(value = "item_jnresult", required = false) String jn_result) throws Exception {
		
		/** 파라미터 유효성 검사 **/
		if (name.equals("")) {
			return webHelper.redirect(null, "상품명을 입력하세요.");
		}
		if (price == 0) {
			return webHelper.redirect(null, "가격을 입력하세요.");
		}
		if (price < 0) {
			return webHelper.redirect(null, "가격은 0보다 작을 수 없습니다.");
		}
		if(!regexHelper.isNum(Integer.toString(price))) {
			return webHelper.redirect(null, "가격은 숫자로만 입력가능합니다.");
		}
		if (img.equals("")) {
			return webHelper.redirect(null, "이미지파일명을 입력하세요.");
		}
		if (type.equals("")) {
			return webHelper.redirect(null, "종류를 선택하세요.");
		}
		if (loc.equals("")) {
			return webHelper.redirect(null, "지역을 선택하세요.");
		}
		if (keys.equals("")) {
			return webHelper.redirect(null, "향을 선택하세요.");
		}
		if (keys.size() != 2) {
			return webHelper.redirect(null, "향을 2개 선택하세요.");
		}
		if (sweet == 0) {
			return webHelper.redirect(null, "당도를 입력하세요.");
		}
		if (sour == 0) {
			return webHelper.redirect(null, "산미를 입력하세요.");
		}
		if (degree == 0) {
			return webHelper.redirect(null, "도수를 입력하세요.");
		}
		if (degree < 0) {
			return webHelper.redirect(null, "당도는 0보다 작을 수 없습니다.");
		}
		if(!regexHelper.isNum(Integer.toString(degree))) {
			return webHelper.redirect(null, "도수는 숫자로만 입력가능합니다.");
		}
		if (size == 0) {
			return webHelper.redirect(null, "상품용량(크기)를 입력하세요.");
		}
		if (size < 0) {
			return webHelper.redirect(null, "용량(크기)는 0보다 작을 수 없습니다.");
		}
		if(!regexHelper.isNum(Integer.toString(size))) {
			return webHelper.redirect(null, "용량(크기)은 숫자로만 입력가능합니다.");
		}
		if (igd.equals("")) {
			return webHelper.redirect(null, "원재료를 입력하세요.");
		}
		if (food.equals("")) {
			return webHelper.redirect(null, "음식을 입력하세요.");
		}
		if (des1.equals("")) {
			return webHelper.redirect(null, "간단설명을 입력하세요.");
		}
		if (des2.equals("")) {
			return webHelper.redirect(null, "상세설명을 입력하세요.");
		}
		if (jn_result.equals("")) {
			return webHelper.redirect(null, "주능결과를 선택하세요.");
		}
		
		
		Product input = new Product();
		input.setName(name);
		input.setPrice(price);
		input.setImg(img);
		input.setType(type);
		input.setLoc(loc);
		input.setKey1(keys.get(0));
		input.setKey2(keys.get(1));
		input.setSweet(sweet);
		input.setSour(sour);
		input.setDegree(degree);
		input.setSize(size);
		input.setIgd(igd);
		input.setFood(food);
		input.setDes1(des1);
		input.setDes2(des2);
		input.setJn_result(jn_result);
		
		try {
			productService.addProduct(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String redirectUrl = contextPath + "/manage_itemlist.do";
		return webHelper.redirect(redirectUrl, "새로운 상품이 등록되었습니다.");
	}
	
	/** 관리자 - 상품수정 페이지 **/
	@RequestMapping(value="/manage_itemedit.do", method=RequestMethod.GET)
	public ModelAndView manage_itemedit(Model model,
			@RequestParam(value = "item_id", defaultValue = "0") int item_id) throws Exception {
		
		/** 파라미터 유효성 검사 **/
		if (item_id == 0) {
			return webHelper.redirect(null, "상품번호가 없습니다.");
		}
		
		/** 데이터 조회하기 **/
		Product input = new Product();
		input.setId(item_id);
		
		//조회한 상품데이터 저장할 객체
		Product output = null;
		
		try {
			output = productService.getProductItem(input);
		} catch(Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("output", output);
		return new ModelAndView("manage/manage_itemedit");
	}
	
	/** 수정 폼에 대한 action 페이지 */
	@RequestMapping(value="/manage_itemedit_ok.do", method=RequestMethod.POST)
	public ModelAndView manage_itemedit_ok(Model model, HttpServletResponse response,
			@RequestParam(value = "item_id", defaultValue = "0") int id,
			@RequestParam(value = "item_name", required = false) String name,
			@RequestParam(value = "item_price", defaultValue = "0") int price,
			@RequestParam(value = "item_img", required = false) String img,
			@RequestParam(value = "item_type", required = false) String type,
			@RequestParam(value = "item_loc", required = false) String loc,
			@RequestParam(value = "item_incense", required = false) List<String> keys,
			@RequestParam(value = "item_sweet", defaultValue = "0") int sweet,
			@RequestParam(value = "item_sour", defaultValue = "0") int sour,
			@RequestParam(value = "item_degree", defaultValue = "0") int degree,
			@RequestParam(value = "item_size", defaultValue = "0") int size,
			@RequestParam(value = "item_igd", required = false) String igd,
			@RequestParam(value = "item_food", required = false) String food,
			@RequestParam(value = "item_des1", required = false) String des1,
			@RequestParam(value = "item_des2", required = false) String des2,
			@RequestParam(value = "item_jnresult", required = false) String jn_result) throws Exception {
		
		/** 파라미터 유효성 검사 **/
		if (id == 0) {
			return webHelper.redirect(null, "상품번호가 없습니다.");
		}
		if (name.equals("")) {
			return webHelper.redirect(null, "상품명을 입력하세요.");
		}
		if (price == 0) {
			return webHelper.redirect(null, "가격을 입력하세요.");
		}
		if (price < 0) {
			return webHelper.redirect(null, "가격은 0보다 작을 수 없습니다.");
		}
		if(!regexHelper.isNum(Integer.toString(price))) {
			return webHelper.redirect(null, "가격은 숫자로만 입력가능합니다.");
		}
		if (img.equals("")) {
			return webHelper.redirect(null, "이미지파일명을 입력하세요.");
		}
		if (type.equals("")) {
			return webHelper.redirect(null, "종류를 선택하세요.");
		}
		if (loc.equals("")) {
			return webHelper.redirect(null, "지역을 선택하세요.");
		}
		if (keys.equals("")) {
			return webHelper.redirect(null, "향을 선택하세요.");
		}
		if (keys.size() != 2) {
			return webHelper.redirect(null, "향을 2개 선택하세요.");
		}
		if (sweet == 0) {
			return webHelper.redirect(null, "당도를 입력하세요.");
		}
		if (sour == 0) {
			return webHelper.redirect(null, "산미를 입력하세요.");
		}
		if (degree == 0) {
			return webHelper.redirect(null, "도수를 입력하세요.");
		}
		if (degree < 0) {
			return webHelper.redirect(null, "당도는 0보다 작을 수 없습니다.");
		}
		if(!regexHelper.isNum(Integer.toString(degree))) {
			return webHelper.redirect(null, "도수는 숫자로만 입력가능합니다.");
		}
		if (size == 0) {
			return webHelper.redirect(null, "상품용량(크기)를 입력하세요.");
		}
		if (size < 0) {
			return webHelper.redirect(null, "용량(크기)는 0보다 작을 수 없습니다.");
		}
		if(!regexHelper.isNum(Integer.toString(size))) {
			return webHelper.redirect(null, "용량(크기)은 숫자로만 입력가능합니다.");
		}
		if (igd.equals("")) {
			return webHelper.redirect(null, "원재료를 입력하세요.");
		}
		if (food.equals("")) {
			return webHelper.redirect(null, "음식을 입력하세요.");
		}
		if (des1.equals("")) {
			return webHelper.redirect(null, "간단설명을 입력하세요.");
		}
		if (des2.equals("")) {
			return webHelper.redirect(null, "상세설명을 입력하세요.");
		}
		if (jn_result.equals("")) {
			return webHelper.redirect(null, "주능결과를 선택하세요.");
		}
		
		
		Product input = new Product();
		input.setId(id);
		input.setName(name);
		input.setPrice(price);
		input.setImg(img);
		input.setType(type);
		input.setLoc(loc);
		input.setKey1(keys.get(0));
		input.setKey2(keys.get(1));
		input.setSweet(sweet);
		input.setSour(sour);
		input.setDegree(degree);
		input.setSize(size);
		input.setIgd(igd);
		input.setFood(food);
		input.setDes1(des1);
		input.setDes2(des2);
		input.setJn_result(jn_result);
		
		try {
			productService.editProduct(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		String redirectUrl = contextPath + "/manage_itemlist.do";
		return webHelper.redirect(redirectUrl, "상품이 수정되었습니다.");
	}
	
	/** 삭제 처리 페이지 */
	@RequestMapping(value = "/manage_itemdelete_ok.do", method = RequestMethod.GET)
	public ModelAndView delete_ok(Model model,
			@RequestParam(value = "item_id", defaultValue = "0") int id) {

		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (id == 0) {
			return webHelper.redirect(null, "상품번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Product input = new Product();
		input.setId(id);

		try {
			// 데이터 삭제
			productService.deleteProduct(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		/** 3) 페이지 이동 */
		return webHelper.redirect(contextPath + "/manage_itemlist.do", "상품이 삭제되었습니다.");
	}
	
	/** 관리자 - 인기상품목록 페이지 **/
	@RequestMapping(value="/manage_best_itemlist.do", method=RequestMethod.GET)
	public ModelAndView manage_best_itemlist(Model model) throws Exception {
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
		
		model.addAttribute("totalCount", output.size());
		model.addAttribute("output",output);
		return new ModelAndView("manage/manage_best_itemlist");
	}
	
}
