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

}
