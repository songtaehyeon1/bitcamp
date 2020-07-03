package kr.co.bitcamp.admin;

import java.util.List;

public class PagingVO {

	private int pageNum = 1;	// ���� ������
	private int onePageRecord = 10;	// �� �������� ����� ���ڵ� ��
	private int totalRecord;	// �� ���ڵ� ��
	private int totalPage;	// �� ������ ��
	private int startPage = 1;	// ���� ������ ��ȣ
	private int onePageCount = 5;	// �ѹ��� ����� ������ ����
	private int lastPageRecord = 5;	// ������ �������� ���� �ִ� ���ڵ� ��
	
	// �˻���, �˻�Ű
	private String searchKey;
	private String searchWord;
	private int c_no =0;
	private int p_no =0;
	private String s_date;
	private String e_date;
	private String s_price;
	private String e_price;
	private int userno=0;
	private String userjointype;
	private String p_deltype;
	private String s_deltype;
	private String payment_type;
	private String ndate;
	private String[] delivery_status;

	
	public String getS_price() {
		return s_price;
	}

	public void setS_price(String s_price) {
		this.s_price = s_price;
	}

	public String getE_price() {
		return e_price;
	}

	public void setE_price(String e_price) {
		this.e_price = e_price;
	}

	public String[] getDelivery_status() {
		return delivery_status;
	}

	public void setDelivery_status(String[] delivery_status) {
		this.delivery_status = delivery_status;
	}

	public String getNdate() {
		return ndate;
	}

	public void setNdate(String ndate) {
		this.ndate = ndate;
	}

	public String getPayment_type() {
		return payment_type;
	}

	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}

	public String getUserjointype() {
		return userjointype;
	}

	public void setUserjointype(String userjointype) {
		this.userjointype = userjointype;
	}

	public String getP_deltype() {
		return p_deltype;
	}

	public void setP_deltype(String p_deltype) {
		this.p_deltype = p_deltype;
	}

	public String getS_deltype() {
		return s_deltype;
	}

	public void setS_deltype(String s_deltype) {
		this.s_deltype = s_deltype;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getS_date() {
		return s_date;
	}

	public void setS_date(String s_date) {
		this.s_date = s_date;
	}

	public String getE_date() {
		return e_date;
	}

	public void setE_date(String e_date) {
		this.e_date = e_date;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public PagingVO() {
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		// ���� ������ ���
		startPage = (pageNum - 1) / onePageCount * onePageCount + 1;
	}

	public int getOnePageRecord() {
		return onePageRecord;
	}

	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		// �� ������ ��
		totalPage = (int)Math.ceil((double)totalRecord / onePageRecord);
		if(totalRecord % onePageRecord == 0) {
			lastPageRecord = onePageRecord;
		}else{
			lastPageRecord = totalRecord % onePageRecord;
		}
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getOnePageCount() {
		return onePageCount;
	}

	public void setOnePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public int getLastPageRecord() {
		return lastPageRecord;
	}

	public void setLastPageRecord(int lastPageRecord) {
		this.lastPageRecord = lastPageRecord;
	}



}
