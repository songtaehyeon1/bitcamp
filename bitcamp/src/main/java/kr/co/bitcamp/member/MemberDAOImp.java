package kr.co.bitcamp.member;

public interface MemberDAOImp {
	//로그인 체크
	public MemberVO loginCheck(MemberVO vo);
	
	//아이디 찾기
	public MemberVO idFind(String username, String useremail);
	
	//비밀번호 찾기
	public MemberVO pwdFind(String username, String userid, String useremail);
	
	//회원가입_아이디 중복확인
	public int idCheck(String userid);
	
	//회원 등록
	public int memberInsert(MemberVO vo);
	
	//회원정보 수정_로그인 id의 비밀번호 확인
	public int pwdCheck(String userid, String userpwd);
	
	//회원정보 수정_로그인 id에 해당하는 회원정보 선택
	public MemberVO getMember(String userid); 
	
	//회원정보 수정
	public int memberUpdate(MemberVO vo);
}
