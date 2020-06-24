package kr.co.bitcamp.member;

public interface MemberDAOImp {
	//�α��� üũ
	public MemberVO loginCheck(MemberVO vo);
	
	//���̵� ã��
	public MemberVO idFind(String username, String useremail);
	
	//��й�ȣ ã��
	public MemberVO pwdFind(String username, String userid, String useremail);
	
	//ȸ������_���̵� �ߺ�Ȯ��
	public int idCheck(String userid);
	
	//ȸ�� ���
	public int memberInsert(MemberVO vo);
	
	//ȸ������ ����_�α��� id�� ��й�ȣ Ȯ��
	public int pwdCheck(String userid, String userpwd);
	
	//ȸ������ ����_�α��� id�� �ش��ϴ� ȸ������ ����
	public MemberVO getMember(String userid); 
	
	//ȸ������ ����
	public int memberUpdate(MemberVO vo);
}
