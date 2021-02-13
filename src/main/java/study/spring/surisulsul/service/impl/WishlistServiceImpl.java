package study.spring.surisulsul.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.model.Wishlist;
import study.spring.surisulsul.service.WishlistService;

@Slf4j
@Service
public class WishlistServiceImpl implements WishlistService {
	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;

	/**
	 * wishlist 목록 조회
	 */
	@Override
	public List<Wishlist> getWishlistList(Wishlist input) throws Exception {
		List<Wishlist> result = null;

		try {
			result = sqlSession.selectList("WishlistMapper.selectList", input);

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
	 * wishlist 갯수 조회
	 */
	@Override
	public int getWishlistCount(Wishlist input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("WishlistMapper.selectCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("위시리스트 데이터 수 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * wishlist 추가
	 */
	@Override
	public int addWishlist(Wishlist input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("WishlistMapper.insertWishlistItem", input);
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
	 * wishlist 삭제
	 */
	@Override
	public int deleteWishlist(Wishlist input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("WishlistMapper.deleteWishlistItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 위시리스트 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("위시리스트 데이터 삭제에 실패했습니다.");
		}

		return result;
	}
	/**
	 * 중복된 wishlist 갯수 조회
	 */
	@Override
	public int getSameWishlistCount(Wishlist input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("WishlistMapper.sameCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("중복된 위시리스트 데이터 수 조회에 실패했습니다.");
		}

		return result;
	}

}
