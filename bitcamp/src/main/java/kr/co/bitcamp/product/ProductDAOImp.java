package kr.co.bitcamp.product;

import java.util.ArrayList;
import java.util.List;

public interface ProductDAOImp {
	//레코드 하나 선택해서 보기
	public ProductVO productView(int p_no);
	//전체 레코드 선택
	public List<ProductVO> ProductallSelectRecord();
	//관심상품 보기
	public List<ProductVO> selectInterest();
	//재고 보기
	public ProductVO productSelect(int p_no);
	
	public ArrayList<Integer> productAllSelectProduct(int p_no);
	
	public ArrayList<String> productAllSelectDate(Integer integer);
	
}
