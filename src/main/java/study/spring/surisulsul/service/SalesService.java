package study.spring.surisulsul.service;

import java.util.List;

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
	 * 오늘 상품별 매출 현황 확인 (from orders_sub)
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Sales> getTodaySales(Sales input) throws Exception;
	
	/**
	 * 기존 상품별 매출 현황 확인 (합산용)
	 * @return 조회 결과에 대한 Sales객체
	 * @throws Exception
	 */
	public Sales getSalesItem(Sales input) throws Exception;
		
	/**
	 * 오늘매출+기존상품을 합산한 값을 가지고 sales테이블에 대한 update 수행
	 * @return
	 * @throws Exception
	 */
	public int updateSales(Sales input) throws Exception;
	
	/**
	 * 매출데이터가 있는 리스트 개수 조회하기
	 * @return int
	 * @throws Exception
	 */
	public int getSalesCountNotNull(Sales input) throws Exception;

}
