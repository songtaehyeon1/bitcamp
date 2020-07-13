package kr.co.bitcamp.member;

public class MypageVO {

	private int rno;
	private String rname;
	private String tel1;
	private String tel2;
	private String tel3;
	private String rtel;
	private String rzipcode;
	private String raddr;
	private String raddrdetail;
	private int userno;
	private int rcheck;
	
	private int usermile;
	private int orderTot;
	private int orderCnt;
	private String delivery_before;
	private String delivery_pay_com;
	private String delivery_ship_pro;
	private String delivery_com;
	private String delivery_cancel;
	private String delivery_return;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getRtel() {
		return rtel;
	}
	public void setRtel(String tel1, String tel2, String tel3) {
		this.rtel = tel1 + tel2 + tel3;
	}
	public void setRtel(String rtel) {
		this.rtel = rtel;
		this.tel1 = rtel.substring(0, 3);
		this.tel2 = rtel.substring(3, 7);
		this.tel3 = rtel.substring(7, 11);
	}
	public String getRzipcode() {
		return rzipcode;
	}
	public void setRzipcode(String rzipcode) {
		this.rzipcode = rzipcode;
	}
	public String getRaddr() {
		return raddr;
	}
	public void setRaddr(String raddr) {
		this.raddr = raddr;
	}
	public String getRaddrdetail() {
		return raddrdetail;
	}
	public void setRaddrdetail(String raddrdetail) {
		this.raddrdetail = raddrdetail;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getRcheck() {
		return rcheck;
	}
	public void setRcheck(int rcheck) {
		this.rcheck = rcheck;
	}
	public int getUsermile() {
		return usermile;
	}
	public void setUsermile(int usermile) {
		this.usermile = usermile;
	}
	public int getOrderTot() {
		return orderTot;
	}
	public void setOrderTot(int orderTot) {
		this.orderTot = orderTot;
	}
	public int getOrderCnt() {
		return orderCnt;
	}
	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}
	public String getDelivery_before() {
		return delivery_before;
	}
	public void setDelivery_before(String delivery_before) {
		this.delivery_before = delivery_before;
	}
	public String getDelivery_pay_com() {
		return delivery_pay_com;
	}
	public void setDelivery_pay_com(String delivery_pay_com) {
		this.delivery_pay_com = delivery_pay_com;
	}
	public String getDelivery_ship_pro() {
		return delivery_ship_pro;
	}
	public void setDelivery_ship_pro(String delivery_ship_pro) {
		this.delivery_ship_pro = delivery_ship_pro;
	}
	public String getDelivery_com() {
		return delivery_com;
	}
	public void setDelivery_com(String delivery_com) {
		this.delivery_com = delivery_com;
	}
	public String getDelivery_cancel() {
		return delivery_cancel;
	}
	public void setDelivery_cancel(String delivery_cancel) {
		this.delivery_cancel = delivery_cancel;
	}
	public String getDelivery_return() {
		return delivery_return;
	}
	public void setDelivery_return(String delivery_return) {
		this.delivery_return = delivery_return;
	}
	
}
