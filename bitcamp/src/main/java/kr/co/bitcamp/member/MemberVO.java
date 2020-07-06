package kr.co.bitcamp.member;

public class MemberVO {
	private int userno;
	private String userid;
	private String userpwd;
	private String username;
	private String useremail;
	private String usertel;
	private String userzipcode;
	private String useraddr;
	private String useraddrdetail;
	private String regdate;
	private int usermile;
	
	private String userlogdate;
	private String userjointype;
	private String reason;  //Ε»Επ »ηΐ―
	
	private String logStatus="N";

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

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUsertel() {
		return usertel;
	}

	public void setUsertel(String usertel) {
		this.usertel = usertel;
	}

	public String getUserzipcode() {
		return userzipcode;
	}

	public void setUserzipcode(String userzipcode) {
		this.userzipcode = userzipcode;
	}

	public String getUseraddr() {
		return useraddr;
	}

	public void setUseraddr(String useraddr) {
		this.useraddr = useraddr;
	}

	public String getUseraddrdetail() {
		return useraddrdetail;
	}

	public void setUseraddrdetail(String useraddrdetail) {
		this.useraddrdetail = useraddrdetail;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getUsermile() {
		return usermile;
	}

	public void setUsermile(int usermile) {
		this.usermile = usermile;
	}

	public String getUserlogdate() {
		return userlogdate;
	}

	public void setUserlogdate(String userlogdate) {
		this.userlogdate = userlogdate;
	}

	public String getUserjointype() {
		return userjointype;
	}

	public void setUserjointype(String userjointype) {
		this.userjointype = userjointype;
	}
	
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getLogStatus() {
		return logStatus;
	}

	public void setLogStatus(String logStatus) {
		this.logStatus = logStatus;
	}
}
