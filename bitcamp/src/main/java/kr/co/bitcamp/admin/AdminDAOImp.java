package kr.co.bitcamp.admin;

import java.util.ArrayList;
import java.util.List;
import kr.co.bitcamp.category.CategoryVO;
import kr.co.bitcamp.member.MemberVO;
import kr.co.bitcamp.member.WithdrawalVO;
import kr.co.bitcamp.order.OrderVO;
import kr.co.bitcamp.product.ProductVO;

public interface AdminDAOImp {
	//로그인
	public AdminLoginVO adminLogin(AdminLoginVO vo);
	//홈
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
	// 접속자
	public int todayAccessor();
	public int yesterdayAccessor();
	public int totalAccessor();
	//기본정보
	public BasicinfoVO basicinfoselect();
	public int basicinfoupdate(BasicinfoVO vo);
	//회원
	public List<MemberVO> allMemberList(PagingVO pagevo);
	public List<WithdrawalVO> allWithdrawalList(PagingVO pagevo);
	public int delMember(int userno);
	public MemberVO selectMember(int userno);
	public int insertMemberDel(MemberVO vo);
	public int memberEdit(MemberVO vo);
	public int delMemberTodelList(int userno);
	public int updateMemberDelType(int userno);
	//카테고리
	public List<CategoryVO> adminallCategorySelect(); //모든카테고리 선택
	public int cntCategoryProduct(int c_no); // 카테고리의 등록된 상품 갯수
	public CategoryVO adminselectCategory(int c_no); // 카테고리 하나 선택
	public int adminupdateCategory(CategoryVO vo); //카테고리 업데이트
	
	//상품
	public List<ProductVO> allpList(PagingVO pagevo);
	public List<StockVO> allStockList(PagingVO pagevo);
	public List<Integer> adminallSelectProduct(int p_no);
	public List<String> adminallSelectDate(int s_no);
	public StockVO selectStock(int s_no);
	public int getsno_sq();
	public int addStock(int p_no, String note);
	public List<ProductVO> allProductSelect(); //모든 상품 선택
	public int delimg(int p_no,String type);
	public int productEdit(ProductVO vo);
	public int productWrite(ProductVO vo);
	public ProductVO productSelect(int p_no);
	public int delstock(int s_no);
	public int restoreStock(int s_no);
	public List<ProductVO> getmainproduct();
	//주문
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
	//페이징
	public int getTotalRecord(PagingVO vo);
	public int getTotalMemberRecord(PagingVO vo);
	public int getTotalWithdrawalRecord(PagingVO vo);
	public int getTotalStockRecord(PagingVO vo);	
	public LeadLagVO getLeadLagSelect(PagingVO pagevo);
	public int getOrderTotalRecord(PagingVO vo);
	public int getOrderCancelTotalRecord(PagingVO vo);
	public int getOrderReturnTotalRecord(PagingVO vo);
	//매출
	public String getTodayTotalCard(String date);
	public String getTodayTotalCash(String date);
	public String getTodayTotalsale(String date);
	public ArrayList<TotalVO> total_list(DateData dateData);
}
