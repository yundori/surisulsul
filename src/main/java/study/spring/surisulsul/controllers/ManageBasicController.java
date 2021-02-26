package study.spring.surisulsul.controllers;

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

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Member;

@Slf4j
@Controller
public class ManageBasicController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** Service 패턴 구현체 주입 */

	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 관리자 - 로그인 페이지 이동 처리 */
	@RequestMapping(value = "/manage.do", method = RequestMethod.GET)
	public ModelAndView manage_login(Model model,
			HttpServletRequest request) throws Exception {
		//세션값 받아오기
		HttpSession session = request.getSession();		
		String manageLoginSession = (String) session.getAttribute("manager_id");
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>> manageLoginSession >>>>>>>>>>>>>>>>>>>>>>> "+manageLoginSession);				
								
		if(manageLoginSession!=null) { 
			return webHelper.redirect(null,"관리자 페이지 로그인이 이미 되어있습니다.");
		}
		
		return new ModelAndView("manage/manage_login");		
		
	}
	
	/** 관리자 - 로그인 확인 후 manage_home 페이지로 이동 처리 */
	@RequestMapping(value = "/manage_home.do", method = RequestMethod.POST)
	public ModelAndView manage_login_ok(Model model,
			HttpServletRequest request,
			@RequestParam(value = "manager_id", required = false) String id,
			@RequestParam(value = "manager_pw", required = false) String pw) throws Exception {
		
		/** 관리자 ID / password와 일치하는지 확인 */
		if(id.equals("managerSuri")) {
			if(pw.equals("sul123!@#")) {
				//로그인 성공 시 세션 객체 생성
				HttpSession session = request.getSession();
				session.setAttribute("manager_id", id);
			}else {
				return webHelper.redirect(null,"패스워드가 잘못되었습니다. 다시 시도해주세요.");
			}
		}else {
			return webHelper.redirect(null,"ID가 잘못되었습니다. 다시 시도해주세요.");
		}
		
		/** 정상로그인이 확인되면 manae_home.do로 정상이동 */
		return new ModelAndView("manage/manage_home");
	}
}
