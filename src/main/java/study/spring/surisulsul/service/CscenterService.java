package study.spring.surisulsul.service;

import java.util.List;

import study.spring.surisulsul.model.Cscenter;

public interface CscenterService {
	
	// 공지사항 목록 조회
	public List<Cscenter> getNoticeList(Cscenter input) throws Exception;
	
	// FAQ 목록 조회
	public List<Cscenter> getFaqList(Cscenter input) throws Exception;

	// 공지사항/FAQ 작성
	public int addCscenter(Cscenter input) throws Exception;

	// 공지사항/FAQ 수정
	public int editCscenter(Cscenter input) throws Exception;

	// 공지사항/FAQ 삭제
	public int deleteCscenter(Cscenter input) throws Exception;
}
