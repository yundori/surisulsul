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
	
	// 2) Join 절에 따른 추가 컬럼
	
}
