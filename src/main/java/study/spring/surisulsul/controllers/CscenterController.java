package study.spring.surisulsul.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.service.CscenterService;

@Controller
public class CscenterController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired CscenterService cscenterService;
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	
	/** 고객센터 페이지로 이동 */
	@RequestMapping(value="/cscenter/cscenter_main.do", method=RequestMethod.GET)
	public String cscenter_main(Model model
			//, @RequestParam(value="default", defaultValue="a")String type
			) {
		//model.addAttribute("type", type);
		//return webHelper.redirect("cscenter_main", null);
		return "cscenter/cscenter_main";
	}
	
	/** 공지사항 페이지로 이동 */
	@RequestMapping(value="/cscenter/notice.do", method=RequestMethod.GET)
	public String notice(Model model) {
		return "cscenter/cscenter_notice";
	}
	
	/** faq 페이지로 이동 */
	@RequestMapping(value="/cscenter/faq.do", method=RequestMethod.GET)
	public String faq(Model model) {
		return "cscenter/cscenter_faq";
	}
}
