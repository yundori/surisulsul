package study.spring.surisulsul.controllers;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManageOrdersController {

	/** Service 패턴 구현체 주입 */

	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	

	/** 관리자 - manage_orders 페이지 처리 */
	@RequestMapping(value = "/manage_orders.do", method = RequestMethod.GET)
	public ModelAndView manage_orders(Model model) throws Exception {

		return new ModelAndView("manage/manage_orders");
	}
	
	/** 관리자 - uncmpl_orders 페이지 처리 */
	@RequestMapping(value = "/uncmpl_orders.do", method = RequestMethod.GET)
	public ModelAndView uncmpl_orders(Model model) throws Exception {

		return new ModelAndView("manage/uncmpl_orders");
	}
	
	/** 관리자 - uncmpl_orders -> 입금상태를 입금완료로 UPDATE 처리 */
	
	/** 관리자 - uncmpl_orders -> 배송 상태를 배송완료로 UPDATE 처리 */
	
	/** 관리자 - manage_sales 페이지 처리 */
	@RequestMapping(value = "/manage_sales.do", method = RequestMethod.GET)
	public ModelAndView manage_sales(Model model) throws Exception {

		return new ModelAndView("manage/manage_sales");
	}


}
