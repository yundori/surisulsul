package study.spring.surisulsul.model;

import lombok.Data;

@Data
public class Basket {
	private int id;
	private int m_id;
	private int p_id;
	private String p_name;
	private int p_price;
	private int qty;
	private String reg_date;
	private String edit_date;
}
