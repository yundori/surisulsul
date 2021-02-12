package study.spring.surisulsul.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import retrofit2.http.GET;
import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Basket;
import study.spring.surisulsul.model.Member;
import study.spring.surisulsul.model.Order;
import study.spring.surisulsul.service.BasketService;
import study.spring.surisulsul.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	WebHelper webHelper;
	@Autowired
	RegexHelper regexHelper;
	
	
	//Service 패턴 객체 주입
	@Autowired
	BasketService basketService;
	@Autowired
	OrderService orderService;
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 장바구니에 추가 (페이지 연결 X)  - Action 처리 */
	/** 장바구니 table에 INSERT 처리 해야됨 */
	@RequestMapping(value = "/basket/add_ok.do", method = RequestMethod.POST)
	public ModelAndView basket_add_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "p_id", defaultValue = "0") int p_id,
			@RequestParam(value = "p_name", required = true) String p_name,
			@RequestParam(value = "p_price", defaultValue = "0") int p_price,
			@RequestParam(value = "order_quantity", defaultValue = "0") int qty){
		//세션값 받아오기
		HttpSession session = request.getSession();		
		Member loginSession = (Member) session.getAttribute("loginInfo");
		
		//로그인 세션이 없을 경우 = 로그인되어있지 않을 경우 alert 발생
		if(loginSession==null) { 
			return webHelper.redirect(contextPath+"/account/login.do", "로그인 후 이용해주세요.");
		}
		
		/** 1) 입력 파라미터에 대한 유효성 검사 */
		if(p_id==0 || p_name.equals("") || p_price==0) {
			return webHelper.redirect(null, "주문 가능 상품이 아닙니다.");
		}
		if(qty==0) {
			return webHelper.redirect(null, "상품 수량을 선택해주세요.");
		}
		
		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다
		Basket input = new Basket();
		System.out.println(loginSession.getId());
		input.setLoginId(loginSession.getId());
		input.setP_id(p_id);
		input.setP_name(p_name);
		input.setP_price(p_price);
		input.setQty(qty);
		
		try {
			// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값 저장
			basketService.addBasket(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
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
		boolean select_basket_result = false; //output에 결과가 있으면 true
		int total_price = 0;
		int cnt = 0;
				
		try {
			//데이터 조회하기
			output = basketService.getBasketList(input);
			cnt = basketService.getBasketCount(input);
			
			if(output.size()!=0) { //output에 결과가 있는 경우
				select_basket_result = true;
				for(int i=0; i<output.size(); i++) {
					total_price+=(output.get(i).getP_price())*(output.get(i).getQty());
				}
				
			}
			
		} catch (Exception e) {	e.printStackTrace(); }
		
		//view처리
		model.addAttribute("output", output);
		model.addAttribute("cnt", cnt);
		model.addAttribute("total_price", total_price);
		model.addAttribute("result", select_basket_result);
		return "order/basket";
	}
	
	/** 장바구니 선택 삭제 처리 */
	@RequestMapping(value = "/basket/delete_ok.do", method = RequestMethod.POST)
	public ModelAndView delete_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "basketItem", required=false) List<String> chkItems) {
		//세션값 받아오기
		HttpSession session = request.getSession();		
		Member loginSession = (Member) session.getAttribute("loginInfo");
		
		//input 값에 쓰일 basketId 값 선언
		int basketId = 0;
		
		if (chkItems!=null) {
			for(int i=0; i<chkItems.size(); i++) {
				// 데이터 삭제에 필요한 조건값을 Beans에 저장
				Basket input = new Basket();
				input.setLoginId(loginSession.getId());
				basketId = Integer.parseInt(chkItems.get(i));
				input.setId(basketId);
				
				//데이터 삭제
				try {
					basketService.deleteBasketItem(input);
				} catch (Exception e) { e.printStackTrace(); }
			}
		}else { //체크된 박스 없이 submit됐을 경우
			return webHelper.redirect(null, "삭제할 상품이 없습니다.");
		}
		return webHelper.redirect(contextPath+"/basket.do", null);
	}
	
	/** 주문 페이지로 연결 */
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String go_order(Model model, HttpServletRequest request) {
		//세션값 받아오기
		HttpSession session = request.getSession();		
		Member loginSession = (Member) session.getAttribute("loginInfo");
		
		//조회에 필요한 조건값(검색어)를 Beans에 담는다.
		Basket input = new Basket();
		input.setLoginId(loginSession.getId());		
				
		List<Basket> output = null; //조회 결과가 저장될 객체
		int total_price = 0;
				
		try {
			//데이터 조회하기
			output = basketService.getBasketList(input);
			
			if(output.size()!=0) { //output에 결과가 있는 경우
				for(int i=0; i<output.size(); i++) {
					total_price+=(output.get(i).getP_price())*(output.get(i).getQty());
				}
				
			}
			
		} catch (Exception e) {	e.printStackTrace(); }
		
		//view처리
		model.addAttribute("output", output);
		model.addAttribute("total_price", total_price);
		model.addAttribute("loginSession", loginSession);
		return "order/basket_order";
	}
	
	/** 주문 내용 INSERT 처리 + 주문 결과 페이지로 연결 */
	@RequestMapping(value = "/order/order_ok.do", method = RequestMethod.POST)
	public ModelAndView go_order_result(Model model, HttpServletRequest request,
			@RequestParam(value="basketItems", required=false) List<String> basketItems,
			@RequestParam(value="basketNames", required=false) List<String> basketNames,
			@RequestParam(value="basketPrices", required=false) List<String> basketPrices,
			@RequestParam(value="basketQty", required=false) List<String> basketQty,
			@RequestParam(value="totalPrice", required=false) int total_price,
			@RequestParam(value="receiver_name", required=false) String r_name,
			@RequestParam(value="receiver_tel", required=false) String r_phone,
			@RequestParam(value="postcode", required=false) String postcode,
			@RequestParam(value="address1", required=false) String address1,
			@RequestParam(value="address2", required=false) String address2,
			@RequestParam(value="payment", required=false) String payment,
			@RequestParam(value="payed_name", required=false) String payed_name,
			@RequestParam(value="bank", required=false) String payed_bank,
			@RequestParam(value="terms", required=false) List<String> terms) {
		
		//세션값 받아오기
		HttpSession session = request.getSession();		
		Member loginSession = (Member) session.getAttribute("loginInfo");
		
		boolean order_result = false;
		
		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */		
		// 이름 유효성 검사
		if(r_name.equals("")) {return webHelper.redirect(null, "수령인 이름을 입력하세요.");}
		if(!regexHelper.isKor(r_name)) {return webHelper.redirect(null, "이름은 한글만 가능합니다.");}
		
		// 핸드폰 번호 유효성 검사
		if(r_phone.equals("")) {return webHelper.redirect(null, "핸드폰 번호를 입력하세요.");}
		if(!regexHelper.isCellPhone(r_phone)) {return webHelper.redirect(null, "핸드폰 번호를 - 없이 올바른 양식으로 입력해 주세요.");}
		
		// 주소 유효성 검사
		if(postcode.equals("")) {return webHelper.redirect(null, "우편번호를 입력하세요.");}
		if(address1.equals("")) {return webHelper.redirect(null, "주소를 입력하세요.");}
		if(address2.equals("")) {return webHelper.redirect(null, "상세주소를 입력하세요.");}
		
		//payment가 현금일 경우 유효성 검사 -> payed_name과 payed_bank
		//payment가 카드일 경우 유효성 검사 -> 보류
		if(payment.equals("cash")) {
			if(payed_name.equals("")) {return webHelper.redirect(null, "입금자명을 입력하세요.");}
			if(!regexHelper.isKor(payed_name)) {return webHelper.redirect(null, "이름은 한글만 가능합니다.");}
			if(payed_bank.equals("") || payed_bank==null || payed_bank.equals("0")) {
				return webHelper.redirect(null, "입금 은행을 선택해주세요.");
			}
		}else if(payment.equals("card")) {
			
		}
		
		// 이용약관 동의 유효성 검사
		if(terms.size()<3) {return webHelper.redirect(null, "이용약관에 모두 동의해주세요.");}
		
		/** 2) 데이터 beans에 저장 */
		//orders 테이블에 들어갈 주문 정보 (구매자/수령자/결제방식 등)
		Order input = new Order();
		input.setPrice(total_price);
		input.setB_id(loginSession.getId());
		input.setB_name(loginSession.getName());
		input.setB_phone(loginSession.getPhone());
		input.setR_name(r_name);
		input.setR_phone(r_phone);
		input.setR_postcode(postcode);
		input.setR_address1(address1);
		input.setR_address2(address2);
		input.setPayment(payment);
		if(payment.equals("cash")) {	//현금 결제 radio 선택 시
			input.setPay_cash(payed_bank+" ("+payed_name+")");
			input.setPay_card(null);
			input.setPay_result("N");
		}else {							//카드 결제 radio 선택 시
			input.setPay_cash(null);
			input.setPay_card("cardname");
			input.setPay_result("Y");
		}
		
		Order orderInfo = new Order();
		
		/** 3) 주문(orders) 테이블에 데이터 저장 */
		try {
			// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값 저장
			orderService.addOrder(input);
			order_result = true;
			
			// Order 정보 저장 이후 방금 저장한 Order 정보를 SELECT 해오기
			orderInfo = orderService.getOrderItem(input);
			
		} catch (Exception e) { e.printStackTrace(); }
		
		/** 4) 주문상세(orders_sub) 테이블에 데이터 저장 */
		// 1. basketItem의 size만큼 반복문을 돌면서 들어갈 데이터 준비
		// 2. orders_sub에 들어갈 데이터가 준비되면 orders_sub 테이블에 INSERT 수행
		Order subInput = new Order();
		for(int i=0; i<basketItems.size(); i++) {
			//orders_sub의 o_id에 들어갈 값 (orders 테이블에 담긴 정보의 PK값)
			subInput.setO_id(orderInfo.getO_id());
			
			//orders_sub에 들어갈 값 (hidden에서 가져온거)
			subInput.setP_id(Integer.parseInt(basketItems.get(i)));
			subInput.setP_name(basketNames.get(i));
			subInput.setP_price(Integer.parseInt(basketPrices.get(i)));
			subInput.setP_qty(Integer.parseInt(basketQty.get(i)));
			
			//orders_sub에 o_date에 들어갈 값 (orders 테이블에 담긴 reg_date 컬럼값)
			subInput.setReg_date(orderInfo.getReg_date());
			
			try {
				// 데이터 저장 --> 데이터 저장에 성공하면 파라미터로 전달하는 subInput 객체에 PK값 저장
				orderService.addOrderProducts(subInput);
				order_result = true;
			} catch (Exception e) { e.printStackTrace(); order_result=false; }
		}
		
		/** 5) 여기까지 정상 수행 시 로그인되어있는 해당 아이디의 장바구니에 있는 내용 모두 삭제 */ 
		Basket basketInput = new Basket();
		basketInput.setLoginId(loginSession.getId());
		try {
			basketService.deleteBasket(basketInput); 
			order_result = true;
		} catch (Exception e) { e.printStackTrace(); order_result=false; }
		
		/** 6) order_sub에 들어있는 모든 내용을 조회하여 model.addAttribute로 전송 */
		List<Order> orderSubList = null;
		try {
			orderSubList = orderService.getOrderSubList(subInput);
		} catch (Exception e) { e.printStackTrace(); }
				
		/** 7) View 처리 */
		model.addAttribute("orderInfo", orderInfo);
		model.addAttribute("orderSubList", orderSubList);
		model.addAttribute("result", order_result);
		return new ModelAndView("order/order_result");
	}
	
	/** 내가 주문한 내역 확인 --> OrderController */
	@RequestMapping(value = "/mypage/past_order.do", method = RequestMethod.GET)
	public String past_order(Model model) {
		return "mypage/past_order";
	}
}
