package kr.co.bitcamp.admin;

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
	private int userno=0;
	
	
	
	
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
