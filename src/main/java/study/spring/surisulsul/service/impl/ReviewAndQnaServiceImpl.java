package study.spring.surisulsul.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.model.Qna;
import study.spring.surisulsul.model.Review;
import study.spring.surisulsul.service.ReviewAndQnaService;

@Slf4j
@Service
public class ReviewAndQnaServiceImpl implements ReviewAndQnaService{
	
	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	
	/** 단일 리뷰 조회 */
	public Review getReviewItem(Review input) throws Exception{
		Review result = null;
		try {
			result = sqlSession.selectOne("ReviewAndQnaMapper.selectReviewItem", input);

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
	
	/** 상품별 리뷰 목록 조회 */
	@Override
	public List<Review> getProductReviewList(Review input) throws Exception {
		List<Review> result = null;

		try {
			result = sqlSession.selectList("ReviewAndQnaMapper.productReviewList", input);

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

	/** 회원별 리뷰 목록 조회 */
	@Override
	public List<Review> getMemberReviewList(Review input) throws Exception {
		List<Review> result = null;

		try {
			result = sqlSession.selectList("ReviewAndQnaMapper.memberReviewList", input);

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
	
	/** 리뷰 목록 조회 (검색어 있음) */
	@Override
	public List<Review> getManageReview(Review input) throws Exception {
		List<Review> result = null;

		try {
			result = sqlSession.selectList("ReviewAndQnaMapper.manageReviewSearch", input);

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

	/** 상품별 리뷰 수 조회 */
	@Override
	public int getProductReviewCount(Review input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ReviewAndQnaMapper.selectCountProductReview", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	/** 상품별 별점 총합 조회 */
	@Override
	public int getProductReviewStar(Review input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("ReviewAndQnaMapper.sumStarProductReview", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품별 별점 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	/** 리뷰 수 조회 */
	@Override
	public int getReviewCount(Review input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ReviewAndQnaMapper.selectCountReview", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/** 리뷰 작성 */
	@Override
	public int addReview(Review input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("ReviewAndQnaMapper.addReview", input);
			if (result == 0) {
				throw new NullPointerException("result = 0");
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

	/** 리뷰 수정 */
	@Override
	public int editReview(Review input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("ReviewAndQnaMapper.updateReview", input);
			if (result == 0) {
				throw new NullPointerException("result = 0");
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

	/** 리뷰 삭제 */
	@Override
	public int deleteReview(Review input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("ReviewAndQnaMapper.deleteReview", input);
			if (result == 0) {
				throw new NullPointerException("result = 0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}

		return result;
	}

	/** 단일 문의 조회 */
	public Qna getQnaItem(Qna input) throws Exception{
		Qna result = null;
		try {
			result = sqlSession.selectOne("ReviewAndQnaMapper.selectQnaItem", input);

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

	/** 상품별 문의 목록 조회 */
	@Override
	public List<Qna> getProductQnaList(Qna input) throws Exception {
		List<Qna> result = null;

		try {
			result = sqlSession.selectList("ReviewAndQnaMapper.productQnaList", input);

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

	/** 회원별 문의 목록 조회 */
	@Override
	public List<Qna> getMemberQnaList(Qna input) throws Exception {
		List<Qna> result = null;

		try {
			result = sqlSession.selectList("ReviewAndQnaMapper.memberQnaList", input);

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
	
	/** 문의 목록 조회 (검색어 있음) */
	@Override
	public List<Qna> getManageQna(Qna input) throws Exception {
		List<Qna> result = null;

		try {
			result = sqlSession.selectList("ReviewAndQnaMapper.manageQnaSearch", input);

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

	/** 상품별 문의 수 조회(관리자용) */
	@Override
	public int getProductQnaCount(Qna input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ReviewAndQnaMapper.selectCountProductQna", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	/** 회원별 문의 수 조회(관리자용) */
	@Override
	public int getMemberQnaCount(Qna input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ReviewAndQnaMapper.selectCountMemberQna", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	/** 전체 문의 수 조회(관리자용) */
	@Override
	public int getQnaCount(Qna input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ReviewAndQnaMapper.selectCountQna", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/** 문의 작성 */
	@Override
	public int addQna(Qna input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("ReviewAndQnaMapper.addQna", input);
			if (result == 0) {
				throw new NullPointerException("result = 0");
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

	/** 문의 수정 */
	@Override
	public int editQna(Qna input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("ReviewAndQnaMapper.updateQna", input);
			if (result == 0) {
				throw new NullPointerException("result = 0");
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
	
	/** 문의 수정 */
	@Override
	public int editManageQna(Qna input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("ReviewAndQnaMapper.updateManageQna", input);
			if (result == 0) {
				throw new NullPointerException("result = 0");
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

	/** 문의 삭제 */
	@Override
	public int deleteQna(Qna input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("ReviewAndQnaMapper.deleteQna", input);
			if (result == 0) {
				throw new NullPointerException("result = 0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}

		return result;
	}
	
	/** 오늘 작성된 문의 수 확인(관리자용)*/
	@Override
	public int getNewQnaCount() throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ReviewAndQnaMapper.selectNewQnaCount");
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
