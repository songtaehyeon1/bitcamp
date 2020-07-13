package kr.co.bitcamp.order;

public class OrderVO {
	private String o_no;
	private int oi_no;
	private int r_no;
	private int p_no;
	private int s_no;
	private int userno;
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
	private String otel;//주문자 - 연락처
	private String otel1;
	private String otel2;
	private String otel3;
	private String oemail;//이메일
	private String oemail1;
	private String oemail2;
	private String opassword;
	private String rname;
	private String rzipcode;
	private String raddr;
	private String raddrdetail;
	private String rtel;//실질적 배송 받는사람 전화번호
	private String rtel1;
	private String rtel2;
	private String rtel3;
	private String rcommnet;//배송메세지
	private String payment_type;//결제 방식(card/cash)
	private String bank;//무통장
	private String depositor;//입금자명
	private String payment_time;//입금시간
	private String card_corp;//카드회사
	private String userid;//유저아이디
	private String cash_time;//신규
	private String card_time;//신규
	private int payment_price;//결제된 금액
	private int p_count;//선택하고 결제된 제품 수량
	private String p_name;//
	private java.util.Date stock_date;//예약날짜
	private String logStatus="N";
	//결제정보 저장
	private String imp_uid;
	private String buyer_name;
	private String merchant_uid;
	private String card_name;
	private String apply_num;
	private String buyer_email;
	private String buyer_tel;
	private String formattedTime;
	private String paid_amount;
	private int total_delivery_fee; //전체 배송비
	
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getCard_name() {
		return card_name;
	}
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}
	public String getApply_num() {
		return apply_num;
	}
	public void setApply_num(String apply_num) {
		this.apply_num = apply_num;
	}
	public String getBuyer_email() {
		return buyer_email;
	}
	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}
	public String getBuyer_tel() {
		return buyer_tel;
	}
	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}
	public String getFormattedTime() {
		return formattedTime;
	}
	public void setFormattedTime(String formattedTime) {
		this.formattedTime = formattedTime;
	}
	public String getPaid_amount() {
		return paid_amount;
	}
	public void setPaid_amount(String paid_amount) {
		this.paid_amount = paid_amount;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCash_time() {
		return cash_time;
	}
	public void setCash_time(String cash_time) {
		this.cash_time = cash_time;
	}
	public String getCard_time() {
		return card_time;
	}
	public void setCard_time(String card_time) {
		this.card_time = card_time;
	}
	public int getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(int payment_price) {
		this.payment_price = payment_price;
	}
	private String delivery_arrival_date;////////배송완료날짜...
	
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
	public String getO_no() {
		return o_no;
	}
	public void setO_no(String o_no) {
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
	public String getDelivery_arrival_date() {
		return delivery_arrival_date;
	}
	public void setDelivery_arrival_date(String delivery_arrival_date) {
		this.delivery_arrival_date = delivery_arrival_date;
	}
	public int getP_count() {
		return p_count;
	}
	public void setP_count(int p_count) {
		this.p_count = p_count;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public java.util.Date getStock_date() {
		return stock_date;
	}
	public void setStock_date(java.util.Date stock_date) {
		this.stock_date = stock_date;
	}
	public String getLogStatus() {
		return logStatus;
	}
	public void setLogStatus(String logStatus) {
		this.logStatus = logStatus;
	}
	public int getTotal_delivery_fee() {
		return total_delivery_fee;
	}
	public void setTotal_delivery_fee(int total_delivery_fee) {
		this.total_delivery_fee = total_delivery_fee;
	}
	

	
	
}
