package study.spring.surisulsul.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.surisulsul.helper.PageData;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Order;
import study.spring.surisulsul.service.ManageOrdersService;
import study.spring.surisulsul.service.OrderService;

@Controller
public class ManageOrdersController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	ManageOrdersService manageService;
	@Autowired
	OrderService orderService;

	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	

	/** 관리자 - manage_orders 페이지 처리 */
	@RequestMapping(value = "/manage_orders.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView manage_orders(Model model,
			@RequestParam(value = "order_status", required = false) String order_status,
			@RequestParam(value = "pay_method", required = false) String pay_method,
			@RequestParam(value = "from_date", required = false) String from_date,
			@RequestParam(value = "to_date", required = false) String to_date)throws Exception {
		
		int total_cnt=0; //전체주문건수
		int sub_cnt = 0; //주문상품 수
		
		Order input = new Order();
		List<Order> output = new ArrayList<Order>();
		
		//받아온 파라미터를 가지고 impl메서드에 넘겨줄 input객체 내용 부여
		if(order_status!=null && order_status!="all") {
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>> order_status != null if구문에 들어왔습니다");
			if(order_status.equals("order_cmpl")) {
				System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>> order_status==order_cmpl if구문에 들어왔습니다");
				input.setPay_result("N");
				input.setSend_result("N");
			}else if(order_status.equals("pay_cmpl")) {
				input.setPay_result("Y");
				input.setSend_result("N");
			}else if(order_status.equals("send_cmpl")) {
				input.setPay_result("Y");
				input.setSend_result("Y");
			}
		}
		
		if(pay_method!=null && pay_method!="all") {
			if(pay_method.equals("cash")) {
				input.setPayment("cash");
			}else if(pay_method.equals("card")) {
				input.setPayment("card");
			}
		}
		
		if(from_date!=null) {
			if(to_date==null) {
				return webHelper.redirect(null, "조회하시고자 하는 주문일자를 정확히 입력해주세요.");
			}else {
				input.setFrom_date(from_date);
				input.setTo_date(to_date);
			}
		}
		
		System.out.println(input.toString());

		//input에 담은 데이터를 가지고 테이블 조회 수행
		try {
			// 데이터 조회하기
			output = manageService.getOrderList(input);
			for(int i=0; i<output.size(); i++) {
				int tmp = manageService.getMemOrderCount(output.get(i));
				System.out.println("output.get("+i+").getB_id : "+output.get(i).getB_id()+",,,,,,, manageService에서 불러온 누적주문수 : "+tmp);
				output.get(i).setOrder_cnt(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 상태유지를 위한 form 태그 내용 전달
		model.addAttribute("order_status", order_status);
		model.addAttribute("pay_method", pay_method);
		model.addAttribute("from_date", from_date);
		model.addAttribute("to_date", to_date);
		// 데이터베이스 조회 이후 관련 내용 view에 전송
		model.addAttribute("output", output);
		model.addAttribute("total_cnt", total_cnt);
		model.addAttribute("sub_cnt", sub_cnt);
		return new ModelAndView("manage/manage_orders");
	}
	
	/** 관리자 - manage_order_details 페이지 처리 */
	@RequestMapping(value = "/manage_order_details.do", method = RequestMethod.GET)
	public ModelAndView order_details(Model model) throws Exception {
		System.out.println("manage_order_details 연결 확인");
		return new ModelAndView("manage/manage_order_details");
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
