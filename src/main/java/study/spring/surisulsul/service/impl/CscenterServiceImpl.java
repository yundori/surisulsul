package study.spring.surisulsul.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.model.Cscenter;
import study.spring.surisulsul.service.CscenterService;

/** 공지사항과 FAQ 게시글을 관리하기 위한 기능을 제공하는 Service 계층에 대한 구현체 */

@Slf4j
@Service
public class CscenterServiceImpl implements CscenterService {

	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;

	/** 공지사항 목록 조회 */
	@Override
	public List<Cscenter> getNoticeList(Cscenter input) throws Exception {
		List<Cscenter> result = null;

		try {
			result = sqlSession.selectList("CscenterMapper.selectListNotice", input);

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

	/** FAQ 목록 조회 */
	@Override
	public List<Cscenter> getFaqList(Cscenter input) throws Exception {
		List<Cscenter> result = null;

		try {
			result = sqlSession.selectList("CscenterMapper.selectListFaq", input);

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
	
	/** 알립니다 & FAQ 목록 조회 -> 관리자 */
	@Override
	public List<Cscenter> getmanageList() throws Exception {
		List<Cscenter> result = null;

		try {
			result = sqlSession.selectList("CscenterMapper.selectListmanage");

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

	/** 공지사항/FAQ 게시글 작성 */
	@Override
	public int addCscenter(Cscenter input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("CscenterMapper.addCscenter", input);
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

	/** 공지사항/FAQ 게시글 수정 */
	@Override
	public int editCscenter(Cscenter input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("CscenterMapper.updateCscenter", input);
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

	/** 공지사항/FAQ 게시글 삭제 */
	@Override
	public int deleteCscenter(Cscenter input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("CscenterMapper.deleteCscenter", input);
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

}
