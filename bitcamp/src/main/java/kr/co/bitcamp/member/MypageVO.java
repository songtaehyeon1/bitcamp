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
	
}
