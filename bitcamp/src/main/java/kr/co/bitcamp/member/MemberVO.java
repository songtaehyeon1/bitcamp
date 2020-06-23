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
	
	private String logStatus="N";

	public MemberVO() {
		
	}

	public MemberVO(int userno, String userid, String userpwd, String username, String useremail, String usertel, String userzipcode, String useraddr, String useraddrdetail, String regdate) {
		this.userno = userno;
		this.userid = userid;
		this.userpwd = userpwd;
		this.username = username;
		this.useremail = useremail;
		this.usertel = usertel;
		this.userzipcode = userzipcode;
		this.useraddr = useraddr;
		this.useraddrdetail = useraddrdetail;
		this.regdate = regdate;
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

	public String getLogStatus() {
		return logStatus;
	}

	public void setLogStatus(String logStatus) {
		this.logStatus = logStatus;
	}
}
