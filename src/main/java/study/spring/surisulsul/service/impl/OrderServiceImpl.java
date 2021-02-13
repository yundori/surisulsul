package study.spring.surisulsul.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.model.Basket;
import study.spring.surisulsul.model.Order;
import study.spring.surisulsul.service.OrderService;

@Slf4j
@Service
public class OrderServiceImpl implements OrderService {

	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;

	/**
	 * 주문내역 확인 : 주문 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Order> getOrderList(Order input) throws Exception {

		List<Order> result = null;

		try {
			result = sqlSession.selectList("OrderMapper.selectList", input);

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
	 * 주문 내역 확인 : 주문 INSERT 처리 이후 바로 주문 조회
	 * @return 조회 결과에 대한 Order객체
	 * @throws Exception
	 */
	@Override
	public Order getOrderItem(Order input) throws Exception{
		Order result = null;
		try {
			result = sqlSession.selectOne("OrderMapper.selectItem", input);

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
	 * 주문 내역 확인 : 주문 INSERT 처리 이후 바로 orders_sub 데이터 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Order> getOrderSubList(Order input) throws Exception{

		List<Order> result = null;

		try {
			result = sqlSession.selectList("OrderMapper.selectOrderSubList", input);

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
	 * 주문 기능 : 주문 데이터 등록하기
	 * @param Order 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addOrder(Order input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("OrderMapper.insertOrderItem", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 주문 기능2 : 주문상품 상세 데이터 등록하기
	 * @param Order 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addOrderProducts(Order input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("OrderMapper.insertSubItem", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

		return result;
	}
	
	/**
	 * 주문 데이터가 저장되어 있는 갯수 조회
	 * @return int 
	 * @throws Exception
	 */
	@Override
	public int getOrderCount(Order input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("OrderMapper.selectOrderCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 주문 취소 : 주문 데이터 삭제하기
	 * @param Order 삭제할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteOrder(Order input) throws Exception {
		int result1 = 0;
		int result2 = 0;

		try {
			result1 = sqlSession.delete("OrderMapper.deleteSubItem", input);
			result2 = sqlSession.delete("OrderMapper.deleteOrderItem", input);
			if (result1 == 0) {
				throw new NullPointerException("result1=0");
			}else if(result2 == 0) {
				throw new NullPointerException("result2=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result2;
	}

}
