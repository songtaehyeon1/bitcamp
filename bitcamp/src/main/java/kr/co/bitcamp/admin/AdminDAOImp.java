package kr.co.bitcamp.admin;

import java.util.ArrayList;
import java.util.List;
import kr.co.bitcamp.category.CategoryVO;
import kr.co.bitcamp.member.MemberVO;
import kr.co.bitcamp.member.WithdrawalVO;
import kr.co.bitcamp.order.OrderVO;
import kr.co.bitcamp.product.ProductVO;

public interface AdminDAOImp {
	//�α���
	public AdminLoginVO adminLogin(AdminLoginVO vo);
	//Ȩ
	public int totalboardcnt();
	public int todayboardcnt();
	public int todayreplycnt();
	public int todayMembercnt();
	public int totalMembercnt();
	public int todayWithdrawalcnt();
	public int totalOrdercnt();
	public int todayOrdercnt();
	public int todayreturncnt();
	public int todayCancelcnt();
	// ������
	public int todayAccessor();
	public int yesterdayAccessor();
	public int totalAccessor();
	//�⺻����
	public BasicinfoVO basicinfoselect();
	public int basicinfoupdate(BasicinfoVO vo);
	//ȸ��
	public List<MemberVO> allMemberList(PagingVO pagevo);
	public List<WithdrawalVO> allWithdrawalList(PagingVO pagevo);
	public int delMember(int userno);
	public MemberVO selectMember(int userno);
	public int insertMemberDel(MemberVO vo);
	public int memberEdit(MemberVO vo);
	public int delMemberTodelList(int userno);
	public int updateMemberDelType(int userno);
	//ī�װ�
	public List<CategoryVO> adminallCategorySelect(); //���ī�װ� ����
	public int cntCategoryProduct(int c_no); // ī�װ��� ��ϵ� ��ǰ ����
	public CategoryVO adminselectCategory(int c_no); // ī�װ� �ϳ� ����
	public int adminupdateCategory(CategoryVO vo); //ī�װ� ������Ʈ
	
	//��ǰ
	public List<ProductVO> allpList(PagingVO pagevo);
	public List<StockVO> allStockList(PagingVO pagevo);
	public List<Integer> adminallSelectProduct(int p_no);
	public List<String> adminallSelectDate(int s_no);
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
	public List<ProductVO> getmainproduct();
	//�ֹ�
	public List<OrderVO> allOrderSelect(PagingVO pagevo);
	public OrderVO selectAdminOrder(String o_no);
	public List<OrderVO> orderProductList(String o_no);
	public int orderEdit(OrderVO vo);
	public int orderPayEdit(OrderVO vo);
	public int updateadminInvoice(String o_no,String delivery_code,String delivery_date,String delivery_arrival_date);
	public int allD_statusUpdate(String o_no, String statch);
	public int allD_statuscancel(String o_no, String statch);
	public int allD_statusreturn(String o_no, String statch);
	public List<OrderVO> allOrderCancelSelect(PagingVO pagevo);
	public List<OrderVO> allOrderReturnSelect(PagingVO pagevo);
	//����¡
	public int getTotalRecord(PagingVO vo);
	public int getTotalMemberRecord(PagingVO vo);
	public int getTotalWithdrawalRecord(PagingVO vo);
	public int getTotalStockRecord(PagingVO vo);	
	public LeadLagVO getLeadLagSelect(PagingVO pagevo);
	public int getOrderTotalRecord(PagingVO vo);
	public int getOrderCancelTotalRecord(PagingVO vo);
	public int getOrderReturnTotalRecord(PagingVO vo);
	//����
	public String getTodayTotalCard(String date);
	public String getTodayTotalCash(String date);
	public String getTodayTotalsale(String date);
	public ArrayList<TotalVO> total_list(DateData dateData);
}
