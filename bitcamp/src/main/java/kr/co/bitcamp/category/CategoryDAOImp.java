package kr.co.bitcamp.category;

import java.util.List;

public interface CategoryDAOImp {
	//��� ī�װ� ����
	public List<CategoryVO> allCategorySelect();
	
	//ī�װ� 1�� ����
	public List<CategoryVO> CategorySelect(int c_no);
}
