package kr.co.bitcamp.product;

import java.util.List;

public interface ProductDAOImp {
	//레코드 추가
	public int productWrite(ProductVO vo);
	//레코드 수정
	public int productUpdate(int no);
	//레코드 삭제
	public int productDelete(int no);
	//레코드 하나 선택해서 보기
	public ProductVO productView(int p_no);
	//전체 레코드 선택
	public List<ProductVO> allSelectRecord();
	
}
