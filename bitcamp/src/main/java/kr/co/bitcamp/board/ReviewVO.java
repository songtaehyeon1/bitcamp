package kr.co.bitcamp.board;

public class ReviewVO {

	private int review_no;
	private int userno;
	private String c_no;
	private int p_no;
	private String review_subject;
	private String review_content;
	private int review_hit;
	private int review_recommend;
	private int review_rating;
	private String review_writedate;
	private String review_ip;
	private String review_file1;
	private String review_file2;
	private String review_file3;
	private String review_file4;
	private String review_file5;
	private String fileList[] = new String[5];
	private String userid;
	private String p_name;
	private String p_filename1;
	private int price;
	public ReviewVO () {}
	public void print() {
		System.out.println(fileList.length);
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getC_no() {
		return c_no;
	}
	public void setC_no(String c_no) {
		this.c_no = c_no;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getReview_subject() {
		return review_subject;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_hit() {
		return review_hit;
	}
	public void setReview_hit(int review_hit) {
		this.review_hit = review_hit;
	}
	public int getReview_recommend() {
		return review_recommend;
	}
	public void setReview_recommend(int review_recommend) {
		this.review_recommend = review_recommend;
	}
	public int getReview_rating() {
		return review_rating;
	}
	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}
	public String getReview_writedate() {
		return review_writedate;
	}
	public void setReview_writedate(String review_writedate) {
		this.review_writedate = review_writedate;
	}
	public String getReview_ip() {
		return review_ip;
	}
	public void setReview_ip(String review_ip) {
		this.review_ip = review_ip;
	}
	public String getReview_file1() {
		return review_file1;
	}
	public void setReview_file1(String review_file1) {
		this.review_file1 = review_file1;
		fileList[0] = review_file1;
	}
	public String getReview_file2() {
		return review_file2;
	}
	public void setReview_file2(String review_file2) {
		this.review_file2 = review_file2;
		fileList[1] = review_file2;
	}
	public String getReview_file3() {
		return review_file3;
	}
	public void setReview_file3(String review_file3) {
		this.review_file3 = review_file3;
		fileList[2] = review_file3;
	}
	public String getReview_file4() {
		return review_file4;
	}
	public void setReview_file4(String review_file4) {
		this.review_file4 = review_file4;
		fileList[3] = review_file4;
	}
	public String getReview_file5() {
		return review_file5;
	}
	public void setReview_file5(String review_file5) {
		this.review_file5 = review_file5;
		fileList[4] = review_file5;
	}
	public String[] getFileList() {
		return fileList;
	}
	public void setFileList(String[] fileList) {
		this.fileList = fileList;
		review_file1 = fileList[0];
		review_file2 = fileList[1];
		review_file3 = fileList[2];
		review_file4 = fileList[3];
		review_file5 = fileList[4];
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_filename1() {
		return p_filename1;
	}
	public void setP_filename1(String p_filename1) {
		this.p_filename1 = p_filename1;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
