package study.spring.surisulsul.service;

import java.util.List;

import study.spring.surisulsul.model.Order;

public interface ManageOrdersService {
	
	/**
	 * manage_orders > 주문내역 확인 : 주문 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Order> getOrderList(Order input) throws Exception;
	
	/**
	 * manage_orders > 사용자별 누적주문수 조회
	 * @return int 
	 * @throws Exception
	 */
	public int getMemOrderCount(Order input) throws Exception;
	
	/**
	 * manage_orders > 해당 주문의 총 주문 상품수 조회
	 * @return int 
	 * @throws Exception
	 */
	public int getSubCount(Order input) throws Exception;
	
	/**
	 * manage_order_details > 해당 주문의 상세 정보 확인
	 * @return 조회 결과에 대한 Order객체 내용
	 * @throws Exception
	 */
	public Order getOrderDetails(Order input) throws Exception;
	
	/**
	 * manage_order_details/uncmpl_orders > 해당 주문의 pay_result='Y'로 DB업데이트
	 * @return int
	 * @throws Exception
	 */
	public int updatePayResult(Order input) throws Exception;
	
	/**
	 * manage_order_details/uncmpl_orders > 해당 주문의 send_result='Y'로 DB업데이트
	 * @return int
	 * @throws Exception
	 */
	public int updateSendResult(Order input) throws Exception;
	
	/**
	 * uncmpl_orders > 주문내역 확인 : 처리상태가 입금대기이거나 배송대기인 경우만 출력
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Order> getUncmplOrderList(Order input) throws Exception;
	
	
	/**
	 * manage_sales > 매출 조회 : 월간매출/연간매출 조회
	 * @param type : month면 월간 매출, year면 연간매출
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Order> getDateSales(String type, Order input) throws Exception;
}
