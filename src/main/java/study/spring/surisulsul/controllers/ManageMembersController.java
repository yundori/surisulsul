package study.spring.surisulsul.controllers;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import study.spring.surisulsul.model.Member;
import study.spring.surisulsul.model.Product;
import study.spring.surisulsul.service.MemberService;
import study.spring.surisulsul.service.ProductService;
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
	@RequestMapping(value = "/manage_members.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView manage_members(Model model, HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value = "keyword", required = false) String search,
			@RequestParam(value = "sort", required = false) String sort,
			@RequestParam(value = "page", defaultValue = "1") int nowPage) throws Exception {
		// 세션값 받아오기
		HttpSession session = request.getSession();
		String manageLoginSession = (String) session.getAttribute("manager_id");

		// 로그인 세션이 없을 경우 = 로그인되어있지 않을 경우 alert 발생
		if (manageLoginSession == null) {
			return webHelper.redirect(contextPath + "/manage.do", "관리자 로그인 후 이용해주세요..");
		}

		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		PageData pageData = null;
		Member input = new Member();
		List<Member> output = null;
		int outCount = 0; // 탈퇴 회원 수
		boolean result; // 검색 결과 존재 여부

		// 검색어 input 객체에 담기
		if (search != null) {
			input.setSearch(search);
		}

		// 페이지 수 계산 & 회원수 계산
		try {
			totalCount = memberService.getMemberCount(input);
			outCount = memberService.getOutMemberCount(input);
			// 페이지 번호 계산 --> 계산결과를 로그로 출력될 것이다.
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Member.setOffset(pageData.getOffset());
			Member.setListCount(pageData.getListCount());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		System.out.println(sort);
		System.out.println("***************************************************");
		// 전체 회원 리스트
		if (sort == null || sort.equals("all")) {

			try {
				System.out.println(">>>>>>>>>>>1>>>>>>>>>>>");
				// 회원 리스트 불러오기
				output = memberService.getMemberList(input);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (sort.equals("out")) {
			try {
				System.out.println(">>>>>>>>>>>2>>>>>>>>>>>");

				// 회원 리스트 불러오기
				output = memberService.getOutMemberList(input);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 검색 조건
		if (output == null) {
			result = false;
		} else {
			result = true;
		}
		System.out.println(result);

		model.addAttribute("totalCount", totalCount);
		model.addAttribute("outCount", outCount);
		model.addAttribute("pageData", pageData);
		model.addAttribute("output", output);
		model.addAttribute("result", result);
		model.addAttribute("keyword", search);
		model.addAttribute("sort", sort);

		return new ModelAndView("manage/manage_members");
	}

	/** 회원정보 수정 페이지로 이동 */
	@RequestMapping(value = "/manage_update_info.do", method = RequestMethod.GET)
	public ModelAndView update_info(Model model, HttpServletRequest request,
			@RequestParam(value = "item_id", defaultValue = "0") int id) {
		// 세션값 받아오기
		HttpSession session = request.getSession();
		String manageLoginSession = (String) session.getAttribute("manager_id");

		// 로그인 세션이 없을 경우 = 로그인되어있지 않을 경우 alert 발생
		if (manageLoginSession == null) {
			return webHelper.redirect(contextPath + "/manage.do", "관리자 로그인 후 이용해주세요..");
		}

		// 파라미터 유효성 검사
		if (id == 0) {
			return webHelper.redirect(null, "회원번호가 없습니다.");
		}

		// 회원 확인
		Member member = new Member();
		member.setId(id);

		// 조회한 회원데이터 저장 객체
		Member output = null;

		try {
			output = memberService.getMemberItem(member);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		model.addAttribute("output", output);
		return new ModelAndView("manage/manage_update_info");
	}

	@RequestMapping(value = "/manage_update_info_ok.do", method = RequestMethod.POST)
	public ModelAndView update_info_ok(Model model, HttpServletRequest request,
			@RequestParam(value = "id", required = true) int id,
			@RequestParam(value = "is_out", required = false) String is_out,
			@RequestParam(value = "is_out_changed", required = false) String is_out_changed,
			@RequestParam(value = "out_date", required = false) String out_date,
			@RequestParam(value = "user_email", required = false) String email,
			@RequestParam(value = "user_name", required = false) String name,
			@RequestParam(value = "user_pw", required = false) String pw,
			@RequestParam(value = "user_pw_changed", required = false) String pw_changed,
			@RequestParam(value = "tel", required = false) String phone,
			@RequestParam(value = "postcode", required = false) String postcode,
			@RequestParam(value = "address", required = false) String address1,
			@RequestParam(value = "detailAddress", required = false) String address2) {

		// 세션값 받아오기
		HttpSession session = request.getSession();
		String manageLoginSession = (String) session.getAttribute("manager_id");

		// 로그인 세션이 없을 경우 = 로그인되어있지 않을 경우 alert 발생
		if (manageLoginSession == null) {
			return webHelper.redirect(contextPath + "/manage.do", "관리자 로그인 후 이용해주세요..");
		}
		// 결과를 저장할 객체
		Member result = null;

		// 회원 확인
		Member member = new Member();
		member.setId(id);

		try {
			result = memberService.getMemberItem(member);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		/** 1) 입력한 파라미터에 대한 유효성 검사 */
		// 이메일 확인 유효성 검사
		if (email.equals("")) {
			return webHelper.redirect(null, "이메일을 입력하세요.");
		}
		if (!regexHelper.isEmail(email)) {
			return webHelper.redirect(null, "이메일을 올바른 양식으로 입력하세요.");
		}

		// 이름 유효성 검사
		if (name.equals("")) {
			return webHelper.redirect(null, "이름을 입력하세요.");
		}
		if (!regexHelper.isKor(name)) {
			return webHelper.redirect(null, "이름은 한글만 가능합니다.");
		}

		// 핸드폰 번호 유효성 검사
		if (phone.equals("")) {
			return webHelper.redirect(null, "핸드폰 번호를 입력하세요.");
		}
		if (!regexHelper.isCellPhone(phone)) {
			return webHelper.redirect(null, "핸드폰 번호를 - 없이 올바른 양식으로 입력해 주세요.");
		}

		// 주소 유효성 검사
		if (postcode.equals("")) {
			return webHelper.redirect(null, "우편번호를 입력하세요.");
		}
		if (address1.equals("")) {
			return webHelper.redirect(null, "주소를 입력하세요.");
		}
		if (address2.equals("")) {
			return webHelper.redirect(null, "상세주소를 입력하세요.");
		}

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Member input = new Member();

		// 세션 데이터에서 받아올 값 (수정 불가 값)
		input.setBirthdate(result.getBirthdate());
		input.setJn_result(result.getJn_result());
		input.setReg_date(result.getReg_date());

		// 수정 페이지에서 수정하는 값
		input.setId(id);
		input.setEmail(email);
		input.setName(name);
		input.setPhone(phone);
		input.setPostcode(postcode);
		input.setAddress1(address1);
		input.setAddress2(address2);

		// 비밀번호 수정 여부 확인
		if (pw_changed.equals("")) {
			input.setPw(pw);
		} else {
			input.setPw(pw_changed);
		}

		// 회원 상태를 변경했는지 여부 확인
		// 여러 조건에 따라 out_date 변경이 필요하다.
		if (is_out.equals("N") && is_out_changed.equals("Y")) {
			// 정상 회원 탈퇴시키기
			SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time_now = simple.format(System.currentTimeMillis());
			input.setOut_date(time_now);
		} else if (is_out.equals("Y") && is_out_changed.equals("N")) {
			// 탈퇴 회원 복구시키기
			input.setOut_date(null);
		} else if (is_out.equals("N") && is_out_changed.equals("N")) {
			// 변경하지 않은 경우(정상)
			input.setOut_date(null);
		} else if (is_out.equals("Y") && is_out_changed.equals("Y")) {
			// 변경하지 않은 경우(탈퇴)
			input.setOut_date(out_date);
		}
		// 드롭다운에 선택되어 있는 값을 적용한다.
		input.setIs_out(is_out_changed);

		try {
			// 데이터 수정
			memberService.editMemberAll(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 페이지 이동 */
		// 저장 결과를 확인하기 위해서 데이터 저장 시 생성된 PK 값을 상세 페이지로 전달해야 한다.
		String redirectUrl = contextPath + "/manage_members.do";
		return webHelper.redirect(redirectUrl, "회원 정보 수정이 완료되었습니다.");
	}

	/** 관리자 - 위시리스트 페이지 : 상품id순 정렬 **/
	@RequestMapping(value = "/manage_wishlist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView manage_wishlist(Model model, HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value = "keyword", required = false) String search,
			@RequestParam(value = "page", defaultValue = "1") int nowPage) throws Exception {

		// 세션값 받아오기
		HttpSession session = request.getSession();
		String manageLoginSession = (String) session.getAttribute("manager_id");

		// 로그인 세션이 없을 경우 = 로그인되어있지 않을 경우 alert 발생
		if (manageLoginSession == null) {
			return webHelper.redirect(contextPath + "/manage.do", "관리자 로그인 후 이용해주세요..");
		}

		int totalCount = 0; // 전체 게시글 수
		int listCount = 15; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		PageData pageData = null;

		Product input = new Product(); // 선택된 값을 넘겨줄 객체
		List<Product> p_output = null;
		boolean result; // 검색 결과 존재 여부
		String pageLink = "ById";

		// 검색어 input 객체에 담기
		if (search != null) {
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

			// 상품 리스트 불러오기
			p_output = productService.manage_wish_ProductList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 검색 조건
		if (p_output == null) {
			result = false;
		} else {
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
	public ModelAndView manage_wishlist_asc(Model model, HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value = "keyword", required = false) String search,
			@RequestParam(value = "page", defaultValue = "1") int nowPage) throws Exception {
		
		// 세션값 받아오기
		HttpSession session = request.getSession();
		String manageLoginSession = (String) session.getAttribute("manager_id");

		// 로그인 세션이 없을 경우 = 로그인되어있지 않을 경우 alert 발생
		if (manageLoginSession == null) {
			return webHelper.redirect(contextPath + "/manage.do", "관리자 로그인 후 이용해주세요..");
		}
		
		int totalCount = 0; // 전체 게시글 수
		int listCount = 15; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		PageData pageData = null;

		Product input = new Product(); // 선택된 값을 넘겨줄 객체
		List<Product> p_output = null;
		boolean result; // 검색 결과 존재 여부
		String pageLink = "ByWish";

		// 검색어 input 객체에 담기
		if (search != null) {
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

			// 상품 리스트 불러오기
			p_output = productService.manage_by_wish_ProductList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 검색 조건
		if (p_output == null) {
			result = false;
		} else {
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
