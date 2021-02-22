package study.spring.surisulsul.controllers;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ManageMembersController {
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 관리자 - 상품목록 페이지 **/
	@RequestMapping(value="/manage_members.do", method=RequestMethod.GET)
	public ModelAndView manage_members(Model model) throws Exception {
		
		return new ModelAndView("manage/manage_members");
	}
}
