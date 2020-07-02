package kr.co.bitcamp.category;

import java.util.List;

import kr.co.bitcamp.product.ProductVO;

public interface CategoryDAOImp {
	//모든 카테고리 선택
	public List<CategoryVO> allCategorySelect();
	
	//모든 카테고리의 모든 상품 선택
	public List<ProductVO> allProductSelect(String sort);
	
	//카테고리 1개 선택
	public List<ProductVO> productSelect(int c_no, String sort);

	//관심상품 리스트 구하기
	public List<Integer> allHearts(String userno);
	
	//관심상품 추가
	public int addInterest(InterestVO vo);	
	
	//관싱상품 삭제
	public int delInterest(InterestVO vo);	
}
