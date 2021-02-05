package study.spring.surisulsul.model;

import lombok.Data;

@Data
public class Order {
	//로그인된 userId를 담을 변수
	private int loginId;
	
	//orders 테이블 컬럼 연결
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
	
	//orders_sub 테이블 컬럼 연결
	private int sub_id;
	private int p_id;
	private String p_name;
	private int p_price;
}
