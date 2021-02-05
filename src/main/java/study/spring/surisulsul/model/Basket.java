package study.spring.surisulsul.model;

import lombok.Data;

@Data
public class Basket {
	//로그인된 userId를 담을 변수
	private int loginId;
	
	//Basket 테이블에 있는 컬럼 연결
	private int id;
	private int m_id;
	private int p_id;
	private String p_name;
	private int p_price;
	private int qty;
	private String reg_date;
	private String edit_date;
}
