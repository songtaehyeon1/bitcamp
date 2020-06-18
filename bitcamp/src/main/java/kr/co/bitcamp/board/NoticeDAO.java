package kr.co.bitcamp.board;

import java.util.List;

public interface NoticeDAO {

	// notice 전체 리스트
	public List<NoticeVO> allList(PagingVO pagevo);
	
	// notice 한개 리스트
	public NoticeVO list(int no);
	
	// notice 삽입
	public int noticeInsert(NoticeVO vo);
	
	// notice 수정
	public int noticeUpdate(NoticeVO vo);
	
	// notice 삭제
	public int noticeDelete(int no);
	
	// notice 조회수
	public void noticeHit(int no);
	
	// notice 검색
	/*public List<NoticeVO> noticeSearch(String search, String str);*/
	
	// notice 페이징
	public int getTotalRecord(PagingVO pagevo);
	
}
