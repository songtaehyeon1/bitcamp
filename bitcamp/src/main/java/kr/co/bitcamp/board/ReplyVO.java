package kr.co.bitcamp.board;

public class ReplyVO {

	private int e_reply_no;
	private int enquiry_no;
	private String e_reply_content;
	private String e_reply_writedate;
	private int userno;
	private String userid;
	public int getE_reply_no() {
		return e_reply_no;
	}
	public void setE_reply_no(int e_reply_no) {
		this.e_reply_no = e_reply_no;
	}
	public int getEnquiry_no() {
		return enquiry_no;
	}
	public void setEnquiry_no(int enquiry_no) {
		this.enquiry_no = enquiry_no;
	}
	public String getE_reply_content() {
		return e_reply_content;
	}
	public void setE_reply_content(String e_reply_content) {
		this.e_reply_content = e_reply_content;
	}
	public String getE_reply_writedate() {
		return e_reply_writedate;
	}
	public void setE_reply_writedate(String e_reply_writedate) {
		this.e_reply_writedate = e_reply_writedate;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
}
