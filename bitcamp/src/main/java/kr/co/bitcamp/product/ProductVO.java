package kr.co.bitcamp.product;

import java.util.ArrayList;

public class ProductVO {
	private int c_no;//카테고리 번호
	private String c_name;//카테고리 이름
	private int p_no;//상품코드
	private int userno;//유저번호
	private String p_name;//상품명
	private int price;//가격	
	private int delivery_fee;//배송비
	private String p_commnet;//상품설명
	private String p_filename1;//상품사진1
	private String p_filename2;//상품사진2
	private String p_filename3;//상품사진3
	private String p_filename4;//상품사진4
	private String p_filename5;//상품사진5
	private String orderStart;//주문 시작일
	private String orderEnd;//주문 마감일
	private String product_borrow_period;//대여기간
	private int currentQty;//바로구매할때 선택하는 상품 갯수
	private int productCount;//관심상품 갯수
	private int limitQuantity;//제품 최대 대여 가능 갯수
	
	private ArrayList<Integer> s_noList;//상세 재고들
	private String p_date;
	private int rownum;
	
	//////////////////////////
	private String period;
	private String total_price;
	private String pickup;
	//////////////////////////
	private String p_deltype;
	
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDelivery_fee() {
		return delivery_fee;
	}
	public void setDelivery_fee(int delivery_fee) {
		this.delivery_fee = delivery_fee;
	}
	public String getP_commnet() {
		return p_commnet;
	}
	public void setP_commnet(String p_commnet) {
		this.p_commnet = p_commnet;
	}
	public String getP_filename1() {
		return p_filename1;
	}
	public void setP_filename1(String p_filename1) {
		this.p_filename1 = p_filename1;
	}
	public String getP_filename2() {
		return p_filename2;
	}
	public void setP_filename2(String p_filename2) {
		this.p_filename2 = p_filename2;
	}
	public String getP_filename3() {
		return p_filename3;
	}
	public void setP_filename3(String p_filename3) {
		this.p_filename3 = p_filename3;
	}
	public String getP_filename4() {
		return p_filename4;
	}
	public void setP_filename4(String p_filename4) {
		this.p_filename4 = p_filename4;
	}
	public String getP_filename5() {
		return p_filename5;
	}
	public void setP_filename5(String p_filename5) {
		this.p_filename5 = p_filename5;
	}
	public String getOrderStart() {
		return orderStart;
	}
	public void setOrderStart(String orderStart) {
		this.orderStart = orderStart;
	}
	public String getOrderEnd() {
		return orderEnd;
	}
	public void setOrderEnd(String orderEnd) {
		this.orderEnd = orderEnd;
	}
	public int getProductCount() {
		return productCount;
	}
	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	public ArrayList<Integer> getS_noList() {
		return s_noList;
	}
	public void setS_noList(ArrayList<Integer> s_noList) {
		this.s_noList = s_noList;
	}
	public String getProduct_borrow_period() {
		return product_borrow_period;
	}
	public void setProduct_borrow_period(String product_borrow_period) {
		this.product_borrow_period = product_borrow_period;
	}
	public int getCurrentQty() {
		return currentQty;
	}
	public void setCurrentQty(int currentQty) {
		this.currentQty = currentQty;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String orderStart,String orderEnd,String borrowPeriod) {
		this.period = orderStart+"~"+orderEnd+"("+(Integer.parseInt(borrowPeriod)-1)+"박"+borrowPeriod+"일)";
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int delivery_fee,int price) {
		this.total_price = Integer.toString(delivery_fee+price);
	}
	public String getPickup() {
		return pickup;
	}
	public void setPickup(String pickup) {
		pickup = "방문 수령";
		this.pickup = pickup;
	}
	public String getP_deltype() {
		return p_deltype;
	}
	public void setP_deltype(String p_deltype) {
		this.p_deltype = p_deltype;
	}
	public int getLimitQuantity() {
		return limitQuantity;
	}
	public void setLimitQuantity(int limitQuantity) {
		this.limitQuantity = limitQuantity;
	}
	
}
