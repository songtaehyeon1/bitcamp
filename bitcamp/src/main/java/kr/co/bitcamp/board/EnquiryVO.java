package kr.co.bitcamp.board;

public class EnquiryVO {

	private int enquiry_no;
	private int userno;
	private int p_no;
	private String enquiry_subject;
	private String enquiry_content;
	private int enquiry_hit;
	private String enquiry_writedate;
	private String enquiry_ip;
	private String enquiry_secret;
	public int getEnquiry_no() {
		return enquiry_no;
	}
	public void setEnquiry_no(int enquiry_no) {
		this.enquiry_no = enquiry_no;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getEnquiry_subject() {
		return enquiry_subject;
	}
	public void setEnquiry_subject(String enquiry_subject) {
		this.enquiry_subject = enquiry_subject;
	}
	public String getEnquiry_content() {
		return enquiry_content;
	}
	public void setEnquiry_content(String enquiry_content) {
		this.enquiry_content = enquiry_content;
	}
	public int getEnquiry_hit() {
		return enquiry_hit;
	}
	public void setEnquiry_hit(int enquiry_hit) {
		this.enquiry_hit = enquiry_hit;
	}
	public String getEnquiry_writedate() {
		return enquiry_writedate;
	}
	public void setEnquiry_writedate(String enquiry_writedate) {
		this.enquiry_writedate = enquiry_writedate;
	}
	public String getEnquiry_ip() {
		return enquiry_ip;
	}
	public void setEnquiry_ip(String enquiry_ip) {
		this.enquiry_ip = enquiry_ip;
	}
	public String getEnquiry_secret() {
		return enquiry_secret;
	}
	public void setEnquiry_secret(String enquiry_secret) {
		this.enquiry_secret = enquiry_secret;
	}
	
}
