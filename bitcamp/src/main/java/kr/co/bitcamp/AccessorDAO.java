package kr.co.bitcamp;

public interface AccessorDAO {

	// 접속한 ip 확인
	public int accessorIpCheck(String ip);
	
	// 접속한 ip 삽입
	public int accessorIpInsert(String ip);
	
}
