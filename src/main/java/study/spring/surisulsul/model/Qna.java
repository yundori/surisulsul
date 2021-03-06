package study.spring.surisulsul.model;

import lombok.Data;

@Data
public class Qna {
	// 1) qna table의 기본 컬럼
	private int id;
	private int m_id;
	private String m_name;
	private int p_id;
	private int type;
	private String content;
	private String status;
	private String reg_date;
	private String edit_date;
	
	// 2) Join 절을 위한 추가 컬럼
	private String p_name;
	// 3) 페이지 구현을 위한 static 변수
	/** LIMIT 절에서 사용할 조회 시작 위치 */
	private static int offset;

	/** LIMIT 절에서 사용할 조회할 데이터 수 */
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Qna.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Qna.listCount = listCount;
	}
}
