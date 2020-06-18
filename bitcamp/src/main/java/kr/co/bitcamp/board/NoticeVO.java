package kr.co.bitcamp.board;

public class NoticeVO {

	private int notice_no;
	private String notice_subject;
	private String notice_content;
	private int notice_hit;
	private String notice_writedate;
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}
	public String getNotice_writedate() {
		return notice_writedate;
	}
	public void setNotice_writedate(String notice_writedate) {
		this.notice_writedate = notice_writedate;
	}
	
}
