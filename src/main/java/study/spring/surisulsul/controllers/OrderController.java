package study.spring.surisulsul.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import study.spring.surisulsul.helper.WebHelper;

@Controller
public class OrderController {
	/*
	@Autowired
	WebHelper webHelper;*/
	
	/** 장바구니 페이지로 연결 */
	@RequestMapping(value = "/basket.do", method = RequestMethod.GET)
	public String go_basket() {
		//View 처리
		return "order/basket";
	}
	
	/** 장바구니 선택 삭제 처리 */
	@RequestMapping(value = "/basket/delete_ok.do", method = RequestMethod.GET)
	public void basket_delete_ok() {
		
	}
	
	/** 주문 페이지로 연결 */
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public ModelAndView go_order(Model model) {
		//View 처리
		return new ModelAndView("order/basket_order");
	}
	
	/** 주문 내용 INSERT 처리 + 주문 결과 페이지로 연결 */
	@RequestMapping(value = "/order/order_ok.do", method = RequestMethod.GET)
	public ModelAndView go_order_result(Model model) {
		boolean order_result = true;
		
		//View 처리
		model.addAttribute("result", order_result);
		return new ModelAndView("order/order_result");
	}
}
