package kr.co.bitcamp.admin;

import java.util.List;
import kr.co.bitcamp.category.CategoryVO;
import kr.co.bitcamp.member.MemberVO;
import kr.co.bitcamp.member.WithdrawalVO;
import kr.co.bitcamp.product.ProductVO;

public interface AdminDAOImp {
	//�α���
	public AdminLoginVO adminLogin(AdminLoginVO vo);
	//ȸ��
	public List<MemberVO> allMemberList(PagingVO pagevo);
	public List<WithdrawalVO> allWithdrawalList(PagingVO pagevo);
	public int delMember(int userno);
	public MemberVO selectMember(int userno);
	public int insertMemberDel(MemberVO vo);
	//ī�װ�
	public List<CategoryVO> allCategorySelect(); //���ī�װ� ����
	public int cntCategoryProduct(int c_no); // ī�װ��� ��ϵ� ��ǰ ����
	public CategoryVO selectCategory(int c_no); // ī�װ� �ϳ� ����
	public int updateCategory(CategoryVO vo); //ī�װ� ������Ʈ
	//��ǰ
	public List<ProductVO> allList(PagingVO pagevo);
	public List<StockVO> allStockList(PagingVO pagevo);
	public List<Integer> allSelectProduct(int p_no);
	public List<String> allSelectDate(int s_no);
	public StockVO selectStock(int s_no);
	public int getsno_sq();
	public int addStock(int p_no, String note);
	public List<ProductVO> allProductSelect(); //��� ��ǰ ����
	public int delimg(int p_no,String type);
	public int productEdit(ProductVO vo);
	public int productWrite(ProductVO vo);
	public ProductVO productSelect(int p_no);
	public int delstock(int s_no);
	public int restoreStock(int s_no);
	//����¡
	public int getTotalRecord(PagingVO vo);
	public int getTotalMemberRecord(PagingVO vo);
	public int getTotalWithdrawalRecord(PagingVO vo);
	public int getTotalStockRecord(PagingVO vo);	
	public LeadLagVO getLeadLagSelect(PagingVO pagevo);
	
	
}
