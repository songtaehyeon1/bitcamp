package kr.co.bitcamp.board;

public class LeadLagVO {

	private int leadNo;
	private String leadSubject;
	private int lagNo;
	private String lagSubject;
	
	public LeadLagVO() {
	}

	public int getLeadNo() {
		return leadNo;
	}

	public void setLeadNo(int leadno) {
		this.leadNo = leadno;
	}

	public String getLeadSubject() {
		return leadSubject;
	}

	public void setLeadSubject(String leadSubject) {
		this.leadSubject = leadSubject;
	}

	public int getLagNo() {
		return lagNo;
	}

	public void setLagNo(int lagNo) {
		this.lagNo = lagNo;
	}

	public String getLagSubject() {
		return lagSubject;
	}

	public void setLagSubject(String lagSubject) {
		this.lagSubject = lagSubject;
	}

}
