package kr.co.bitcamp.board;

public class ReviewReplyVO {

	private int r_reply_no;
	private int userno;
	private int review_no;
	private String r_reply_content;
	private String r_reply_writedate;
	private String userid;
	public int getR_reply_no() {
		return r_reply_no;
	}
	public void setR_reply_no(int r_reply_no) {
		this.r_reply_no = r_reply_no;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getR_reply_content() {
		return r_reply_content;
	}
	public void setR_reply_content(String r_reply_content) {
		this.r_reply_content = r_reply_content;
	}
	public String getR_reply_writedate() {
		return r_reply_writedate;
	}
	public void setR_reply_writedate(String r_reply_writedate) {
		this.r_reply_writedate = r_reply_writedate;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
}
