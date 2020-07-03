package kr.co.bitcamp.member;

import java.util.List;

import kr.co.bitcamp.board.EnquiryVO;
import kr.co.bitcamp.board.ReviewVO;

public interface MypageDAO {

	// 배송지 등록 ============================================== 배송지
	public int shippingInsert(MypageVO vo);
	
	// 배송지 리스트 가져오기
	public List<MypageVO> shippingList(int userno);
	
	// 배송지 모두 선택 해제, 하나 선택
	public void shippingRelease(int userno);
	public void shippingSelect(int rno);
	
	// 배송지 수정 정보 가져오기
	public MypageVO shippingEditList(int rno);
	
	// 배송지 수정
	public int shippingEdit(MypageVO vo);
	
	// 배송지 삭제
	public int shippingDelete(int rno);
	
	// 게시물 가져오기 ============================================ 게시물 관리
	public List<EnquiryVO> mypageBoardEnquiry(int userno);
	public List<ReviewVO> mypageBoardReview(int userno);
	
}
