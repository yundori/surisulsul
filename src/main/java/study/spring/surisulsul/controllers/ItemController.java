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
public class ItemController {
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
	
	/* 인기있는술 페이지로 이동 */
	@RequestMapping(value = "/best_item.do", method = RequestMethod.GET)
	public String best_item(Model model) {
		
		return "items/best_item";
	}
	
	/* 내가찾는술 페이지로 이동 */
	@RequestMapping(value = "/item_filtered.do", method = RequestMethod.POST)
	public String item_filtered(Model model) {
		
		return "items/item_filtered";
	}
	
	/* 상품상세페이지로 이동 */
	@RequestMapping(value = "/item_details.do", method = RequestMethod.GET)
	public String item_details(Model model) {
		
		return "items/item_details";
	}
	
	/* 상품정보 탭페이지로 이동 
	@RequestMapping(value = "/item_info.do", method = RequestMethod.GET)
	public String item_info(Model model) {
		
		return "items/item_info";
	}*/

}
