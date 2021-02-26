package study.spring.surisulsul.model;

import lombok.Data;

@Data
public class Member {
	// 1) members table의 기본 컬럼
	private int id;
	private String email;
	private String name;
	private String pw;
	private String phone;
	private String postcode;
	private String address1;
	private String address2;
	private String birthdate;
	private String jn_result;
	private String is_out;
	private String reg_date;
	private String edit_date;
	private String out_date;

	private String search; // 검색창을 통한 검색어

	// 2) Join 절에 따른 추가 컬럼
	private int age;

	// 3) 페이지 구현을 위한 static 변수
	/** LIMIT 절에서 사용할 조회 시작 위치 */
	private static int offset;

	/** LIMIT 절에서 사용할 조회할 데이터 수 */
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Member.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Member.listCount = listCount;
	}

}
