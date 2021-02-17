package study.spring.surisulsul.model;

import lombok.Data;

@Data
public class Cscenter {
	// 1) cscenter table의 기본 컬럼
	private int id;
	private String type;
	private String title;
	private String content;
	private String reg_date;
	private String edit_date;

	// 3) 페이지 구현을 위한 static 변수
	/** LIMIT 절에서 사용할 조회 시작 위치 */
	private static int offset;

	/** LIMIT 절에서 사용할 조회할 데이터 수 */
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Cscenter.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Cscenter.listCount = listCount;
	}
}
