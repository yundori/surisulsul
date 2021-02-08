package study.spring.surisulsul.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	/** 장바구니에 추가 (페이지 연결 X) */
	/** 장바구니 table에 INSERT 처리 해야됨 */
	@RequestMapping(value = "/basket/add_ok.do", method = RequestMethod.POST)
	public void basket_add_ok(){
		System.out.println("장바구니 add_ok 메서드로 연결");
		
	}
	
	/** 장바구니 페이지로 연결 */
	/** 장바구니로 가면서 selectList 처리해야됨 */
	@RequestMapping(value = "/basket.do", method = RequestMethod.GET)
	public String go_basket(Model model, HttpServletRequest request) {
		//세션값 받아오기
		HttpSession session = request.getSession();
		Member loginSession = (Member) session.getAttribute("loginInfo");

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
