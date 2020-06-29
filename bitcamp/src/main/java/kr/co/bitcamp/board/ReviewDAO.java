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
	
}
