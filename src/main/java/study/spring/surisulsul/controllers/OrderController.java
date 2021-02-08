package study.spring.surisulsul.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Basket;
import study.spring.surisulsul.model.Member;
import study.spring.surisulsul.service.BasketService;
import study.spring.surisulsul.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	WebHelper webHelper;
	
	//Service 패턴 객체 주입
	@Autowired
	BasketService basketService;
	@Autowired
	OrderService orderService;
	
	/** 장바구니에 추가 (페이지 연결 X)  - Action 처리 */
	/** 장바구니 table에 INSERT 처리 해야됨 */
	@RequestMapping(value = "/basket/add_ok.do", method = RequestMethod.POST)
	public ModelAndView basket_add_ok(Model model,
			@RequestParam(value = "p_id", defaultValue = "0") int p_id,
			@RequestParam(value = "p_name", required = true) String p_name,
			@RequestParam(value = "p_price", defaultValue = "0") int p_price,
			@RequestParam(value = "order_quantity", defaultValue = "0") int qty){
		System.out.println("장바구니 add_ok 메서드로 연결");
		/** 1) 입력 파라미터에 대한 유효성 검사 */
		if(p_id==0) {
			return webHelper.redirect(null, "주문 가능 상품이 아닙니다.");
		}
		
		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다
		/** 결과 확인을 위한 페이지 이동 */
		//alert 띄우고,,, 장바구니로 이동 시 basket.do 호출
		// 장바구니로 이동하지 않을 시 현재 페이지 잔류
		return webHelper.redirect(null, "선택하신 상품이 장바구니에 추가되었습니다.");
	}
	
	/** 장바구니 페이지로 연결 */
	/** 장바구니로 가면서 selectList 처리해야됨 */
	@RequestMapping(value = "/basket.do", method = RequestMethod.GET)
	public String go_basket(Model model, HttpServletRequest request) {
		//세션값 받아오기
		HttpSession session = request.getSession();		
		Member loginSession = (Member) session.getAttribute("loginInfo");

		if(loginSession==null) { //로그인 세션이 없을 경우 = 로그인되어있지 않을 경우 로그인화면으로 return
			return "account/login";
		}
		
		//조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Basket input = new Basket();
		input.setLoginId(loginSession.getId());
		
				
		List<Basket> output = null; //조회 결과가 저장될 객체
				
		try {
			//데이터 조회하기
			output = basketService.getBasketList(input);
		} catch (Exception e) {	e.printStackTrace(); }
		
		//view처리
		model.addAttribute("output", output);
		return "order/basket";
	}
	
	/** 장바구니 선택 삭제 처리 */
	@RequestMapping(value = "/basket/delete_ok.do", method = RequestMethod.POST)
	public void basket_delete_ok() {
		System.out.println("basket_delete_ok 메서드 들어옴");
	}
	
	/** 주문 페이지로 연결 */
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public ModelAndView go_order(Model model) {
		//View 처리
		return new ModelAndView("order/basket_order");
	}
	
	/** 주문 내용 INSERT 처리 + 주문 결과 페이지로 연결 */
	@RequestMapping(value = "/order/order_ok.do", method = RequestMethod.POST)
	public ModelAndView go_order_result(Model model) {
		boolean order_result = false;
		
		//View 처리
		model.addAttribute("result", order_result);
		return new ModelAndView("order/order_result");
	}
}
