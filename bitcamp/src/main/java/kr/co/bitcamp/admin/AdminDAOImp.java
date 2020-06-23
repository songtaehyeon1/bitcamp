package kr.co.bitcamp.admin;

import java.util.List;

import kr.co.bitcamp.category.CategoryVO;

public interface AdminDAOImp {
	public List<CategoryVO> allCategorySelect();
	public int cntCategoryProduct(int c_no);
	public CategoryVO selectCategory(int c_no);
}
