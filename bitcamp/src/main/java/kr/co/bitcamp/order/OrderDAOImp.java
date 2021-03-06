package kr.co.bitcamp.order;

import java.util.ArrayList;

import kr.co.bitcamp.member.MemberVO;
import kr.co.bitcamp.product.ProductVO;

public interface OrderDAOImp {
	public ArrayList<Integer> allSelectProduct(int p_no);
	public ArrayList<String> allSelectDate(int s_no);
	
	
	public int order_info(OrderVO vo);//결제하기 완료 - 주문자정보 입력
	public int order_recipient(OrderVO vo);//결제하기 완료 - 배송지정보 입력
	public int ordertable(OrderVO vo);//오더테이블에 입력
	public int ordertable_nonmember(OrderVO vo);//오더테이블에 입력
	public int paymethod_card(OrderVO vo);//결제 방식-카드
	public int paymethod_cash(OrderVO vo);//결제 방식-무통장 입금
	public String orderNumber(OrderVO vo);//오더넘버 시퀀스 얻어오기..
	
	public int order_product(OrderVO vo);//주문번호에 담긴 상품번호,상품갯수 조회
	public int order_product_cart(ProductVO vo);//카트에서부터 상품 주문할때 상품번호,갯수
	public int reservate(ProductVO vo);//예약
	
	public int order_stock(ProductVO vo);//주문번호당 어떤 제품이 빠져나갔는지 알아야함.
	public int paymentInfoInsert(OrderVO vo);//카드결제시 정보 저장
	public MemberVO selectMember(int userno);//회원정보 당겨오기
	public OrderVO selectOrder(String username, String password, String o_no);
}
