package study.spring.surisulsul.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.model.Order;
import study.spring.surisulsul.service.ManageOrdersService;

@Slf4j
@Service
public class ManageOrderServiceImpl implements ManageOrdersService{

	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * manage_orders > 주문내역 확인 : 주문 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Order> getOrderList(Order input) throws Exception {

	List<Order> result = null;

	try {
		result = sqlSession.selectList("OrderMapper.selectManageOrders", input);

		if (result == null) {
			throw new NullPointerException("result=null");
		}
	} catch (NullPointerException e) {
		log.error(e.getLocalizedMessage());
		throw new Exception("조회된 데이터가 없습니다.");
	} catch (Exception e) {
		log.error(e.getLocalizedMessage());
		throw new Exception("데이터 조회에 실패했습니다.");
	}

	return result;
	}

	/**
	 * manage_orders > 사용자별 누적주문수 조회
	 * @return int 
	 * @throws Exception
	 */
	@Override
	public int getMemOrderCount(Order input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("OrderMapper.selectMemOrderCnt", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	/**
	 * manage_orders > 해당 주문의 총 주문 상품수 조회
	 * @return int 
	 * @throws Exception
	 */
	@Override
	public int getSubCount(Order input) throws Exception{
		int result = 0;
		
		try {
			result = sqlSession.selectOne("OrderMapper.selectSubCnt", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * manage_order_details > 해당 주문의 상세 정보 확인
	 * @return 조회 결과에 대한 Order객체 내용
	 * @throws Exception
	 */
	@Override
	public Order getOrderDetails(Order input) throws Exception {
		Order result = null;
		try {
			result = sqlSession.selectOne("OrderMapper.selectOrderDetails", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * manage_order_details/uncmpl_orders > 해당 주문의 pay_result='Y'로 DB업데이트
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int updatePayResult(Order input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("OrderMapper.updatePayResult", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}

	/**
	 * manage_order_details/uncmpl_orders > 해당 주문의 send_result='Y'로 DB업데이트
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int updateSendResult(Order input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("OrderMapper.updateSendResult", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}

	/**
	 * uncmpl_orders > 주문내역 확인 : 처리상태가 입금대기이거나 배송대기인 경우만 출력
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Order> getUncmplOrderList(Order input) throws Exception {

		List<Order> result = null;

		try {
			result = sqlSession.selectList("OrderMapper.selectUncmplOrders", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * manage_sales > 매출 조회 : 월간매출/연간매출 조회
	 * @param type : month면 월간 매출, year면 연간매출
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Order> getDateSales(String type, Order input) throws Exception {
		
		List<Order> result = null;
		
		if(type.equals("month")) {
			try {
				result = sqlSession.selectList("OrderMapper.selectMonthSales", input);

				if (result == null) {
					throw new NullPointerException("result=null");
				}
			} catch (NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("조회된 데이터가 없습니다.");
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}
		}else if(type.equals("year")) {
			try {
				result = sqlSession.selectList("OrderMapper.selectYearSales", input);

				if (result == null) {
					throw new NullPointerException("result=null");
				}
			} catch (NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("조회된 데이터가 없습니다.");
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}
		}
		
		return result;
	}
	
	/**
	 * manage_home > 오늘 들어온 주문 수
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getNewOrderCount() throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("OrderMapper.selectNewOrderCount");
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}  catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
}
