package kr.co.bitcamp.product;

import java.util.ArrayList;

public class ProductVO {
	private int s_no;///테스트
	
	
	private String o_no;//오더 성공하고 생기는 오더 넘버
	private int c_no;//카테고리 번호
	private String c_name;//카테고리 이름
	private int p_no;//상품코드
	private int userno;//유저번호
	private String p_name;//상품명
	private int price;//가격	
	private int day_price;//대여일이 증가할때마다 추가되는 금액
	private int delivery_fee;//배송비
	private int delivery_fee_direct;//배송비 직접입력
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
	private int productCount;//주문 가능 제품 갯수
	private int limitQuantity;//제품 최대 대여 가능 갯수 --s_noList보다 크면 안됨. 이 사이즈를 orderOk에서 비교해서
	
	private ArrayList<Integer> s_noList;//상세 재고들
	private String p_date;
	private int rownum;
	
	private int totalprice;//바로구매할때 전체가격 저장할곳.
	//////////////////////////
	private String period;
	private String pickup;
	//////////////////////////
	private String p_deltype;
	private java.util.Date stock_date;//예약날짜
	
	private String heart="N";//관심상품
	
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
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotal_price(int total_price) {
		this.totalprice = total_price;
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
	public int getDelivery_fee_direct() {
		return delivery_fee_direct;
	}
	public void setDelivery_fee_direct(int delivery_fee_direct) {
		this.delivery_fee_direct = delivery_fee_direct;
	}
	public int getDay_price() {
		return day_price;
	}
	public void setDay_price(int day_price) {
		this.day_price = day_price;
	}
	public String getO_no() {
		return o_no;
	}
	public void setO_no(String o_no) {
		this.o_no = o_no;
	}
	public java.util.Date getStock_date() {
		return stock_date;
	}
	public void setStock_date(java.util.Date stock_date) {
		this.stock_date = stock_date;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getHeart() {
		return heart;
	}
	public void setHeart(String heart) {
		this.heart = heart;
	}
	
}
