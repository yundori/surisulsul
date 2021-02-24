package study.spring.surisulsul.model;

import lombok.Data;

@Data
public class Wishlist {
	// 1) wishlist table의 기본 컬럼
	private int id;
	private int m_id;
	private int p_id;
	private String reg_date;
	
	// 2) Join 절에 따른 추가 컬럼
	private int item_id;
	private String item_name;
}
