package study.spring.surisulsul.model;

import lombok.Data;

@Data
/**
 * 매출 테이블
 */
public class Sales {	
	private int id;				//매출 번호
	private int p_id;			//상품 id
	private int total_qty;		//총 매출수량(한달)
	private int total_price;	//총 매출금액(한달)
	private String edit_date;		//매출 업데이트 날짜
}
