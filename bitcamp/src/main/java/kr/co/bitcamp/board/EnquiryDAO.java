package kr.co.bitcamp.board;

import java.util.List;

public interface EnquiryDAO {

	// enquiry 전체 리스트(검색, 페이징)
	public List<EnquiryVO> allList(PagingVO pagevo);
	
	// enquiry 한개 리스트
	public EnquiryVO list(int no);
	
	// enquiry 한개 리스트 상품(상품이름, 사진 , 가격)
	public EnquiryVO listGoods(int p_no, String c_no);
	
	// enquiry 한개 리스트의 댓글 가져오기
	public List<ReplyVO> replyAll(int no);
	
	// enquiry 한개 리스트의 댓글 달기
	public int replyWrite(int userno, int enquiry_no, String e_reply_content);
	
	// enquiry 댓글 한개 가져오기
	public ReplyVO replyOne(int no);
	
	// enquiry 댓글 수정
	public void replyUpdate(int e_reply_no, String e_reply_content);
	
	// enquiry 댓글 삭제
	public void replyDel(int e_reply_no);
	
	// enquiry 글 쓰기
	public int enquiryInsert(EnquiryVO vo);
	
	// enquiry 글 쓰기 상품들 가져오기
	public List<GoodsVO> enquiryCategory();
	public List<GoodsVO> enquiryGoods(String cate);
	
	// enquiry 글 수정
	public int enquiryUpdate(EnquiryVO vo);
	
	// enquiry 글 수정 카테고리 가져오기
	public String enquiryUpdateCate(int no);
	
	// enquiry 글 수정 상품 가져오기
	public List<GoodsVO> enquiryUpdateGoods(String c_no);
	
	// enquiry 글 삭제
	public int enquiryDelete(int no);
	
	// enquiry 조회수
	public void enquiryHit(int no);
	
	// enquiry 전체 페이지 수(검색)
	public int getTotalRecord(PagingVO pagevo);
	
	// enquiry 이전글 다음글
	public LeadLagVO getLeadLagSelect(PagingVO pagevo);
	
}
