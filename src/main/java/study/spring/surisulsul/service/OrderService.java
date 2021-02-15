package study.spring.surisulsul.service;

import java.util.List;

import study.spring.surisulsul.model.Order;

/** 주문/주문취소/주문내역확인 기능을 제공하기 위한 Service 계층 */
public interface OrderService {
	
	/**
	 * 주문내역 확인 : 주문 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Order> getOrderList(Order input) throws Exception;
	
	/**
	 * 주문 내역 확인 : 주문 INSERT 처리 이후 바로 주문 정보 조회
	 * @return 조회 결과에 대한 Order객체
	 * @throws Exception
	 */
	public Order getOrderItem(Order input) throws Exception;
	
	/**
	 * 주문 내역 확인 : 주문 INSERT 처리 이후 바로 orders_sub 데이터 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Order> getOrderSubList(Order input) throws Exception;
	
	/**
	 * 주문 기능 : 주문 데이터 등록하기
	 * @param Order 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addOrder(Order input) throws Exception;
	
	/**
	 * 주문 기능2 : 주문상품 상세 데이터 등록하기
	 * @param Order 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addOrderProducts(Order input) throws Exception;
	
	/**
	 * 주문 데이터가 저장되어 있는 갯수 조회
	 * @return int 
	 * @throws Exception
	 */
	public int getOrderCount(Order input) throws Exception;
	
	/**
	 * 해당 orders_sub 컬럼에 has_review 값을 Y로 변경
	 * @return
	 * @throws Exception
	 */
	public int updateReview(Order input) throws Exception;
	
	/**
	 * 주문 취소 : 주문 데이터 삭제하기
	 * @param Order 삭제할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteOrder(Order input) throws Exception;

}
