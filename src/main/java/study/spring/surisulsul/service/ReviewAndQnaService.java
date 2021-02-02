package study.spring.surisulsul.service;

import java.util.List;

import study.spring.surisulsul.model.Qna;
import study.spring.surisulsul.model.Review;

public interface ReviewAndQnaService {

	// 상품별 리뷰 목록 조회
	public List<Review> getProductReviewList(Review input) throws Exception;

	// 회원별 리뷰 목록 조회
	public List<Review> getMemberReviewList(Review input) throws Exception;

	// 상품별 리뷰 수 조회
	public int getReviewCount(Review input) throws Exception;

	// 리뷰 작성
	public int addReview(Review input) throws Exception;

	// 리뷰 수정
	public int editReview(Review input) throws Exception;

	// 리뷰 삭제
	public int deleteReview(Review input) throws Exception;

	// 상품별 문의 목록 조회
	public List<Qna> getProductQnaList(Qna input) throws Exception;

	// 회원별 문의 목록 조회
	public List<Qna> getMemberQnaList(Qna input) throws Exception;

	// 상품별 문의 수 조회
	public int getQnaCount(Qna input) throws Exception;

	// 문의 작성
	public int addQna(Qna input) throws Exception;

	// 문의 수정
	public int editQna(Qna input) throws Exception;

	// 문의 삭제
	public int deleteQna(Qna input) throws Exception;
}
