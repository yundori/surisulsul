package study.spring.surisulsul.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;

@Controller
public class CscenterController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	
	/** 공지사항 페이지로 이동 */
	@RequestMapping(value="/cscenter/cscenter_notice.do", method=RequestMethod.GET)
	public String notice(Model model) {
		return "cscenter/cscenter_notice";
	}
	
	/** faq 페이지로 이동 */
	@RequestMapping(value="/cscenter/cscenter_faq.do", method=RequestMethod.GET)
	public String faq(Model model) {
		return "cscenter/cscenter_faq";
	}
}
