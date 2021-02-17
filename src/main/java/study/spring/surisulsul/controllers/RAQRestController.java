package study.spring.surisulsul.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.surisulsul.helper.PageData;
import study.spring.surisulsul.helper.RegexHelper;
import study.spring.surisulsul.helper.WebHelper;
import study.spring.surisulsul.model.Qna;
import study.spring.surisulsul.model.Review;
import study.spring.surisulsul.service.ReviewAndQnaService;

@RestController
public class RAQRestController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	ReviewAndQnaService reviewAndQnaService;

	/** 프로젝트 이름에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 리뷰 작성에 대한 action 페이지 */
	@RequestMapping(value = "review", method = RequestMethod.POST)
	public Map<String, Object> write_review(@RequestParam(value = "p_id", defaultValue = "0") int p_id,
			@RequestParam(value = "content", required = false) String content,
			@RequestParam(value = "star", defaultValue = "0") int star,
			@RequestParam(value = "rev_img", required = false) String rev_img) {

		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리한다.
		if (content.equals("")) {
			return webHelper.getJsonWarning("후기 내용을 입력하세요.");
		}
		if (rev_img.equals("")) {
			rev_img = "default.png";
		}

		// 숫자형으로 선언된 파라미터
		if (p_id == 0) {
			return webHelper.getJsonWarning("상품이 선택되지 않았습니다.");
		}
		if (star == 0) {
			return webHelper.getJsonWarning("별점을 입력하세요. 1~5 사이로 입력 가능합니다.");
		}

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Review input = new Review();
		input.setM_id(1);
		input.setM_name("마수리");
		input.setP_id(p_id);
		input.setContent(content);
		input.setStar(star);
		input.setRev_img(rev_img);

		Review output = null;

		try {
			// 데이터 저장
			// 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK 값이 저장된다.
			reviewAndQnaService.addReview(input);

			// 데이터 조회
			output = reviewAndQnaService.getReviewItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
	}

	/** 리뷰 수정에 대한 action 페이지 */
	@RequestMapping(value = "/review", method = RequestMethod.PUT)
	public Map<String, Object> edit_review(@RequestParam(value = "id", defaultValue = "0") int id,
			@RequestParam(value = "p_id", defaultValue = "0") int p_id,
			@RequestParam(value = "content", required = false) String content,
			@RequestParam(value = "star", defaultValue = "0") int star,
			@RequestParam(value = "reg_date", required = false) String reg_date,
			@RequestParam(value = "rev_img", required = false) String rev_img) {

		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 필수 검사 (리뷰가 존재하는지)
		if (id == 0) { return webHelper.getJsonWarning("잘못된 접근입니다."); }

		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리한다.
		if (content.equals("")) {
			return webHelper.getJsonWarning("후기 내용을 입력하세요.");
		}
		if (rev_img.equals("")) {
			rev_img = "default.png";
		}

		// 숫자형으로 선언된 파라미터
		if (p_id == 0) {
			return webHelper.getJsonWarning("상품이 선택되지 않았습니다.");
		}
		if (star == 0) {
			return webHelper.getJsonWarning("별점을 입력하세요. 1~5 사이로 입력 가능합니다.");
		}
		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Review input = new Review();
		input.setId(id);
		input.setM_id(1);
		input.setM_name("마수리");
		input.setP_id(p_id);
		input.setContent(content);
		input.setStar(star);
		input.setReg_date(reg_date);
		input.setRev_img(rev_img);

		// 수정된 결과를 조회할 객체
		Review output = null;

		try {
			// 데이터 수정
			reviewAndQnaService.editReview(input);

			// 데이터 조회
			output = reviewAndQnaService.getReviewItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
	}

	/** 리뷰 삭제에 대한 action 페이지 */
	@RequestMapping(value = "/review", method = RequestMethod.DELETE)
	public Map<String, Object> delete_review(
			@RequestParam(value = "id", defaultValue = "0") int id) {

		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 필수 검사 (리뷰가 존재하는지)
		if (id == 0) { return webHelper.getJsonWarning("잘못된 접근입니다."); }
		
		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 Beans에 저장
		Review input = new Review();
		input.setId(id);
		
		try {
			reviewAndQnaService.deleteReview(input);
		} catch (Exception e){
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}

	/** 문의 작성에 대한 action 페이지 */
	@RequestMapping(value = "/question", method = RequestMethod.POST)
	public Map<String, Object> write_question(@RequestParam(value = "p_id", defaultValue = "0") int p_id,
			@RequestParam(value="type", defaultValue="0") int type,
			@RequestParam(value = "content", required = false) String content) {
		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리한다.
		if (content.equals("")) {
			return webHelper.getJsonWarning("문의 내용을 입력하세요.");
		}

		// 숫자형으로 선언된 파라미터
		if (p_id == 0) {
			return webHelper.getJsonWarning("상품이 선택되지 않았습니다.");
			
		}
		if (type == 0) {
			return webHelper.getJsonWarning("문의 분류를 선택해주세요.");
		}

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Qna input = new Qna();
		input.setM_id(1);
		input.setM_name("마수리");
		input.setType(type);
		input.setP_id(p_id);
		input.setContent(content);

		Qna output = null;

		try {
			// 데이터 저장
			// 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK 값이 저장된다.
			reviewAndQnaService.addQna(input);

			// 데이터 조회
			output = reviewAndQnaService.getQnaItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
	}

	/** 문의 수정에 대한 action 페이지 */
	@RequestMapping(value = "question", method = RequestMethod.PUT)
	public Map<String, Object> edit_question(
			@RequestParam(value = "id", defaultValue = "0") int id,
			@RequestParam(value = "p_id", defaultValue = "0") int p_id,
			@RequestParam(value="type", defaultValue="0") int type,
			@RequestParam(value = "content", required = false) String content,
			@RequestParam(value = "reg_date", required = false) String reg_date) {

		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 필수 검사 (문의가 존재하는지)
		if (id == 0) {
			return webHelper.getJsonWarning("잘못된 접근입니다.");
		}

		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우는 값이 입력되지 않으면 빈 문자열로 처리한다.
		if (content.equals("")) {
			return webHelper.getJsonWarning("문의 내용을 입력하세요.");
		}

		// 숫자형으로 선언된 파라미터
		if (p_id == 0) {
			return webHelper.getJsonWarning("상품이 선택되지 않았습니다.");
		}
		if (type == 0) {
			return webHelper.getJsonWarning("문의 분류를 선택해주세요.");
		}

		/** 2) 데이터 저장하기 */
		// 저장할 값들을 Beans에 담는다.
		Qna input = new Qna();
		input.setId(id);
		input.setM_id(1);
		input.setM_name("마수리");
		input.setType(type);
		input.setP_id(p_id);
		input.setContent(content);
		input.setReg_date(reg_date);

		// 수정된 결과를 조회할 객체
		Qna output = null;

		try {
			// 데이터 수정
			reviewAndQnaService.editQna(input);

			// 데이터 조회
			output = reviewAndQnaService.getQnaItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
	}

	/** 문의 삭제에 대한 action 페이지 */
	@RequestMapping(value = "question", method = RequestMethod.DELETE)
	public Map<String, Object> delete_question(
			@RequestParam(value = "id", defaultValue = "0") int id) {
		
		/** 1) 사용자가 입력한 파라미터에 대한 유효성 검사 */
		// 필수 검사 (리뷰가 존재하는지)
		if (id == 0) { return webHelper.getJsonWarning("잘못된 접근입니다."); }
		
		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건값을 Beans에 저장
		Qna input = new Qna();
		input.setId(id);
		
		try {
			reviewAndQnaService.deleteQna(input);
		} catch (Exception e){
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}

	/** 상품 상세 - 리뷰 페이지로 이동 */
	@RequestMapping(value = "/review_view", method = RequestMethod.GET)
	public Map<String, Object> get_reviews(
			// 상세 페이지에서 조회할 상품 번호
			@RequestParam(value = "p_id", defaultValue = "1") int p_id,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(상품번호)를 Beans에 담는다.
		Review input = new Review();
		input.setP_id(p_id);

		List<Review> output = null; // 조회 결과가 저장될 객체
		PageData pageData = null;

		try {
			// 전체 게시글 수 조회
			totalCount = reviewAndQnaService.getProductReviewCount(input);

			// 페이지 번호 계산 --> 계산 결과를 로그르 출력
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 limit 절에서 사용될 값을 Beans의 static 변수에 저장
			Review.setOffset(pageData.getOffset());
			Review.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = reviewAndQnaService.getProductReviewList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("p_id", p_id);
		data.put("item", output);
		data.put("meta", pageData);

		return webHelper.getJsonData(data);
	}

	/** 상품 상세 - 문의 페이지로 이동 */
	@RequestMapping(value = "/question", method = RequestMethod.GET)
	public Map<String, Object> get_questions(
			// 상세 페이지에서 조회할 상품 번호
			@RequestParam(value = "p_id", defaultValue = "1") int p_id,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(상품번호)를 Beans에 담는다.
		Qna input = new Qna();
		input.setP_id(p_id);

		List<Qna> output = null; // 조회 결과가 저장될 객체
		PageData pageData = null;

		try {
			// 전체 게시글 수 조회
			totalCount = reviewAndQnaService.getProductQnaCount(input);

			// 페이지 번호 계산 --> 계산 결과를 로그르 출력
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 limit 절에서 사용될 값을 Beans의 static 변수에 저장
			Qna.setOffset(pageData.getOffset());
			Qna.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = reviewAndQnaService.getProductQnaList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("p_id", p_id);
		data.put("item", output);
		data.put("meta", pageData);

		return webHelper.getJsonData(data);
	}
}
