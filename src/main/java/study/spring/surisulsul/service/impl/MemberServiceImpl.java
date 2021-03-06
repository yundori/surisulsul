package study.spring.surisulsul.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.model.Member;
import study.spring.surisulsul.service.MemberService;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;

	/** 회원 정보 조회 (단일) **/
	@Override
	public Member getMemberItem(Member input) throws Exception {
		Member result = null;

		try {
			result = sqlSession.selectOne("MemberMapper.selectMember", input);

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

	/** 이메일 찾기 시 회원 정보 조회 */
	@Override
	public Member getMemberEmail(Member input) throws Exception {
		Member result = null;

		try {
			result = sqlSession.selectOne("MemberMapper.findEmail", input);

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

	/** 로그인 시 회원 정보 조회 */
	@Override
	public Member getMemberLogin(Member input) throws Exception {
		Member result = null;

		try {
			result = sqlSession.selectOne("MemberMapper.loginMember", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("로그인에 실패했습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	/** 로그인 일시를 회원 정보에 업데이트 */
	@Override
	public Member editMemberLogin(Member input) throws Exception {
		Member result = null;

		try {
			sqlSession.update("MemberMapper.loginEditMember", input);
			result = input;
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("로그인 일시 기록에 실패했습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}

		return result;
	}

	/** 회원 목록 조회 (관리자용) */
	@Override
	public List<Member> getMemberList(Member input) throws Exception {
		List<Member> result = null;

		try {
			result = sqlSession.selectList("MemberMapper.selectList", input);

			if (result.isEmpty()) {
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

	/** 회원가입 */
	@Override
	public int addMember(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("MemberMapper.addMember", input);
			if (result == 0) {
				throw new NullPointerException("result = 0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원가입이 완료되지 않았습니다. 다시 수행해 주세요.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원가입에 실패했습니다.");
		}
		return result;
	}
	
	/** 회원가입 시 나이 검사 */
	@Override
	public int chkAge(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MemberMapper.chkAge", input);
		}  catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("회원가입에 실패했습니다.");
		}
		return result;
	}

	/** 회원정보 수정 및 비밀번호 재발급 */
	@Override
	public int editMember(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("MemberMapper.updateMember", input);
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

	/** 탈퇴한 회원의 데이터 삭제 */
	@Override
	public int deleteMember(Member input) throws Exception {
		int result = 0;

		try {
			// 회원 정보 삭제 전, 회원 정보를 참조하고 있는 데이터들의 삭제가 선행되어야 함
			// sqlSession.update("basketMapper.unsetProfessor",input);
			result = sqlSession.delete("MemberMapper.deleteMember", input);
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

	/** 중복 이메일 조회 */
	@Override
	public int getJoinEmailCount(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MemberMapper.chkEmailJoin", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	/** 비밀번호 확인용 조회 */
	@Override
	public Member getChkPw(Member input) throws Exception {
		Member result = null;

		try {
			result = sqlSession.selectOne("MemberMapper.chkPw", input);
			
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

	/** 비밀번호 찾기용 조회 */
	@Override
	public int getPasswordCount(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MemberMapper.findPwCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	/** 비밀번호 재발급에 필요한 회원 정보 조회 (단일) **/
	@Override
	public Member getPasswordMember(Member input) throws Exception {
		Member result = null;

		try {
			result = sqlSession.selectOne("MemberMapper.findPwMember", input);

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

	/** 로그인 시 이메일 체크용 조회 */
	@Override
	public int getLoginEmailCount(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MemberMapper.chkEmailLogin", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	/** 주능 회원정보 수정*/
	@Override
	public int editJnMember(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("MemberMapper.updateJnMember", input);
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
	
	/** 탈퇴 회원 is_out 정보 수정*/
	@Override
	public int outMember(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("MemberMapper.outMember", input);
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
	/** 회원 수 조회(관리자용)*/
	@Override
	public int getMemberCount(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MemberMapper.countMembers", input);

			if (result == 0) {
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
	/** 탈퇴 회원 수 조회(관리자용)*/
	@Override
	public int getOutMemberCount(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MemberMapper.countOutMembers", input);

			if (result == 0) {
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
	/** 탈퇴 회원 목록 조회(관리자용)*/
	@Override
	public List<Member> getOutMemberList(Member input) throws Exception {
		List<Member> result = null;

		try {
			result = sqlSession.selectList("MemberMapper.selectOutList", input);

			if (result.isEmpty()) {
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
	/** 회원정보 수정 (관리자용) - 암호 유지*/
	@Override
	public int editMemberAll(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("MemberMapper.updateMemberByManager", input);
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
	
	/** 회원정보 수정 (관리자용) - 암호 수정*/
	@Override
	public int editMemberPwAll(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("MemberMapper.updateMemberPwByManager", input);
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
	
	/** 오늘 가입 회원 수 조회(관리자용)*/
	@Override
	public int getMemberInTodayCount() throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MemberMapper.countInMembersToday");

			if (result == 0) {
				throw new NullPointerException("result=null");
			}
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	/** 오늘 탈퇴 회원 수 조회(관리자용)*/
	@Override
	public int getMemberOutTodayCount() throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MemberMapper.countOutMembersToday");

			if (result == 0) {
				throw new NullPointerException("result=null");
			}
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
}
