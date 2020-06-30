package kr.co.bitcamp.board;

import java.util.List;


public interface ReviewDAO {

	// 전체 리스트
	public List<ReviewVO> allList(PagingVO pagevo);
	
	// review 전체 페이지 수(검색)
	public int getTotalRecord(PagingVO pagevo);
	
	// review 전체 리스트에 상품사진, 이름
	public List<GoodsVO> allGoods();
	
	// review 글 쓰기 폼 카테고리
	public List<GoodsVO> reviewCate();
	
	// review 글 쓰기 폼 상품 가져오기
	public List<GoodsVO> reviewGoods(int cate);
	
	// review 글 쓰기
	public int reviewInsert(ReviewVO vo);
	
	// review 한개 리스트
	public ReviewVO list(int no);
	
	// review 조회수
	public void reviewHit(int no);
	
	// enquiry 글 쓰기 상품들 가져오기
	public List<GoodsVO> reviewCategory();
	public List<GoodsVO> reviewGoods(String cate);
	
	// review 글 수정
	public int reviewUpdate(ReviewVO vo);
	
	// review 글 수정폼에서 파일 삭제
	public void reviewEditFileDel(String fileid, int no);
	
	// review 글 삭제
	public int listDelete(int no);
	
	// review 글 삭제 시 댓글도 삭제
	public void reviewReplyDelete(int no);
	
	// review 글 삭제 파일들 가져오기
	public ReviewVO listDelete_files(int no);
	
	// review 댓글 가져오기
	public List<ReviewReplyVO> replyAll(int no);
	
	// review 댓글 작성
	public int replyWrite(int userno, int review_no, String r_reply_content);
	
	// review 댓글 삭제
	public void replyDel(int r_reply_no);
	
	// review 댓글 수정 폼
	public ReviewReplyVO replyOne(int r_reply_no);
	
	// review 댓글 수정
	public void replyUpdate(int r_reply_no, String r_reply_content);
	
	// review 이전글 다음글
	public LeadLagVO getLeadLagSelect(PagingVO pagevo);
	
	// review 추천 수 ip검색하기
	public int reviewRecommendIp(int review_no, String ip);
	
	// review 추천 수 올리기
	public int reviewRecommendUpdate(int review_no);
	
	// review 추천 ip저장
	public int reviewRecommendIpUpdate(int review_no, String ip);
	
	// review 추천 수 가져오기
	public int reviewRecommendSelect(int review_no);
	
}
