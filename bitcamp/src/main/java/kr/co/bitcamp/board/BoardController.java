package kr.co.bitcamp.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// notice
	// 전체 리스트로
	@RequestMapping("/boardNotice")
	public ModelAndView boardNotice(HttpServletRequest request) {
		// 페이지 번호 구하기
		String pageNumStr = request.getParameter("pageNum");
		PagingVO pagevo = new PagingVO();
		
		// 페이지 번호 전송된 경우 페이지 번호를 변경한다
		if(pageNumStr != null) {
			pagevo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		// 검색키, 검색어 request
		pagevo.setSearchKey(request.getParameter("searchKey"));
		pagevo.setSearchWord(request.getParameter("searchWord"));
		
		ModelAndView mv = new ModelAndView();
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		pagevo.setTotalRecord(dao.getTotalRecord(pagevo));

		mv.addObject("pagevo", pagevo);
		mv.addObject("list", dao.allList(pagevo));
		mv.setViewName("board/notice");
		
		return mv;
	}
	// 글 쓰기폼으로
	@RequestMapping("/notice_writeForm")
	public String notice_writeForm() {return "board/notice_writeForm";}
	// 글 쓰기
	@RequestMapping(value = "/notice_writeOk", method = RequestMethod.POST)
	public ModelAndView notice_writeOk(NoticeVO vo) {
		ModelAndView mv = new ModelAndView();
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		int cnt = dao.noticeInsert(vo);
		if(cnt > 0) {
			mv.addObject("str", "notice_writeForm");
			mv.setViewName("board/alters");
		}else {
			mv.setViewName("redirect:notice_writeForm");
		}
		
		return mv;
	}
	// 한개 리스트로
	@RequestMapping("/notice_listForm")
	public ModelAndView notice_listForm(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		int no = Integer.parseInt(request.getParameter("no"));
		
		PagingVO pagevo = new PagingVO();
		pagevo.setPageNum(Integer.parseInt(request.getParameter("pageNum")));
		pagevo.setSearchKey(request.getParameter("searchKey"));
		pagevo.setSearchWord(request.getParameter("searchWord"));
		pagevo.setNotice_no(no);
		LeadLagVO pnvo = dao.getLeadLagSelect(pagevo);
		
		dao.noticeHit(no);
		mv.addObject("list", dao.list(no));
		mv.addObject("pagevo", pagevo);
		mv.addObject("pnvo", pnvo);
		mv.setViewName("board/notice_listForm");
		
		return mv;
	}
	// 글 수정 폼으로
	@RequestMapping("/notice_editForm")
	public ModelAndView notice_editForm(int no) {
		ModelAndView mv = new ModelAndView();
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		mv.addObject("vo", dao.list(no));
		mv.setViewName("/board/notice_editForm");
		
		return mv;
	}
	// 글 수정
	@RequestMapping("/notice_editOk")
	public ModelAndView notice_editOk(NoticeVO vo) {
		ModelAndView mv = new ModelAndView();
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		int cnt = dao.noticeUpdate(vo);
		if(cnt > 0) {
			mv.addObject("str", "notice_editOk");
			mv.setViewName("board/alters");
		}else {
			mv.setViewName("redirect:notice_editForm");
		}
		
		return mv;
	}
	// 글 삭제
	@RequestMapping("/notice_delForm")
	public ModelAndView notice_delForm(int no) {
		ModelAndView mv = new ModelAndView();
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		int cnt = dao.noticeDelete(no);
		if(cnt > 0) {
			mv.setViewName("redirect:boardNotice");
		}else {
			mv.setViewName("redirect:notice_listForm");
		}
		
		return mv;
	}
	
	// enquiry
	// 전체 리스트로
	@RequestMapping("/boardEnquiry")
	public ModelAndView boardEnquiry(HttpServletRequest request) {
		// 페이지 번호 구하기
		String pageNumStr = request.getParameter("pageNum");
		PagingVO pagevo = new PagingVO();
		
		// 페이지 번호 전송된 경우 페이지 번호를 변경한다
		if(pageNumStr != null) {
			pagevo.setPageNum(Integer.parseInt(pageNumStr));
		}
		
		// 검색키, 검색어 request
		pagevo.setSearchKey(request.getParameter("searchKey"));
		pagevo.setSearchWord(request.getParameter("searchWord"));
		
		ModelAndView mv = new ModelAndView();
		EnquiryDAO dao = sqlSession.getMapper(EnquiryDAO.class);
		pagevo.setTotalRecord(dao.getTotalRecord(pagevo));

		mv.addObject("pagevo", pagevo);
		mv.addObject("list", dao.allList(pagevo));
		mv.setViewName("board/enquiry");
		
		return mv;
	}
	// 글 쓰기폼으로
	@RequestMapping("/enquiry_writeForm")
	public ModelAndView enquiry_writeForm() {
		ModelAndView mv = new ModelAndView();
		EnquiryDAO dao = sqlSession.getMapper(EnquiryDAO.class);
		mv.addObject("cateList", dao.enquiryCategory());
		mv.setViewName("board/enquiry_writeForm");
		
		return mv;
	}
	// 상품 가져오기
	@RequestMapping("/enquiry_goods")
	@ResponseBody
	public List<GoodsVO> enquiry_goods(String cate){
		EnquiryDAO dao = sqlSession.getMapper(EnquiryDAO.class);
		
		return dao.enquiryGoods(cate);
	}
	// 글 쓰기
	@RequestMapping(value = "/enquiry_writeOk", method = RequestMethod.POST)
	public ModelAndView enquiry_writeOk(EnquiryVO vo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		EnquiryDAO dao = sqlSession.getMapper(EnquiryDAO.class);
		vo.setUserno(1);	// 바꿔
		//request.getSession().getAttribute("userno");
		vo.setEnquiry_ip(getClientIpAddr(request));
		int cnt = dao.enquiryInsert(vo);
		if(cnt > 0) {
			mv.addObject("str", "enquiry_writeForm");
			mv.setViewName("board/alters");
		}else {
			mv.setViewName("redirect:enquiry_writeForm");
		}
		
		return mv;
	}
	// 한개 리스트로
	@RequestMapping("/enquiry_listForm")
	public ModelAndView enquiry_listForm(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		EnquiryDAO dao = sqlSession.getMapper(EnquiryDAO.class);
		int no = Integer.parseInt(request.getParameter("no"));
		
		PagingVO pagevo = new PagingVO();
		pagevo.setPageNum(Integer.parseInt(request.getParameter("pageNum")));
		pagevo.setSearchKey(request.getParameter("searchKey"));
		pagevo.setSearchWord(request.getParameter("searchWord"));
		pagevo.setEnquiry_no(no);
		dao.enquiryHit(no);
		
		EnquiryVO list = dao.list(no);
		EnquiryVO list1 = dao.listGoods(list.getP_no(), list.getC_no());
		list.setP_name(list1.getP_name());
		list.setP_filename1(list1.getP_filename1());
		list.setPrice(list1.getPrice());
		
		mv.addObject("list", list);
		mv.addObject("pagevo", pagevo);
		mv.setViewName("board/enquiry_listForm");
		
		return mv;
	}
	// 글 한개 댓글
	@RequestMapping(value = "/enquiry_reply", method = RequestMethod.POST)
	@ResponseBody
	public List<ReplyVO> enquiry_reply(@RequestParam("enquiry_no") int no){
		EnquiryDAO dao = sqlSession.getMapper(EnquiryDAO.class);
		
		List<ReplyVO> list = dao.replyAll(no);
		
		return list;
	}
	// 댓글 달기
	@RequestMapping("/replyWrite")
	@ResponseBody
	public String replyWrite(ReplyVO vo) {
		EnquiryDAO dao = sqlSession.getMapper(EnquiryDAO.class);
		int cnt = dao.replyWrite(1, vo.getEnquiry_no(), vo.getE_reply_content());
		if(cnt > 0) {
			return "댓글이 등록되었습니다.";
		}else{
			return "댓글 등록 실패하였습니다.";
		}
	}
	// 댓글 삭제
	@RequestMapping("/replyDel")
	@ResponseBody
	public void replyDel(int e_reply_no) {
		EnquiryDAO dao = sqlSession.getMapper(EnquiryDAO.class);
		dao.replyDel(e_reply_no);
	}
	// 댓글 하나 가져오기
	@RequestMapping("/replyEdit")
	@ResponseBody
	public ReplyVO replyEdit(int e_reply_no) {
		EnquiryDAO dao = sqlSession.getMapper(EnquiryDAO.class);
		
		return dao.replyOne(e_reply_no);
	}
	// 댓글 수정
	@RequestMapping("/replyEditOk")
	@ResponseBody
	public void replyEditOk(int e_reply_no, String e_reply_content) {
		EnquiryDAO dao = sqlSession.getMapper(EnquiryDAO.class);
		dao.replyUpdate(e_reply_no, e_reply_content);
	}
	// 글 수정폼으로
	@RequestMapping("/enquiry_editForm")
	public ModelAndView enquiry_editForm(int no) {
		ModelAndView mv = new ModelAndView();
		EnquiryDAO dao = sqlSession.getMapper(EnquiryDAO.class);
		EnquiryVO vo = dao.list(no);
		vo.setC_no(dao.enquiryUpdateCate(vo.getP_no()));
		
		EnquiryVO goods = dao.listGoods(vo.getP_no(), vo.getC_no());
		mv.addObject("cateList", dao.enquiryCategory());
		mv.addObject("goods", goods);
		mv.addObject("vo", vo);
		mv.setViewName("/board/enquiry_editForm");
		
		return mv;
	}
	// 글 수정
	@RequestMapping("/enquiry_editOk")
	public ModelAndView enquiry_editOk(EnquiryVO vo) {
		ModelAndView mv = new ModelAndView();
		EnquiryDAO dao = sqlSession.getMapper(EnquiryDAO.class);
		int cnt = dao.enquiryUpdate(vo);
		if(cnt > 0) {
			mv.setViewName("redirect:boardEnquiry");
		}else {
			mv.setViewName("redirect:enquiry_editForm");
		}
		
		return mv;
	}
	// 글 삭제
	@RequestMapping("/enquiry_delForm")
	public ModelAndView enquiry_delForm(int no) {
		ModelAndView mv = new ModelAndView();
		EnquiryDAO dao = sqlSession.getMapper(EnquiryDAO.class);
		int cnt = dao.enquiryDelete(no);
		if(cnt > 0) {
			mv.setViewName("redirect:boardEnquiry");
		}else {
			mv.setViewName("redirect:enquiry_listForm");
		}
		
		return mv;
	}
	
	// review
	
	@RequestMapping("/boardReview")
	public String boardReview() {return "board/review";}
	
	@RequestMapping("/review_listForm")
	public String review_listForm() {return "board/review_listForm";}
	
	@RequestMapping("/review_writeForm")
	public String review_writeForm() {return "board/review_writeForm";}
	
	@RequestMapping("/review_editForm")
	public String review_editForm() {return "/board/review_editForm";}
	
	
	// 정확한 ip주소 구하기
	public static String getClientIpAddr(HttpServletRequest request) {
	    String ip = request.getHeader("X-Forwarded-For");
	 
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getRemoteAddr();
	    }
	 
	    return ip;
	}
}
