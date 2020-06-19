package kr.co.bitcamp.board;

import java.util.List;

public interface EnquiryDAO {

	// enquiry 전체 리스트(검색, 페이징)
	public List<EnquiryVO> allList(PagingVO pagevo);
	
	// enquiry 한개 리스트
	public EnquiryVO list(int no);
	
	// enquiry 글 쓰기
	public int enquiryInsert(EnquiryVO vo);
	
	// enquiry 상품들 가져오기
	public List<GoodsVO> enquiryCategory();
	public List<GoodsVO> enquiryGoods(String cate);
	
	// enquiry 글 수정
	public int enquiryUpdate(EnquiryVO vo);
	
	// enquiry 글 삭제
	public int enquiryDelete(int no);
	
	// enquiry 조회수
	public void enquiryHit(int no);
	
	// enquiry 전체 페이지 구하기(검색)
	public int getTotalRecord(PagingVO pagevo);
	
	// enquiry 이전글 다음글
	public LeadLagVO getLeadLagSelect(PagingVO pagevo);
	
}
