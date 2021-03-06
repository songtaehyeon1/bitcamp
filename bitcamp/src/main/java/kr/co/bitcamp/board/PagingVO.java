package kr.co.bitcamp.board;

public class PagingVO {

	private int pageNum = 1;	// 현재 페이지
	private int onePageRecord = 10;	// 한 페이지에 출력할 레코드 수
	private int totalRecord;	// 총 레코드 수
	private int totalPage;	// 총 페이지 수
	private int startPage = 1;	// 시작 페이지 번호
	private int onePageCount = 5;	// 한번에 출력할 페이지 갯수
	private int lastPageRecord = 5;	// 마지막 페이지의 남아 있는 레코드 수
	
	// 검색어, 검색키
	private String searchKey;
	private String searchWord;
	
	// 이전글, 다음글 때문에
	private int notice_no;
	private int enquiry_no;
	private int review_no;
	
	// 마이페이지
	private int userno;
	private String delivery_status;
	private String order_date_start;
	private String order_date_end;
	
	public PagingVO() {
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		// 시작 페이지 계산
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
		// 총 페이지 수
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

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public int getEnquiry_no() {
		return enquiry_no;
	}

	public void setEnquiry_no(int enquiry_no) {
		this.enquiry_no = enquiry_no;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getDelivery_status() {
		return delivery_status;
	}

	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}

	public String getOrder_date_start() {
		return order_date_start;
	}

	public void setOrder_date_start(String order_date_start) {
		this.order_date_start = order_date_start;
	}

	public String getOrder_date_end() {
		return order_date_end;
	}

	public void setOrder_date_end(String order_date_end) {
		this.order_date_end = order_date_end;
	}

}
