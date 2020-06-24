package kr.co.bitcamp.admin;

import java.util.List;
import kr.co.bitcamp.category.CategoryVO;
import kr.co.bitcamp.product.ProductVO;

public interface AdminDAOImp {
	//로그인
	public AdminLoginVO adminLogin(AdminLoginVO vo);
	//카테고리
	public List<CategoryVO> allCategorySelect(); //모든카테고리 선택
	public int cntCategoryProduct(int c_no); // 카테고리의 등록된 상품 갯수
	public CategoryVO selectCategory(int c_no); // 카테고리 하나 선택
	public int updateCategory(CategoryVO vo); //카테고리 업데이트
	//상품
	public List<ProductVO> allList(PagingVO pagevo);
	public List<ProductVO> allProductSelect(); //모든 상품 선택
	public int delimg(int p_no,String type);
	public int productEdit(ProductVO vo);
	public int productWrite(ProductVO vo);
	public ProductVO productSelect(int p_no);
	//페이징
	public int getTotalRecord(PagingVO vo);
	public LeadLagVO getLeadLagSelect(PagingVO pagevo);

	
	
}
