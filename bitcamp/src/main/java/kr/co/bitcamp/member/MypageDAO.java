package kr.co.bitcamp.member;

import java.util.List;

import kr.co.bitcamp.board.EnquiryVO;
import kr.co.bitcamp.board.ReviewVO;
import kr.co.bitcamp.order.OrderVO;

public interface MypageDAO {
	
	// 마이페이지 리스트 =========================================================================== 마이페이지
	public MypageVO mypageTopList(int userno);
	public int mypageMileageOne(int userno);
	public String delivery_before(int userno);
	public String delivery_pay_com(int userno);
	public String delivery_ship_pro(int userno);
	public String delivery_com(int userno);
	public String delivery_cancel(int userno);
	public String delivery_return(int userno);
	
	
	
	

	// 배송지 등록 ================================================================================== 배송지
	public int shippingInsert(MypageVO vo);
	
	// 배송지 리스트 가져오기
	public List<MypageVO> shippingList(int userno);
	
	// 배송지 모두 선택 해제, 하나 선택
	public void shippingRelease(int userno);
	public void shippingSelect(int rno);
	
	// 배송지 수정 정보 가져오기
	public MypageVO shippingEditList(int rno);
	
	// 배송지 수정
	public int shippingEdit(MypageVO vo);
	
	// 배송지 삭제
	public int shippingDelete(int rno);
	
	// 게시물 가져오기 =========================================================================== 게시물 관리
	public List<EnquiryVO> mypageBoardEnquiry(int userno);
	public List<ReviewVO> mypageBoardReview(int userno);
	
	
	
	
	
	
	// 주문조회 정보 가져오기(검색) ====================================================================== 주문조회
	public List<MypageOrderVO> mypageOrderList(int userno);
	public List<MypageOrderVO> mypageOrderList(int userno, String delivery_status, String order_date_start, String order_date_end);
	
	// 주문조회 하나 정보 가져오기
	public OrderVO selectOrder(String o_no);
	
	// 주문 수정
	public int mypageOrderEdit(OrderVO vo);
	public int updateInvoice(String o_no,String delivery_code,String delivery_date,String delivery_arrival_date);
	
	
	
	
	
	// 관심상품 가져오기 ===============================================================================관심상품
	public List<MypageWishListVO> mypageWishLists(int userno);
	
	// 관심상품 삭제
	public int mypageWishListDel(int userno, int p_no);
}
