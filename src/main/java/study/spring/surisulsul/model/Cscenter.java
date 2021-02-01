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
}
