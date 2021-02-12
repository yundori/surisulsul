package study.spring.surisulsul.service;

import study.spring.surisulsul.model.Sales;

public interface SalesService {
	
	/**
	 * 매출 전체 수 조회하기
	 * 
	 * @return int
	 * @throws Exception
	 */
	public int getSalesCount(Sales input) throws Exception;

}
