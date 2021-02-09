package study.spring.surisulsul.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;

@Controller
@Slf4j
public class ExtraController {
	/** WebHelper 주입 
	@Autowired
	WebHelper webHelper;*/

	/** RegexHelper 주입 
	@Autowired
	RegexHelper regexHelper;*/

	/** Service 패턴 구현체 주입 */
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/* 탁주 페이지로 연결 */
	@RequestMapping(value = "/takju.do", method = RequestMethod.GET)
	public String takju(Model model) {
		
		return "extra/takju";
	}
	
	/* 청주 페이지로 연결 */
	@RequestMapping(value = "/cheongju.do", method = RequestMethod.GET)
	public String cheongju(Model model) {
		
		return "extra/cheongju";
	}
	
	/* 과실주 페이지로 연결 */
	@RequestMapping(value = "/fruit_drink.do", method = RequestMethod.GET)
	public String fruit_drink(Model model) {
		
		return "extra/fruit_drink";
	}
	
	/* 증류주 페이지로 연결 */
	@RequestMapping(value = "/spirits.do", method = RequestMethod.GET)
	public String spirits(Model model) {
		
		return "extra/spirits";
	}
	
	/* 기타주류 페이지로 연결 */
	@RequestMapping(value = "/liquerurs.do", method = RequestMethod.GET)
	public String liquerurs(Model model) {
		
		return "extra/liquerurs";
	}
	
	/** 주능 페이지로 연결 */
	@RequestMapping(value = "/juneung.do", method = RequestMethod.GET)
	public String juneung(Model model) {
		//로그인 여부 확인 ->로그인 페이지로 이동
		//session에서 logininfo 받아오기
		//1)주능 결과 있을 경우 - 다시 하시겠습니까? Y(그냥 주능 띄움) N(메인 돌아가기)
		//2)주능 결과 없을 경우 - 그냥 주능 띄움
		
		return "extra/juneung";
	}
	
	/** 주능 페이지에서 가져온 값 처리 */
	@RequestMapping(value = "/juneung_ok.do", method = RequestMethod.POST)
	public String juneung_ok(Model model) {

		return "mypage/mypage";
	}
	
	
	
}
