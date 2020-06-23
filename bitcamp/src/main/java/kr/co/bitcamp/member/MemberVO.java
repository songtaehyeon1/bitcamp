package kr.co.bitcamp.member;

public class MemberVO {
	private int userno;
	private String userid;
	private String userpwd;
	private String username;
	private String useremail;
	private String usertel;
	private String zipcode;
	private String addr;
	private String addrdetail;
	private String regdate;
	
	private String logStatus="N";

	public MemberVO() {
		
	}
	
	public MemberVO(int userno, String userid, String userpwd, String username, String useremail, String usertel, String zipcode, String addr, String addrdetail, String regdate) {
		this.userno = userno;
		this.userid = userid;
		this.userpwd = userpwd;
		this.username = username;
		this.useremail = useremail;
		this.usertel = usertel;
		this.zipcode = zipcode;
		this.addr = addr;
		this.addrdetail = addrdetail;
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

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddrdetail() {
		return addrdetail;
	}

	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
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
