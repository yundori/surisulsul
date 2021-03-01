package study.spring.surisulsul.service;

import java.util.List;

import study.spring.surisulsul.model.Qna;
import study.spring.surisulsul.model.Review;

public interface ReviewAndQnaService {
	
	// 단일 리뷰 조회
	public Review getReviewItem(Review input) throws Exception;

	// 상품별 리뷰 목록 조회
	public List<Review> getProductReviewList(Review input) throws Exception;

	// 회원별 리뷰 목록 조회
	public List<Review> getMemberReviewList(Review input) throws Exception;
	
	// 리뷰 목록 조회 (검색어 있음, 관리자용)
	public List<Review> getManageReview(Review input) throws Exception;

	// 상품별 리뷰 수 조회
	public int getProductReviewCount(Review input) throws Exception;
	
	// 상품별 별점 총합 조회
	public int getProductReviewStar(Review input) throws Exception;
	
	// 리뷰 수 조회
	public int getReviewCount(Review input) throws Exception;

	// 리뷰 작성
	public int addReview(Review input) throws Exception;

	// 리뷰 수정
	public int editReview(Review input) throws Exception;

	// 리뷰 삭제
	public int deleteReview(Review input) throws Exception;
	
	// 단일 문의 조회
	public Qna getQnaItem(Qna input) throws Exception;

	// 상품별 문의 목록 조회
	public List<Qna> getProductQnaList(Qna input) throws Exception;

	// 회원별 문의 목록 조회
	public List<Qna> getMemberQnaList(Qna input) throws Exception;
	
	// 문의 목록 조회 (검색어 있음, 관리자용)
	public List<Qna> getManageQna(Qna input) throws Exception;

	// 상품별 문의 수 조회
	public int getProductQnaCount(Qna input) throws Exception;
	
	// 회원별 문의 수 조회
	public int getMemberQnaCount(Qna input) throws Exception;
	
	// 오늘 작성된 문의 수 조회(관리자용)
	public int getNewQnaCount() throws Exception;
	
	// 문의 수 조회
	public int getQnaCount(Qna input) throws Exception;

	// 문의 작성
	public int addQna(Qna input) throws Exception;

	// 문의 수정
	public int editQna(Qna input) throws Exception;

	// 문의 삭제
	public int deleteQna(Qna input) throws Exception;
}
