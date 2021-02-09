package study.spring.surisulsul.model;

import lombok.Data;

@Data
public class Product {
	// 1) Product table의 기본 컬럼
	private int id; // 상품번호
	private String name; // 상품명
	private int price; // 상품가격
	private String type; // 주종
	private String loc; // 지역
	private String key1; // 향1
	private String key2; // 향2
	private int sweet; // 당도
	private int sour; // 산미
	private int degree; // 도수
	private String igd; // 술 원재료
	private int size; // 용량
	private String des1; // 술 설명(1줄)
	private String des2; // 술 설명(자세하게 3~4줄)
	private String food; // 해당 술과 어울리는 음식
	private String img; // 해당 술 이미지 이름
	private int star; // 해당 술 리뷰 별점
	private String reg_date; // 상품 등록 날짜
	private String edit_date; // 상품 수정 날짜
	private String jn_result; // 해당 술의 주능 결과
	
	private String types;	//체크박스에 선택된 주종리스트
	private String locs;	//체크박스에 선택된 지역리스트
	private String keys;	//체크박스에 선택된 향리스트
	private String search;	//검색창을 통한 검색어

	// 2) Join 절에 따른 추가 컬럼
	private int total_qty;	// 총 매출 수량

	// 3) 페이지 구현을 위한 static 변수
	/** LIMIT 절에서 사용할 조회 시작 위치 */
	private static int offset;

	/** LIMIT 절에서 사용할 조회할 데이터 수 */
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Product.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Product.listCount = listCount;
	}

}
