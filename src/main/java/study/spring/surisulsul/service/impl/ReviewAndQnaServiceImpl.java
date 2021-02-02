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
	
	@Override
	public List<Review> getProductReviewList(Review input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> getMemberReviewList(Review input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getReviewCount(Review input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addReview(Review input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editReview(Review input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(Review input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Qna> getProductQnaList(Qna input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Qna> getMemberQnaList(Qna input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getQnaCount(Qna input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addQna(Qna input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editQna(Qna input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteQna(Qna input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
