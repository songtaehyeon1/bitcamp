package kr.co.bitcamp.member;

public interface MemberDAOImp {
	//로그인 체크
	public MemberVO loginCheck(MemberVO vo);
	
	//회원가입_아이디 중복확인
	public int idCheck(String userid);
	
	//회원 등록
	public int memberInsert(MemberVO vo);
}
