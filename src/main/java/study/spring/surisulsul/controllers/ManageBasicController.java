package study.spring.surisulsul.controllers;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ManageBasicController {

	/** Service 패턴 구현체 주입 */

	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 관리자 - 로그인 페이지 이동 처리 */
	@RequestMapping(value = "/manage.do", method = RequestMethod.GET)
	public String manage_login() throws Exception {
		
		return "manage/manage_login";
	}
	
	/** 관리자 - 로그인 확인 후 manage_home 페이지로 이동 처리 */
	@RequestMapping(value = "/manage_home.do", method = RequestMethod.GET)
	public String manage_login_ok() throws Exception {
		
		return "manage/manage_home";
	}
}
