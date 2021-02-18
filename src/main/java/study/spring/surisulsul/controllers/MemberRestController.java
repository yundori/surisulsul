package study.spring.surisulsul.controllers;

import java.util.HashMap;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Member;
import study.spring.surisulsul.service.MemberService;

@RestController
public class MemberRestController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	MemberService memberService;

	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/** 이메일 중복확인에 대한 action 페이지 */
	@RequestMapping(value = "email_chk", method = RequestMethod.POST)
	public Map<String, Object> email_chk(
			HttpServletRequest request,
			@RequestParam(value="chk_email", required=false) String email) {
		
		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리한다.
		if (email.equals("")) {
			return webHelper.getJsonWarning("이메일을 입력하세요.");
		}
		
		/** 2) 데이터 조회하기 */
		// 데이터를 조회하기 위해 필요한 값을 Beans에 담는다.
		Member input = new Member();
		input.setEmail(email);
		
		String result = null;
		
		try {
			if (memberService.getJoinEmailCount(input)==0) {
				result = "OK";
			}
			
		} catch (Exception e) {
			result="FAIL";
		}
		
		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return webHelper.getJsonData(map);
	}

}
