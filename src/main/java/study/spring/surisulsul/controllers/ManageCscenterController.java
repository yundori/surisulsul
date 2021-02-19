package study.spring.surisulsul.controllers;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ManageCscenterController {
	
	/** Service 패턴 구현체 주입 */

	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** manage_cscenter 페이지 처리 */
	@RequestMapping(value = "/manage_cscenter.do", method = RequestMethod.GET)
	public ModelAndView manage_cscenter(Model model) throws Exception {

		return new ModelAndView("manage/manage_cscenter");
	}
	
	/** cs -> 수정 버튼 : popup으로 수정 (내용 불러와야 함)
				등록 버튼 : 새 글 등록이라고 위에 뜨게 하고 -> 드롭다운으로 분류 선택하기 ,
						내용 등록하면 사용자 페이지, 관리자 페이지 모두에 등록되어야 함
				삭제 버튼 : 클릭하면 alert 창 띄우고 ("정말 삭제하시겠습니까?") 
						삭제되면 삭제가 완료 되었습니다. 띄우고 전 페이지로 돌아감
	*/
	
	
}
