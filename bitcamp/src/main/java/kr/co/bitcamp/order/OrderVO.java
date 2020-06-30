package kr.co.bitcamp.order;

public class OrderVO {
	private int o_no;
	private int p_no;
	private int s_no;
	private int userno;
	private int r_no;
	private int oi_no;
	private int price;
	private int day_price;
	private int mileage;
	private int totalprice;
	private String order_date;
	private String delivery_date;
	private String delivery_code;
	private String delivery_fee;
	private String delivery_status;
	private String oname;
	private String ozipcode;
	private String oaddr;
	private String oaddrdetail;
	private String otel;
	private String otel1;
	private String otel2;
	private String otel3;
	private String oemail;
	private String oemail1;
	private String oemail2;
	private String opassword;
	private String rname;
	private String rzipcode;
	private String raddr;
	private String raddrdetail;
	private String rtel;
	private String rtel1;
	private String rtel2;
	private String rtel3;
	private String rcommnet;
	private String payment_type;//결제타입(card/cash)
	private String bank;//은행명
	private String depositor;//입금자성명
	private String payment_time;//결제시간
	private String card_corp;//카드사명
	
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getDepositor() {
		return depositor;
	}
	public void setDepositor(String depositor) {
		this.depositor = depositor;
	}
	public String getPayment_time() {
		return payment_time;
	}
	public void setPayment_time(String payment_time) {
		this.payment_time = payment_time;
	}
	public String getCard_corp() {
		return card_corp;
	}
	public void setCard_corp(String card_corp) {
		this.card_corp = card_corp;
	}
	public String getOtel1() {
		return otel1;
	}
	public void setOtel1(String otel1) {
		this.otel1 = otel1;
	}
	public String getOtel2() {
		return otel2;
	}
	public void setOtel2(String otel2) {
		this.otel2 = otel2;
	}
	public String getOtel3() {
		return otel3;
	}
	public void setOtel3(String otel3) {
		this.otel3 = otel3;
	}
	public String getOemail1() {
		return oemail1;
	}
	public void setOemail1(String oemail1) {
		this.oemail1 = oemail1;
	}
	public String getOemail2() {
		return oemail2;
	}
	public void setOemail2(String oemail2) {
		this.oemail2 = oemail2;
	}
	public String getRtel1() {
		return rtel1;
	}
	public void setRtel1(String rtel1) {
		this.rtel1 = rtel1;
	}
	public String getRtel2() {
		return rtel2;
	}
	public void setRtel2(String rtel2) {
		this.rtel2 = rtel2;
	}
	public String getRtel3() {
		return rtel3;
	}
	public void setRtel3(String rtel3) {
		this.rtel3 = rtel3;
	}
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getOi_no() {
		return oi_no;
	}
	public void setOi_no(int oi_no) {
		this.oi_no = oi_no;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDay_price() {
		return day_price;
	}
	public void setDay_price(int day_price) {
		this.day_price = day_price;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
	}
	public String getDelivery_code() {
		return delivery_code;
	}
	public void setDelivery_code(String delivery_code) {
		this.delivery_code = delivery_code;
	}
	public String getDelivery_fee() {
		return delivery_fee;
	}
	public void setDelivery_fee(String delivery_fee) {
		this.delivery_fee = delivery_fee;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getOzipcode() {
		return ozipcode;
	}
	public void setOzipcode(String ozipcode) {
		this.ozipcode = ozipcode;
	}
	public String getOaddr() {
		return oaddr;
	}
	public void setOaddr(String oaddr) {
		this.oaddr = oaddr;
	}
	public String getOaddrdetail() {
		return oaddrdetail;
	}
	public void setOaddrdetail(String oaddrdetail) {
		this.oaddrdetail = oaddrdetail;
	}
	public String getOtel() {
		return otel1+"-"+otel2+"-"+otel3;
	}
	public void setOtel(String otel) {
		this.otel = otel;
		String t[] = otel.split("-");
		otel1 = t[0];
		otel2 = t[1];
		otel3 = t[2];
	}
	public String getOemail() {
		return oemail1+"@"+oemail2;
	}
	public void setOemail(String oemail) {
		this.oemail = oemail;
		int idx = oemail.indexOf("@");
		oemail1 = oemail.substring(0,idx);
		oemail2 = oemail.substring(idx+1);
	}
	public String getOpassword() {
		return opassword;
	}
	public void setOpassword(String opassword) {
		this.opassword = opassword;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRzipcode() {
		return rzipcode;
	}
	public void setRzipcode(String rzipcode) {
		this.rzipcode = rzipcode;
	}
	public String getRaddr() {
		return raddr;
	}
	public void setRaddr(String raddr) {
		this.raddr = raddr;
	}
	public String getRaddrdetail() {
		return raddrdetail;
	}
	public void setRaddrdetail(String raddrdetail) {
		this.raddrdetail = raddrdetail;
	}
	public String getRtel() {
		return rtel1+"-"+rtel2+"-"+rtel3;
	}
	public void setRtel(String rtel) {
		this.rtel = rtel;
		String rt[] = rtel.split("-");
		rtel1 = rt[0];
		rtel2 = rt[1];
		rtel3 = rt[2];
	}
	public String getRcommnet() {
		return rcommnet;
	}
	public void setRcommnet(String rcommnet) {
		this.rcommnet = rcommnet;
	}
	

	
	
}
