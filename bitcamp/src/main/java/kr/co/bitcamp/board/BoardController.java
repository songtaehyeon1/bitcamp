package kr.co.bitcamp.board;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
		HttpSession session = request.getSession();
		if((Integer)session.getAttribute("userno") == null) {
			mv.setViewName("redirect:loginFrm");
			return mv;
		}
		vo.setUserno((Integer)session.getAttribute("userno"));
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
		HttpSession session = request.getSession();
		String adminStatus = (String)session.getAttribute("adminStatus");
		String sUserid = (String)session.getAttribute("userid");
		String enquiry_secret = request.getParameter("enquiry_secret");
		String userid = request.getParameter("userid");
		if(enquiry_secret.equals("N")) {
			if(adminStatus != "Y" && (!userid.equals(sUserid) || userid == null)) {
				mv.addObject("str", "secret");
				mv.setViewName("board/alters");
				
				return mv;
			}
		}
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
		String str = "";
		try {
			list.setP_name(list1.getP_name());
			list.setP_filename1(list1.getP_filename1());
			list.setPrice(list1.getPrice());
		}catch (Exception e) {
			str = "상품을 선택하지 않았습니다.";
		}
		
		mv.addObject("str", str);
		mv.addObject("list", list);
		mv.addObject("pagevo", pagevo);
		mv.setViewName("board/enquiry_listForm");
		
		return mv;
	}
	// 글 한개 댓글들
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
	public String replyWrite(ReplyVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		EnquiryDAO dao = sqlSession.getMapper(EnquiryDAO.class);
		String adminStatus = (String)session.getAttribute("adminStatus");
		int cnt = 0;
		if(adminStatus == "Y") {
			cnt = dao.replyWrite(0, vo.getEnquiry_no(), vo.getE_reply_content());
		}else{
			int userno = (Integer)session.getAttribute("userno");
			cnt = dao.replyWrite(userno, vo.getEnquiry_no(), vo.getE_reply_content());
		}
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
		
		mv.addObject("cateList", dao.enquiryCategory());
		mv.addObject("goods", dao.enquiryUpdateGoods(vo.getC_no()));
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
			mv.addObject("str", "enquiry_editOk");
			mv.setViewName("/board/alters");
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
		dao.enquiryReplyDelete(no);
		int cnt = dao.enquiryDelete(no);
		if(cnt > 0) {
			mv.setViewName("redirect:boardEnquiry");
		}else {
			mv.setViewName("redirect:enquiry_listForm");
		}
		
		return mv;
	}
	
	// review
	// 전체 리스트로
	@RequestMapping("/boardReview")
	public ModelAndView boardReview(HttpServletRequest request) {
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
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		pagevo.setTotalRecord(dao.getTotalRecord(pagevo));
		
		mv.addObject("pagevo", pagevo);
		mv.addObject("list", dao.allList(pagevo));
		mv.setViewName("board/review");
		
		return mv;
	}
	// 글 쓰기 폼
	@RequestMapping("/review_writeForm")
	public ModelAndView review_writeForm() {
		ModelAndView mv = new ModelAndView();
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		mv.addObject("cate", dao.reviewCate());
		mv.setViewName("board/review_writeForm");
		
		return mv;
	}
	// 글 쓰기 폼 상품 가져오기
	@RequestMapping("/review_goods")
	@ResponseBody
	public List<GoodsVO> review_goods(int cate){
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		
		return dao.reviewGoods(cate);
	}
	// 글 쓰기
	@RequestMapping("/review_writeOk")
	public ModelAndView review_writeOk(HttpServletRequest request, ReviewVO vo) {
		String path = request.getSession().getServletContext().getRealPath("/resources/review");

		// request객체로 > MultipartHttpServletRequest생성하여 파일업로드 처리를 한다
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
		
		// mr에서 MultipartFile객체를 얻어와야 된다
		List<MultipartFile> files = mr.getFiles("filename");
		String fileNames[] = new String[5];
		int idx = 0;
		if(files != null) {
			// 업로드할 파일의 수만큼 반복
			for(int i = 0; i < files.size(); i++) {
				MultipartFile mf = files.get(i);
				String fname = mf.getOriginalFilename();	// 업로드한 파일명
				if(fname != null && !fname.equals("")) {
					// 파일명 변경
					File f = new File(path, fname);
					if(f.exists()) {
						for(int j = 0;; j++) {
							String orgFilename = fname.substring(0, fname.lastIndexOf("."));	// 파일명
							String orgExt = fname.substring(fname.lastIndexOf(".") + 1);	// 확장자명
							f = new File(path, orgFilename + j + "." + orgExt);
							if(!f.exists()) {
								fname = orgFilename + j + "." + orgExt;
								break;
							}
						}
					}
					try {
						mf.transferTo(new File(path, fname));
					}catch(Exception e) {
						e.printStackTrace();
					}
					fileNames[idx++] = fname;
				}
			}
			vo.setReview_file1(fileNames[0]);
			vo.setReview_file2(fileNames[1]);
			vo.setReview_file3(fileNames[2]);
			vo.setReview_file4(fileNames[3]);
			vo.setReview_file5(fileNames[4]);
		}
		vo.setUserno((Integer)request.getSession().getAttribute("userno"));
		vo.setReview_ip(getClientIpAddr(request));
		
		ModelAndView mv = new ModelAndView();
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		int result = dao.reviewInsert(vo);
		if(result > 0) {
			mv.addObject("str", "review_writeForm");
			mv.setViewName("board/alters");
		}else {
			// 레코드 추가 실패 시 파일 삭제
			for(int i = 0; i < fileNames.length; i++) {
				if(fileNames[i] != null) {
					deleteFile(path, fileNames[i]);
				}
			}
			mv.setViewName("redirect:review_writeForm");
		}
		
		return mv;
	}
	// 파일 삭제
	public void deleteFile(String path, String file) {
		File f = new File(path, file);
		f.delete();
	}
	// 한개 리스트로
	@RequestMapping("/review_listForm")
	public ModelAndView review_listForm(int no, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		
		PagingVO pagevo = new PagingVO();
		pagevo.setPageNum(Integer.parseInt(request.getParameter("pageNum")));
		pagevo.setSearchKey(request.getParameter("searchKey"));
		pagevo.setSearchWord(request.getParameter("searchWord"));
		pagevo.setReview_no(no);
		dao.reviewHit(no);
		LeadLagVO pnvo = dao.getLeadLagSelect(pagevo);
		
		mv.addObject("vo", dao.list(no));
		mv.addObject("pagevo", pagevo);
		mv.addObject("pnvo", pnvo);
		mv.setViewName("board/review_listForm");
		
		return mv;
	}
	// 글 삭제
	@RequestMapping("/review_delForm")
	public String review_delForm(int no, HttpServletRequest request) {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		ReviewVO vo = dao.listDelete_files(no);
		dao.reviewReplyDelete(no);
		int cnt = dao.listDelete(no);
		if(cnt > 0) {
			String path = request.getSession().getServletContext().getRealPath("/resources/review");
			for(String fName : vo.getFileList()) {
				if(fName != null) {
					File f = new File(path, fName);
					f.delete();
				}
			}
			return "redirect:boardReview";
		}else {
			return "redirect:review_listForm";
		}
	}
	// 댓글 가져오기
	@RequestMapping("/review_reply")
	@ResponseBody
	public List<ReviewReplyVO> review_reply(@RequestParam("review_no") int no){
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		
		return dao.replyAll(no);
	}
	// 댓글 작성
	@RequestMapping("/review_replyWrite")
	@ResponseBody
	public String review_replyWrite(ReviewReplyVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		int userno = (Integer)session.getAttribute("userno");
		int cnt = dao.replyWrite(userno, vo.getReview_no(), vo.getR_reply_content());
		if(cnt > 0) {
			return "댓글이 작성되었습니다.";
		}else {
			return "댓글 작성 실패하였습니다.";
		}
	}
	// 댓글 삭제
	@RequestMapping("/review_replyDel")
	@ResponseBody
	public void review_replyDel(int r_reply_no) {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		dao.replyDel(r_reply_no);
	}
	// 댓글 수정 폼
	@RequestMapping("/review_replyEdit")
	@ResponseBody
	public ReviewReplyVO review_replyEdit(int r_reply_no) {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		
		return dao.replyOne(r_reply_no);
	}
	// 댓글 수정
	@RequestMapping("/review_replyEditOk")
	@ResponseBody
	public void review_replyEditOk(int r_reply_no, String r_reply_content) {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		dao.replyUpdate(r_reply_no, r_reply_content);
	}
	// 글 수정 폼으로
	@RequestMapping("/review_editForm")
	public ModelAndView review_editForm(int no) {
		ModelAndView mv = new ModelAndView();
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		ReviewVO vo = dao.list(no);
		
		mv.addObject("cateList", dao.reviewCategory());
		mv.addObject("goods", dao.reviewGoods(vo.getC_no()));
		mv.addObject("vo", vo);
		mv.setViewName("/board/review_editForm");
		
		return mv;
	}
	// 글 수정에 파일 삭제
	@RequestMapping("/fileDel")
	@ResponseBody
	public String fileDel(HttpServletRequest request, @RequestParam("review_no") int review_no, @RequestParam("filename") String filename, 
			@RequestParam("fileid") String fileid) {
		String path = request.getSession().getServletContext().getRealPath("/resources/review");
		deleteFile(path, filename);
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		dao.reviewEditFileDel(fileid, review_no);

		return "asdsad";
	}
	// 글 수정
	@RequestMapping("/review_edit")
	public ModelAndView review_edit(ReviewVO vo, HttpServletRequest request) {
		
		System.out.println(vo.getReview_file1());
		System.out.println(vo.getReview_file2());
		System.out.println(vo.getReview_file3());
		System.out.println(vo.getReview_file4());
		System.out.println(vo.getReview_file5());
		
		ModelAndView mv = new ModelAndView();
		String path = request.getSession().getServletContext().getRealPath("/resources/review");

		// request객체로 > MultipartHttpServletRequest생성하여 파일업로드 처리를 한다
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
		
		// mr에서 MultipartFile객체를 얻어와야 된다
		List<MultipartFile> files = mr.getFiles("filename");
		String fileNames[] = new String[5];
		int idx = 0;
		if(files != null) {
			// 업로드할 파일의 수만큼 반복
			for(int i = 0; i < files.size(); i++) {
				MultipartFile mf = files.get(i);
				String fname = mf.getOriginalFilename();	// 업로드한 파일명
				if(fname != null && !fname.equals("")) {
					// 파일명 변경
					File f = new File(path, fname);
					if(f.exists()) {
						for(int j = 0;; j++) {
							String orgFilename = fname.substring(0, fname.lastIndexOf("."));	// 파일명
							String orgExt = fname.substring(fname.lastIndexOf(".") + 1);	// 확장자명
							f = new File(path, orgFilename + j + "." + orgExt);
							if(!f.exists()) {
								fname = orgFilename + j + "." + orgExt;
								break;
							}
						}
					}
					try {
						mf.transferTo(new File(path, fname));
					}catch(Exception e) {
						e.printStackTrace();
					}
					fileNames[idx++] = fname;
				}
			}
			for(int i = 0; i < fileNames.length; i++) {
				if(vo.getReview_file1() == null) {
					vo.setReview_file1(fileNames[i]);
				}else if(vo.getReview_file2() == null) {
					vo.setReview_file2(fileNames[i]);
				}else if(vo.getReview_file3() == null) {
					vo.setReview_file3(fileNames[i]);
				}else if(vo.getReview_file4() == null) {
					vo.setReview_file4(fileNames[i]);
				}else if(vo.getReview_file5() == null) {
					vo.setReview_file5(fileNames[i]);
				}
			}
		}
		
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		int cnt = dao.reviewUpdate(vo);
		if(cnt > 0) {
			mv.addObject("str", "review_edit");
			mv.setViewName("/board/alters");
		}else {
			for(String delFile : fileNames) {
				// 파일 삭제
				if(delFile != null) {
					File f = new File(path, delFile);
					f.delete();
				}
			}
			mv.addObject("vo", vo);
			mv.setViewName("redirect:boardReview");
		}
		
		return mv;
	}
	// 추천수 올리기
	@RequestMapping("/review_recommend")
	@ResponseBody
	public int review_recommend(@RequestParam("review_no") int review_no, HttpServletRequest request) {
		ReviewDAO dao = sqlSession.getMapper(ReviewDAO.class);
		String ip = getClientIpAddr(request);
		if(dao.reviewRecommendIp(review_no, ip) <= 0) {
			dao.reviewRecommendUpdate(review_no);
			dao.reviewRecommendIpUpdate(review_no, ip);
		}
		
		return dao.reviewRecommendSelect(review_no);
	}
	
	
	
	
	
	
	
	
	
	
	
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
