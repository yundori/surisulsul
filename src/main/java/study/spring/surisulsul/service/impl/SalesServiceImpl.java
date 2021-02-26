package study.spring.surisulsul.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.model.Sales;
import study.spring.surisulsul.service.SalesService;

@Slf4j
@Service
public class SalesServiceImpl implements SalesService{
	
	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * INSERT SALES 구문 (INSERT Product 할 때 같이 실행됨
	 * @param Sales 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addSales(Sales input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("SalesMapper.insertSales", input);
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
	 * 오늘 상품별 매출 현황 확인 (from orders_sub)
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Sales> getTodaySales(Sales input) throws Exception {
		List<Sales> result = null;

		try {
			result = sqlSession.selectList("SalesMapper.selectTodaySales", input);

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
	 * 기존 상품별 매출 현황 확인 (합산용)
	 * @return 조회 결과에 대한 Sales객체
	 * @throws Exception
	 */
	@Override
	public Sales getSalesItem(Sales input) throws Exception {
		Sales result = null;
		try {
			result = sqlSession.selectOne("SalesMapper.selectSalesDetails", input);

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
	 * 오늘매출+기존상품을 합산한 값을 가지고 sales테이블에 대한 update 수행
	 * @return
	 * @throws Exception
	 */
	@Override
	public int updateSales(Sales input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("SalesMapper.updateSales", input);
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
	 * 매출 전체 수 조회하기
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getSalesCount(Sales input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("SalesMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("매출 데이터 수 조회에 실패했습니다.");
		}

		return result;
	}	

}
