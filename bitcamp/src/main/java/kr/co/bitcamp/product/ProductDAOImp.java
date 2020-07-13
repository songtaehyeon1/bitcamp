package kr.co.bitcamp.product;

import java.util.ArrayList;
import java.util.List;

import kr.co.bitcamp.board.EnquiryVO;
import kr.co.bitcamp.board.ReplyVO;
import kr.co.bitcamp.board.ReviewVO;
import kr.co.bitcamp.category.InterestVO;

public interface ProductDAOImp {

	public ProductVO productView(int p_no);
	
	public List<ProductVO> ProductallSelectRecord();

	public List<ProductVO> selectInterest();

	public ProductVO productSelect(int p_no);
	
	public ArrayList<Integer> productAllSelectProduct(int p_no);
	
	public ArrayList<String> productAllSelectDate(Integer integer);

	public int addInterest(InterestVO vo);
	
	public ArrayList<Integer> allHearts(int userno);
	public ArrayList<ReviewVO> allReviewList(int p_no);
	public ArrayList<EnquiryVO> allQandAList(EnquiryVO vo);
	
	public List<ReplyVO> replyAll(int reviewno);
}
