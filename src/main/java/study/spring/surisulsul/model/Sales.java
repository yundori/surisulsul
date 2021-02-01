package study.spring.surisulsul.model;

import lombok.Data;

@Data
/**
 * 매출 테이블
 */
public class Sales {	
	private int id;				//매출 번호
	private int p_id;			//상품 id
	private String p_name;		//상품명
	private int p_price;		//상품가격
	private int total_qty;		//총 매출수량(한달)
	private int total_price;	//총 매출금액(한달)
	private String o_date;		//구매 날짜
}
