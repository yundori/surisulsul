package study.spring.surisulsul.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Cscenter;
import study.spring.surisulsul.model.Product;
import study.spring.surisulsul.service.CscenterService;

@Slf4j
@Controller
public class ManageCscenterController {
	
	/** Service 패턴 구현체 주입 */
	
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	CscenterService cscenterService;
	
	
	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** manage_cscenter 페이지 처리 */
	@RequestMapping(value = "/manage_cscenter.do", method = RequestMethod.GET)
	public ModelAndView manage_cscenter(Model model, 
			@RequestParam(value="type", required = false) String type) throws Exception 
	
	{		/** 다시 하기,, */
			Cscenter input = new Cscenter();
			
			
			List<Cscenter> notice_output = null;
			List<Cscenter> faq_output = null;
			
			notice_output = cscenterService.getNoticeList(input);
			faq_output = cscenterService.getFaqList(input);
			
			
	
			model.addAttribute("notice_output", notice_output);
			model.addAttribute("faq_output", faq_output);
		
		
		return new ModelAndView("manage/manage_cscenter");
	}
	
	/** 알립니다 & FAQ 등록  */
	@RequestMapping(value = "/manage_cscenter_add.do", method = RequestMethod.GET)
	public ModelAndView cscenter_add(Model model) throws Exception {
		
		return new ModelAndView("manage/manage_cscenter_add");
	}
	
	/** 알립니다 & FAQ 등록 action 페이지 */
	@RequestMapping(value="/manage_cscenter_add_ok.do", method=RequestMethod.POST)
	public ModelAndView cscenter_add_ok(Model model,
			@RequestParam(value="type", required = false) String type,
			@RequestParam(value="title", required = false) String title,
			@RequestParam(value="content", required = false) String content,
			@RequestParam(value="reg_date", required = false) String reg_date,
			@RequestParam(value="edit_date", required = false) String edit_date)  
	
	{
		/** 파라미터 유효성 검사 **/
		if (type.equals("0")) {
			return webHelper.redirect(null, "분류를 선택하세요.");
		}
		
		if (title.equals("")) {
			return webHelper.redirect(null, "제목을 입력하세요.");
		}
		
		if (content.equals("")) {
			return webHelper.redirect(null, "내용을 입력하세요.");
		}
		
		/** 데이터 저장하기 */
		// 저장할 값을 beans에 담는다.
		Cscenter input = new Cscenter();
		input.setType(type);
		input.setTitle(title);
		input.setContent(content);
		input.setReg_date(reg_date);
		input.setEdit_date(edit_date);
		
		try {
			cscenterService.addCscenter(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		return new ModelAndView("/manage/manage_cscenter");
	}
	
	/** 알립니다 & FAQ 수정 */
	@RequestMapping(value="/manage_cscenter_edit.do", method=RequestMethod.GET)
	public ModelAndView cscenter_edit(Model model)  throws Exception {
		
		return new ModelAndView("/manage/manage_cscenter_edit");
	}
	
	/** 알립니다 & FAQ 수정 action 페이지 */
	@RequestMapping(value="/manage_cscenter_edit_ok.do", method=RequestMethod.POST)
	public ModelAndView cscenter_edit_ok(Model model)  throws Exception {
		
		return new ModelAndView("/manage/manage_cscenter");
	}
	
	/** 알립니다 & FAQ 삭제 */
	@RequestMapping(value="/manage_cscenter_delete.do", method=RequestMethod.POST)
	public ModelAndView cscenter_delete(Model model)  throws Exception {
		
		return new ModelAndView("/manage/manage_cscenter");
	}
	
	
}
