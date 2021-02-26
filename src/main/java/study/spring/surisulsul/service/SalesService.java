package study.spring.surisulsul.service;

import study.spring.surisulsul.model.Sales;

public interface SalesService {
	
	/**
	 * INSERT SALES 구문 (INSERT Product 할 때 같이 실행됨
	 * @param Sales 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addSales(Sales input) throws Exception;
	
	/**
	 * 매출 전체 수 조회하기
	 * 
	 * @return int
	 * @throws Exception
	 */
	public int getSalesCount(Sales input) throws Exception;

}
