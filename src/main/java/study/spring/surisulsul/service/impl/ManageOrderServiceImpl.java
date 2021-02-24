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

}
