package kr.co.bitcamp.board;

import java.util.List;

public interface ReviewDAO {

	// 전체 리스트
	public List<ReviewVO> allList(PagingVO pagevo);
	
	// review 전체 페이지 수(검색)
	public int getTotalRecord(PagingVO pagevo);
	
}
