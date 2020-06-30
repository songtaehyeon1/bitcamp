package kr.co.bitcamp.board;

import java.util.List;

public interface NoticeDAO {

	// notice 전체 리스트(검색, 페이징)
	public List<NoticeVO> allList(PagingVO pagevo);
	
	// notice 한개 리스트
	public NoticeVO list(int no);
	
	// notice 글 쓰기
	public int noticeInsert(NoticeVO vo);
	
	// notice 글 수정
	public int noticeUpdate(NoticeVO vo);
	
	// notice 글 삭제
	public int noticeDelete(int no);
	
	// notice 조회수
	public void noticeHit(int no);
	
	// notice 전체 페이지 구하기(검색)
	public int getTotalRecord(PagingVO pagevo);
	
	// notice 이전글 다음글
	public LeadLagVO getLeadLagSelect(PagingVO pagevo);
	
}
