package study.spring.surisulsul.model;

import lombok.Data;

@Data
public class Order {
	// 로그인된 userId를 담을 변수
	private int loginId;

	// orders 테이블 컬럼 연결
	private int o_id;
	private int price;
	private int b_id;
	private String b_name;
	private String b_phone;
	private String r_name;
	private String r_phone;
	private String r_postcode;
	private String r_address1;
	private String r_address2;
	private String payment;
	private String pay_result;
	private String pay_cash;
	private String pay_card;
	private String send_result;
	private String reg_date;
	private String edit_date;

	// orders_sub 테이블 컬럼 연결
	private int sub_id;
	private int p_id;
	private String p_name;
	private int p_price;
	private int p_qty;
	private String has_review;
	private String o_date;
	
	//관리자페이지에서 사용할 변수 추가
	private int order_cnt; //누적주문수
	private int sub_cnt; //해당 주문의 총 주문상품수
	private String from_date; //검색 from 날짜
	private String to_date; //검색 to 날짜
	
	private int sum_price; //주문 금액 합계
	private int cash_sum;  //무통장 주문 금액 합계
	private int card_sum;  // 카드 주문 금액 합계
	private int unpaid_sum; //미수금 합계
	

	// sales 테이블에 INSERT하기 위해 GROUP BY로 받아올 변수
	private int total_qty;

	// 페이지 구현을 위한 static 변수
	/** LIMIT 절에서 사용할 조회 시작 위치 */
	private static int offset;

	/** LIMIT 절에서 사용할 조회할 데이터 수 */
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Order.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Order.listCount = listCount;
	}
}
