package study.spring.surisulsul.service;

import java.util.List;
import study.spring.surisulsul.model.Member;

public interface MemberService {

	// 세션 정보를 받아 회원정보 조회(마이페이지 등)
	public Member getMemberItem(Member input) throws Exception;

	// 이메일 찾기를 위한 조회
	public Member getMemberEmail(Member input) throws Exception;

	// 로그인을 위한 회원정보 조회
	public Member getMemberLogin(Member input) throws Exception;
	
	// 회원 목록 조회 (관리자용)
	public List<Member> getMemberList(Member input) throws Exception;
	
	// 회원가입
	public int addMember(Member input) throws Exception;
	
	// 회원정보 수정 및 비밀번호 재발급
	public int editMember(Member input) throws Exception;
	
	// 탈퇴한 회원의 데이터 삭제
	public int deleteMember(Member input) throws Exception;
	
	// 중복 이메일 조회
	public int getJoinEmailCount(Member input) throws Exception;
	
	// 비밀번호 확인용 조회
	public Member getChkPw(Member input) throws Exception;
	
	// 비밀번호 찾기용 조회
	public int getPasswordCount(Member input) throws Exception;
	
	// 로그인 시 이메일 체크용 조회
	public int getLoginEmailCount(Member input) throws Exception;
	
	//주능 회원정보 수정
	public int editJnMember(Member input) throws Exception;
	
	//회원 탈퇴
	public int outMember(Member input) throws Exception;
}
