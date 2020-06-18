package kr.co.bitcamp.board;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
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
	
	@RequestMapping("/boardEnquiry")
	public String boardEnquiry() {return "board/enquiry";}
	
	@RequestMapping("/boardReview")
	public String boardReview() {return "board/review";}
	
	@RequestMapping("/enquiry_listForm")
	public String enquiry_listForm() {return "board/enquiry_listForm";}
	
	@RequestMapping("/review_listForm")
	public String review_listForm() {return "board/review_listForm";}
	
	@RequestMapping("/enquiry_writeForm")
	public String enquiry_writeForm() {return "board/enquiry_writeForm";}
	
	@RequestMapping("/review_writeForm")
	public String review_writeForm() {return "board/review_writeForm";}
	
	@RequestMapping("/enquiry_editForm")
	public String enquiry_editForm() {return "/board/enquiry_editForm";}
	
	@RequestMapping("/review_editForm")
	public String review_editForm() {return "/board/review_editForm";}
	
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
	// 삽입폼으로
	@RequestMapping("/notice_writeForm")
	public String notice_writeForm() {return "board/notice_writeForm";}
	// 삽입
	@RequestMapping(value = "/notice_writeOk", method = RequestMethod.POST)
	public ModelAndView notice_writeOk(NoticeVO vo) {
		ModelAndView mv = new ModelAndView();
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		int cnt = dao.noticeInsert(vo);
		if(cnt > 0) {
			mv.addObject("str", "writeForm");
			mv.setViewName("board/alters");
		}else {
			mv.setViewName("redirect:notice_writeForm");
		}
		
		return mv;
	}
	// 한개 리스트로
	@RequestMapping("/notice_listForm")
	public ModelAndView notice_listForm(int no) {
		ModelAndView mv = new ModelAndView();
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		dao.noticeHit(no);
		mv.addObject("list", dao.list(no));
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
			mv.setViewName("redirect:boardNotice");
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
	// 검색
	/*@RequestMapping("/notice_Search")
	@ResponseBody
	public ModelAndView notice_search(@RequestParam("search") String search, @RequestParam("str")String str) {
		ModelAndView mv = new ModelAndView();
		NoticeDAO dao = sqlSession.getMapper(NoticeDAO.class);
		mv.addObject("list", dao.noticeSearch(search, str));
		mv.setViewName("board/notice");
		
		return mv;
	}*/
	
	// enquiry
	@RequestMapping("/enquiry_writeOk")
	public String enquiry_writeOk() {
		return "";
	}
	
}
