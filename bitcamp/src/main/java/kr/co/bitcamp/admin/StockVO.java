package kr.co.bitcamp.admin;

public class StockVO {
	private int rownum;
	private int s_no;
	private int p_no;
	private String s_regdate;
	private String p_name;
		
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getS_regdate() {
		return s_regdate;
	}
	public void setS_regdate(String s_regdate) {
		this.s_regdate = s_regdate;
	}
	
	
}
