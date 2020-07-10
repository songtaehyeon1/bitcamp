package kr.co.bitcamp.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcamp.board.PagingVO;
import kr.co.bitcamp.order.OrderVO;

@Controller
public class MypageController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 마이페이지로 이동
	@RequestMapping("/mypage")
	public ModelAndView mypage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if((Integer)session.getAttribute("userno") == null) {
			mv.setViewName("redirect:loginFrm");
			return mv;
		}
		int userno = (Integer)session.getAttribute("userno");
		MypageDAO dao = sqlSession.getMapper(MypageDAO.class);
		MypageVO vo = dao.mypageTopList(userno);
		vo.setUsermile(dao.mypageMileageOne(userno));
		vo.setDelivery_before(dao.delivery_before(userno));
		vo.setDelivery_pay_com(dao.delivery_pay_com(userno));
		vo.setDelivery_ship_pro(dao.delivery_ship_pro(userno));
		vo.setDelivery_com(dao.delivery_com(userno));
		vo.setDelivery_cancel(dao.delivery_cancel(userno));
		vo.setDelivery_return(dao.delivery_return(userno));
		mv.addObject("topList", vo);
		mv.setViewName("/member/mypage");
		
		return mv;
	}
	// 배송주소록으로 이동 ============================================================== 배송지
	@RequestMapping("/mypageshipping")
	public ModelAndView mypageshipping(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if((Integer)session.getAttribute("userno") == null) {
			mv.setViewName("redirect:loginFrm");
			return mv;
		}
		int userno = (Integer)session.getAttribute("userno");
		MypageDAO dao = sqlSession.getMapper(MypageDAO.class);
		mv.addObject("list", dao.shippingList(userno));
		mv.setViewName("/member/shipping");
		
		return mv;
	}
	// 배송주소록 등록폼으로
	@RequestMapping("/shipping_writeForm")
	public String shipping_writeForm() {
		return "/member/shippingWriteForm";
	}
	// 배송주소록 등록
	@RequestMapping(value = "/shippingWrite", method = RequestMethod.POST)
	public String shippingWrite(MypageVO vo, HttpServletRequest request) {
		vo.setRtel(vo.getTel1(), vo.getTel2(), vo.getTel3());
		MypageDAO dao = sqlSession.getMapper(MypageDAO.class);
		HttpSession session = request.getSession();
		if((Integer)session.getAttribute("userno") == null) {
			return "redirect:loginFrm";
		}
		int userno = (Integer)session.getAttribute("userno");
		dao.shippingRelease(userno);
		int cnt = dao.shippingInsert(vo);
		if(cnt > 0) {
			return "redirect:mypageshipping";
		}else {
			return "redirect:shipping_writeForm";
		}
	}
	// 배송지 선택
	@RequestMapping("/shipping_select")
	public String shipping_select(int rno, HttpServletRequest request) {
		MypageDAO dao = sqlSession.getMapper(MypageDAO.class);
		HttpSession session = request.getSession();
		int userno = (Integer)session.getAttribute("userno");
		dao.shippingRelease(userno);
		dao.shippingSelect(rno);
		
		return "redirect:mypageshipping";
	}
	// 배송지 수정폼으로
	@RequestMapping("/shippingEditForm")
	public ModelAndView shippingEditForm(int rno) {
		ModelAndView mv = new ModelAndView();
		MypageDAO dao = sqlSession.getMapper(MypageDAO.class);
		mv.addObject("vo", dao.shippingEditList(rno));
		mv.setViewName("/member/shippingEditForm");
		
		return mv;
	}
	// 배송지 수정
	@RequestMapping("/shippingEdit")
	public String shippingEdit(MypageVO vo) {
		MypageDAO dao = sqlSession.getMapper(MypageDAO.class);
		vo.setRtel(vo.getTel1(), vo.getTel2(), vo.getTel3());
		int cnt = dao.shippingEdit(vo);
		if(cnt > 0) {
			return "redirect:mypageshipping";
		}else {
			return "redirect:/";
		}
	}
	// 배송지 삭제
	@RequestMapping("/shipping_delete")
	@ResponseBody
	public String shipping_delete(int rno) {
		MypageDAO dao = sqlSession.getMapper(MypageDAO.class);
		dao.shippingDelete(rno);
		
		return "성공";
	}
	
	// 게시물 관리로 이동 ======================================================================= 게시물 관리
	@RequestMapping("/mypageboard")
	public ModelAndView mypageboard(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if((Integer)session.getAttribute("userno") == null) {
			mv.setViewName("redirect:loginFrm");
			return mv;
		}
		int userno = (Integer)session.getAttribute("userno");
		MypageDAO dao = sqlSession.getMapper(MypageDAO.class);
		mv.addObject("eList", dao.mypageBoardEnquiry(userno));
		mv.addObject("rList", dao.mypageBoardReview(userno));
		mv.setViewName("/member/boardManage");
		
		return mv;
	}
	
	// 주문 조회로 이동 ============================================================================ 주문내역 조회
	@RequestMapping("/mypageOrderHistory")
	public ModelAndView mypageOrderHistory(HttpServletRequest request, String delivery_status, String order_date_start, String order_date_end) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(delivery_status == null) {
			delivery_status = "all";
		}
		if((Integer)session.getAttribute("userno") == null) {
			mv.setViewName("redirect:loginFrm");
			return mv;
		}
		int userno = (Integer)session.getAttribute("userno");
		MypageDAO dao = sqlSession.getMapper(MypageDAO.class);
		
		// 페이지 번호 구하기
		String pageNumStr = request.getParameter("pageNum");
		PagingVO pagevo = new PagingVO();
		
		// 페이지 번호 전송된 경우 페이지 번호를 변경한다
		if(pageNumStr != null) {
			pagevo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		pagevo.setUserno(userno);
		pagevo.setDelivery_status(delivery_status);
		pagevo.setOrder_date_start(order_date_start);
		pagevo.setOrder_date_end(order_date_end);
		pagevo.setTotalRecord(dao.getTotalRecord(pagevo));
		
		mv.addObject("pagevo", pagevo);
		mv.addObject("list", dao.mypageOrderList(pagevo));
		mv.addObject("delivery_status", delivery_status);
		mv.setViewName("/member/mypageOrderHistory");
		
		return mv;
	}
	// 주문조회 수정 폼으로
	@RequestMapping("/mypageOrderView")
	public ModelAndView mypageOrderView(String o_no) {
		ModelAndView mv = new ModelAndView();
		MypageDAO dao = sqlSession.getMapper(MypageDAO.class);
		mv.addObject("vo", dao.selectOrder(o_no));
		mv.setViewName("/member/mypageOrderView");
		
		return mv;
	}
	// 주문조회 수정
	@RequestMapping("/mypageOrderEdit")
	public ModelAndView mypageOrderEdit(OrderVO vo) {
		ModelAndView mv = new ModelAndView();
		MypageDAO dao = sqlSession.getMapper(MypageDAO.class);
		int result = dao.mypageOrderEdit(vo);
		if(result>0) {
			if(vo.getDelivery_code() != null && vo.getDelivery_code() != "") {
				dao.updateInvoice(vo.getO_no(),vo.getDelivery_code(),vo.getDelivery_date(),vo.getDelivery_arrival_date());
			}
			mv.setViewName("redirect:mypageOrderHistory");
		}else {
			mv.addObject("o_no", vo.getO_no());
			mv.setViewName("redirect:mypageOrderView");
		}		
		
		return mv;
	}
	// 주문조회 최소
	@RequestMapping("/mypageOrderCancle")
	public String mypageOrderCancle(String o_no, String str) {
		MypageDAO dao = sqlSession.getMapper(MypageDAO.class);
		if(str.equals("orderCancle")) {
			dao.mypageOrderCancle(o_no);
		}else if(str.equals("orderReturn")) {
			dao.mypageOrderReturn(o_no);
		}
		
		return "redirect:mypageOrderHistory";
	}
	
	// 관심상품으로 이동 ============================================================================== 관심상품
	@RequestMapping("/mypageWishList")
	public ModelAndView mypageWishList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userno = (Integer)session.getAttribute("userno");
		ModelAndView mv = new ModelAndView();
		MypageDAO dao = sqlSession.getMapper(MypageDAO.class);
		mv.addObject("list", dao.mypageWishLists(userno));
		mv.setViewName("/member/mypageWishList");
		
		return mv;
	}
	@RequestMapping("/mypageWishListDel")
	public String mypageWishListDel(int p_no, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int userno = (Integer)session.getAttribute("userno");
		if((Integer)session.getAttribute("userno") == null) {
			return "redirect:loginFrm";
		}
		MypageDAO dao = sqlSession.getMapper(MypageDAO.class);
		dao.mypageWishListDel(userno, p_no);
		
		return "redirect:mypageWishList";
	}
	
	// 마일리지로 이동 ============================================================================== 마일리지
	/*@RequestMapping("/mypageMileage")
	public ModelAndView mypageMileage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/member/mypageMileage");
		
		return mv;
	}*/
	
}