package study.spring.surisulsul.service;

import java.util.List;

import study.spring.surisulsul.model.Order;

public interface ManageOrdersService {
	
	/**
	 * 관리자페이지 주문내역 확인 : 주문 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Order> getOrderList(Order input) throws Exception;
	
	/**
	 * 관리자페이지 사용자별 누적주문수 조회
	 * @return int 
	 * @throws Exception
	 */
	public int getMemOrderCount(Order input) throws Exception;
	
}
