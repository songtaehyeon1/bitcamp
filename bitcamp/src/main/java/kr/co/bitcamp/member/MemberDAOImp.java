package kr.co.bitcamp.member;

public interface MemberDAOImp {
	//�α��� üũ
	public MemberVO loginCheck(MemberVO vo);
	
	//ȸ������_���̵� �ߺ�Ȯ��
	public int idCheck(String userid);
	
	//ȸ�� ���
	public int memberInsert(MemberVO vo);
}
