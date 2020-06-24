package kr.co.bitcamp.admin;

import java.util.List;
import kr.co.bitcamp.category.CategoryVO;
import kr.co.bitcamp.product.ProductVO;

public interface AdminDAOImp {
	//�α���
	public AdminLoginVO adminLogin(AdminLoginVO vo);
	//ī�װ�
	public List<CategoryVO> allCategorySelect(); //���ī�װ� ����
	public int cntCategoryProduct(int c_no); // ī�װ��� ��ϵ� ��ǰ ����
	public CategoryVO selectCategory(int c_no); // ī�װ� �ϳ� ����
	public int updateCategory(CategoryVO vo); //ī�װ� ������Ʈ
	//��ǰ
	public List<ProductVO> allList(PagingVO pagevo);
	public List<ProductVO> allProductSelect(); //��� ��ǰ ����
	public int delimg(int p_no,String type);
	public int productEdit(ProductVO vo);
	public int productWrite(ProductVO vo);
	public ProductVO productSelect(int p_no);
	//����¡
	public int getTotalRecord(PagingVO vo);
	public LeadLagVO getLeadLagSelect(PagingVO pagevo);

	
	
}
