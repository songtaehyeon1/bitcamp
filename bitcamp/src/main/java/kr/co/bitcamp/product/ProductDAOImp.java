package kr.co.bitcamp.product;

import java.util.ArrayList;
import java.util.List;

public interface ProductDAOImp {

	public ProductVO productView(int p_no);
	
	public List<ProductVO> ProductallSelectRecord();

	public List<ProductVO> selectInterest();

	public ProductVO productSelect(int p_no);
	
	public ArrayList<Integer> productAllSelectProduct(int p_no);
	
	public ArrayList<String> productAllSelectDate(Integer integer);
	
}
