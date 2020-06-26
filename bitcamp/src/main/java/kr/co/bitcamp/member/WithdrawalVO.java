package kr.co.bitcamp.member;

public class WithdrawalVO {
	
	private String userid;
	private int userno;
	private String username;
	private String reason;	
	private String withdrawaldate;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getWithdrawaldate() {
		return withdrawaldate;
	}
	public void setWithdrawaldate(String withdrawaldate) {
		this.withdrawaldate = withdrawaldate;
	}
	
}
