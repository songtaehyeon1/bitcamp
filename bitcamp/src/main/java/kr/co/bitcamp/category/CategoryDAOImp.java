package kr.co.bitcamp.category;

import java.util.List;

public interface CategoryDAOImp {
	//모든 카테고리 선택
	public List<CategoryVO> allCategorySelect();
	
	//카테고리 1개 선택
	public List<CategoryVO> CategorySelect(int c_no);
}
