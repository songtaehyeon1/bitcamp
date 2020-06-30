package kr.co.bitcamp.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.google.gson.JsonObject;

import kr.co.bitcamp.category.CategoryVO;
import kr.co.bitcamp.member.MemberVO;
import kr.co.bitcamp.product.ProductDAOImp;
import kr.co.bitcamp.product.ProductVO;

@Controller
public class AdminController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping("/admin")
	public String goAdminlogin(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		ses.setAttribute("adminStatus", "N");
		return "admin/adminLogin";
	}

	@RequestMapping("/admin/home")
	public String goAdminHome() {

		return "admin/adminHome";
	}

/////////////////////////관리자 로그인
	@RequestMapping("/adminLoginOk")
	public ModelAndView goAdminLoginOk(HttpServletRequest req, AdminLoginVO vo) {
		HttpSession ses = req.getSession();
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		AdminLoginVO vo2 = dao.adminLogin(vo);
		ModelAndView mav = new ModelAndView();
//		System.out.println(vo2.getAdminId());
//		System.out.println(vo2.getAdminpwd());
		if (vo2 == null) {
			mav.setViewName("redirect:admin");
		} else {
			ses.setAttribute("adminStatus", "Y");
			mav.setViewName("admin/adminHome");
		}
		return mav;
	}
/////////////////////////회원

	// 회원리스트
	@RequestMapping("/admin/member")
	public ModelAndView goAdminMember(HttpServletRequest request) {
		String pageNumStr = request.getParameter("pageNum");
		PagingVO pagevo = new PagingVO();

		if (pageNumStr != null) {
			pagevo.setPageNum(Integer.parseInt(pageNumStr));
		}

		// 검색키, 검색어 request
		pagevo.setSearchKey(request.getParameter("searchKey"));
		pagevo.setSearchWord(request.getParameter("searchWord"));
		if (request.getParameter("userno") != null && request.getParameter("userno") != "") {
			pagevo.setUserno(Integer.parseInt(request.getParameter("userno")));
		}
		pagevo.setS_date(request.getParameter("s_date"));
		pagevo.setE_date(request.getParameter("e_date"));

		ModelAndView mav = new ModelAndView();
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		pagevo.setTotalRecord(dao.getTotalMemberRecord(pagevo));
		mav.addObject("pagevo", pagevo);
		mav.addObject("list", dao.allMemberList(pagevo));
		mav.setViewName("admin/adminMember");
		return mav;
	}

	// 회원가입
	@RequestMapping("/admin/memberJoin")
	public String goAdminJoin() {

		return "admin/adminJoin";
	}
	//회원 탈퇴처리
	@RequestMapping("/admin/memberDel")
	public ModelAndView goMemberDel(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		String[] list = req.getParameterValues("chk");
		for(int i=0;i<list.length;i++) {
			int userno = Integer.parseInt(list[i]);
			MemberVO vo = dao.selectMember(userno);
			dao.insertMemberDel(vo);
			dao.delMember(userno);
		}
		mav.setViewName("redirect:member");		
		return mav;
	}
	// 회원삭제 리스트
	@RequestMapping("/admin/memberdellist")
	public ModelAndView goAdminMemberDellist(HttpServletRequest request) {
		String pageNumStr = request.getParameter("pageNum");
		PagingVO pagevo = new PagingVO();
		if (pageNumStr != null) {
			pagevo.setPageNum(Integer.parseInt(pageNumStr));
		}

		// 검색키, 검색어 request
		pagevo.setSearchKey(request.getParameter("searchKey"));
		pagevo.setSearchWord(request.getParameter("searchWord"));
		if (request.getParameter("userno") != null && request.getParameter("userno") != "") {
			pagevo.setUserno(Integer.parseInt(request.getParameter("userno")));
		}
		pagevo.setS_date(request.getParameter("s_date"));
		pagevo.setE_date(request.getParameter("e_date"));

		ModelAndView mav = new ModelAndView();
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		pagevo.setTotalRecord(dao.getTotalWithdrawalRecord(pagevo));
		mav.addObject("pagevo", pagevo);
		mav.addObject("list", dao.allWithdrawalList(pagevo));
		mav.setViewName("admin/adminMemberDellist");
		return mav;
	}

///////////////////////////주문
	@RequestMapping("/admin/orderList")
	public String goAdminOrderlist() {

		return "admin/adminOrderList";
	}

//////////////////////상품	
	// 상품 리스트
	@RequestMapping("/admin/product")
	public ModelAndView goAdminProduct(HttpServletRequest request) {
		// 페이지 번호 구하기
		String pageNumStr = request.getParameter("pageNum");
		PagingVO pagevo = new PagingVO();

		// 페이지 번호 전송된 경우 페이지 번호를 변경한다
		if (pageNumStr != null) {
			pagevo.setPageNum(Integer.parseInt(pageNumStr));
		}

		// 검색키, 검색어 request
		pagevo.setSearchKey(request.getParameter("searchKey"));
		pagevo.setSearchWord(request.getParameter("searchWord"));
		if (request.getParameter("c_no") != null && request.getParameter("c_no") != "") {
			pagevo.setC_no(Integer.parseInt(request.getParameter("c_no")));
		}

		pagevo.setS_date(request.getParameter("s_date"));
		pagevo.setE_date(request.getParameter("e_date"));
		pagevo.setP_deltype(request.getParameter("p_deltype"));		
		ModelAndView mav = new ModelAndView();
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);

		pagevo.setTotalRecord(dao.getTotalRecord(pagevo));

		List<CategoryVO> clist = dao.allCategorySelect();
		mav.addObject("pagevo", pagevo);
		mav.addObject("list", dao.allList(pagevo));
		mav.addObject("clist", clist);
		mav.setViewName("admin/adminProductList");
		return mav;
	}
	
	@RequestMapping("/admin/stocklist")
	public ModelAndView goInsertStock(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String pageNumStr = request.getParameter("pageNum");
		PagingVO pagevo = new PagingVO();
		// 페이지 번호 전송된 경우 페이지 번호를 변경한다
		if (pageNumStr != null) {
			pagevo.setPageNum(Integer.parseInt(pageNumStr));
		}		
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		pagevo.setS_deltype(request.getParameter("s_deltype"));
		pagevo.setP_no(Integer.parseInt(request.getParameter("p_no")));
		pagevo.setTotalRecord(dao.getTotalStockRecord(pagevo));
		List<CategoryVO> clist = dao.allCategorySelect();
		List<StockVO> list = dao.allStockList(pagevo);
		ProductVO pvo = dao.productSelect(Integer.parseInt(request.getParameter("p_no")));

		if (request.getParameter("s_date") != null && request.getParameter("e_date") != null && request.getParameter("s_date") != "" && request.getParameter("e_date") != "") {
			int orderStart = Integer.parseInt(request.getParameter("s_date").replaceAll("-", "")); // i번째 상품의 오더 시작 날짜
			int orderEnd = Integer.parseInt(request.getParameter("e_date").replaceAll("-", "")); // i번째 상품의 오더 끝 날짜
			ArrayList<Integer> s_noList = (ArrayList<Integer>) dao.allSelectProduct(pvo.getP_no()); // i번째 상품의 재고 코드 리스트
			for (int j = 0; j < s_noList.size(); j++) { // i번째 상품의 재고 코드 리스트 만큼 반복
				ArrayList<String> dateList = (ArrayList<String>) dao.allSelectDate(s_noList.get(j));// i번째 상품의 재고 코드
																									// 리스트의 j번째 재고코드의
																									// 예약날짜 리스트 얻어옴
				int resultCnt = 0;
				for (int k = 0; k < dateList.size(); k++) {
					for (int l = orderStart; l <= orderEnd; l++) {
						if (Integer.parseInt(dateList.get(k)) == l) {
							resultCnt++;
						}
					}
				}
				if (resultCnt > 0) {
					s_noList.remove(j);
				}
				resultCnt = 0;
			}
			pvo.setProductCount(s_noList.size()); // 갯수
			pvo.setS_noList(s_noList); // 가능한 재고코드 리스트			
			
		}

		mav.addObject("pagevo", pagevo);
		mav.addObject("list", list);
		mav.addObject("pvo", pvo);
		mav.addObject("clist", clist);
		mav.setViewName("admin/adminProductStock");
		return mav;
	}
	@RequestMapping("/admin/addStock")
	public ModelAndView goaddStock(HttpServletRequest req) {
		int p_no = Integer.parseInt(req.getParameter("p_no"));
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		int sno_sq = dao.getsno_sq();
		ProductVO pvo = dao.productSelect(p_no);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pvo", pvo);
		mav.addObject("sno_sq", sno_sq);
		mav.setViewName("admin/adminAddStock");
		return mav;
	}
	@RequestMapping("/admin/addStockOk")
	public ModelAndView goAddStockOk(HttpServletRequest req) {
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		ModelAndView mav = new ModelAndView();
		String note = req.getParameter("note");
		int p_no = Integer.parseInt(req.getParameter("p_no"));
		int cnt = dao.addStock(p_no, note);
		mav.addObject("p_no", p_no);
		if(cnt>0) {
			mav.setViewName("redirect:stocklist");
		}else {			
			mav.setViewName("redirect:addStock");
		}
		return mav;
	}
	@RequestMapping("/admin/stockDel")
	public ModelAndView goStockDel(HttpServletRequest req) {
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		String[] list = req.getParameterValues("chk");
		for(int i=0;i<list.length;i++) {
			int s_no = Integer.parseInt(list[i]);
			dao.delstock(s_no);
		}
		mav.addObject("p_no", req.getParameter("p_no"));
		mav.setViewName("redirect:stocklist");
		return mav;
	}
	@RequestMapping("/admin/stockRestore")
	public ModelAndView goStockRestore(HttpServletRequest req) {
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		String[] list = req.getParameterValues("chk");
		for(int i=0;i<list.length;i++) {
			int s_no = Integer.parseInt(list[i]);
			dao.restoreStock(s_no);
		}
		mav.addObject("p_no", req.getParameter("p_no"));
		mav.setViewName("redirect:stocklist");
		return mav;
	}

	@RequestMapping("/admin/productCategory")
	public ModelAndView goAdminProductCategory() {
		ModelAndView mav = new ModelAndView();
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		List<CategoryVO> list = dao.allCategorySelect();
		mav.addObject("list", list);
		mav.setViewName("admin/adminCategory");
		return mav;
	}

	@RequestMapping(value = "/admin/selectCategory", method = RequestMethod.GET)
	@ResponseBody
	public CategoryVO ajaxCategorySelect(int c_no) {
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		CategoryVO vo = dao.selectCategory(c_no);
		vo.setCnt(dao.cntCategoryProduct(c_no));
		return vo;
	}

	@RequestMapping(value = "/admin/delimg", method = RequestMethod.GET)
	@ResponseBody
	public int ajaxdelpic(int p_no, String type, String name, HttpServletRequest req) {
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		String path = req.getSession().getServletContext().getRealPath("/upload");
		int cnt = dao.delimg(p_no, type);
		if (cnt > 0) {
			deleteFile(path, name);
		}

		return cnt;
	}

	@RequestMapping("/admin/updateCategory")
	public ModelAndView goAdminupdateCategory(CategoryVO vo) {
		ModelAndView mav = new ModelAndView();
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		int cnt = dao.updateCategory(vo);
		mav.addObject("cnt", cnt);
		mav.setViewName("admin/adminCategoryUpdateOk");
		return mav;
	}

	@RequestMapping("/admin/insertProduct")
	public ModelAndView goAdminInsertProduct() {
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		List<CategoryVO> list = dao.allCategorySelect();
		ModelAndView mav = new ModelAndView();
		mav.addObject("clist", list);
		mav.setViewName("admin/adminInsertProduct");
		return mav;
	}

	//// ckeditor 이미지 업로드
	@RequestMapping(value = "/imageUpload", method = RequestMethod.POST)
	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) {

		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String path = request.getSession().getServletContext().getRealPath("/ckupload/");

		File folder = new File(path);
		if (!folder.exists()) {
			try {
				folder.mkdir();// 폴더 안만들었을시 폴더 생성
			} catch (Exception e) {
				System.out.println("파일 저장 폴더를 생성하는데 실패함." + e.getMessage());
				e.printStackTrace();
			}
		} else {
			System.out.println("폴더가 이미 존재해서 따로 안만들어도 됨.");
		}

		try {

			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			String uploadPath = path + fileName;// 저장경로
			System.out.println(uploadPath);
			out = new FileOutputStream(new File(uploadPath));
			out.write(bytes);

			printWriter = response.getWriter();
			String fileUrl = "/bitcamp/ckupload/" + fileName;// url경로

			JsonObject json = new JsonObject();
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", fileName);
			json.addProperty("url", fileUrl);
			printWriter.println(json);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}

/////////////////////////////////////// 상품글 쓰기
	@RequestMapping(value = "/productWirteOk", method = RequestMethod.POST)
	public ModelAndView productWriteOk(ProductVO vo, HttpServletRequest req) {
// request객체로 --> MultipartHttpServletRequest생성하여 파일 업로드 처리를 한다.
		String path = req.getSession().getServletContext().getRealPath("/upload");
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		List<MultipartFile> fileList = mr.getFiles("p_filename");
		String p_filenames[] = new String[5];

		File folder = new File(path);
		if (!folder.exists()) {
			try {
				folder.mkdir();// 폴더 안만들었을시 폴더 생성
			} catch (Exception e) {
				System.out.println("파일 저장 폴더를 생성하는데 실패함." + e.getMessage());
				e.printStackTrace();
			}
		} else {
			System.out.println("폴더가 이미 존재해서 따로 안만들어도 됨.");
		}
		int idx = 0;
		if (fileList != null) {
			for (int i = 0; i < fileList.size(); i++) {// 업로드할 파일의 수만큼 반복처리
				MultipartFile mf = fileList.get(i);
// 업로드한 파일명
				String fname = mf.getOriginalFilename();
				if (fname != null && !fname.equals("")) {
// 파일명 변경하기
					File f = new File(path, fname);

					if (f.exists()) {// 파일이 존재함
						for (int renameNum = 1;; renameNum++) {
							String orgFilename = fname.substring(0, fname.lastIndexOf("."));// 파일명 (확장자 뺀)
							String orgExt = fname.substring(fname.lastIndexOf(".") + 1);// 확장자명
							f = new File(path, orgFilename + "(" + renameNum + ")" + "." + orgExt);

							if (!f.exists()) {// 파일이 존재 안하면
								fname = orgFilename + "(" + renameNum + ")" + "." + orgExt;
								break;
							}
						}
					}
					try {
						mf.transferTo(new File(path, fname));
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("파일 업로드 에러" + e.getMessage());
					}
					p_filenames[idx++] = fname;
				}
			}
			// vo에 파일명 저장

			vo.setP_filename1(p_filenames[0]);
			vo.setP_filename2(p_filenames[1]);
			vo.setP_filename3(p_filenames[2]);
			vo.setP_filename4(p_filenames[3]);
			vo.setP_filename5(p_filenames[4]);
			if ((vo.getDelivery_fee()) == -1) {
				System.out.println("배송비 직접 입력");
				vo.setDelivery_fee(vo.getDelivery_fee_direct());
				System.out.println(vo.getDelivery_fee());
			}
		}

		ModelAndView mav = new ModelAndView();
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		int result = dao.productWrite(vo);
		if (result > 0) {
			mav.setViewName("redirect:admin/product");
		} else {
			for (int i = 0; i < p_filenames.length; i++) {
				if (p_filenames[i] != null) {
					deleteFile(path, p_filenames[i]);
				}
			}
			mav.setViewName("redirect:admin/insertProduct");
		}
		return mav;
	}

	public void deleteFile(String p, String f) {// 파일삭제
		File fn = new File(p, f);
		fn.delete();
	}

	@RequestMapping(value = "/updateProduct", method = RequestMethod.GET)
	public ModelAndView productUpdate(HttpServletRequest req) {
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		List<CategoryVO> list = dao.allCategorySelect();
		ProductVO vo = dao.productSelect(Integer.parseInt(req.getParameter("p_no")));
		ModelAndView mav = new ModelAndView();
		mav.addObject("clist", list);
		mav.addObject("vo", vo);
		mav.setViewName("admin/adminUpdateProduct");
		return mav;
	}

	@RequestMapping(value = "/updateProductOk", method = RequestMethod.POST)
	public ModelAndView productUpdateOk(ProductVO vo, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("/upload");
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		String p_filenames[] = new String[5];
		File folder = new File(path);
		if (!folder.exists()) {
			try {
				folder.mkdir();// 폴더 안만들었을시 폴더 생성
			} catch (Exception e) {
				System.out.println("파일 저장 폴더를 생성하는데 실패함." + e.getMessage());
				e.printStackTrace();
			}
		} else {
			System.out.println("폴더가 이미 존재해서 따로 안만들어도 됨.");
		}
		MultipartFile mainMF = mr.getFile("p_mainfile");
		if (mainMF != null) {
			String fname = mainMF.getOriginalFilename();
			if (fname != null && !fname.equals("")) {
				// 파일명 변경하기
				File f = new File(path, fname);

				if (f.exists()) {// 파일이 존재함
					for (int renameNum = 1;; renameNum++) {
						String orgFilename = fname.substring(0, fname.lastIndexOf("."));// 파일명 (확장자 뺀)
						String orgExt = fname.substring(fname.lastIndexOf(".") + 1);// 확장자명
						f = new File(path, orgFilename + "(" + renameNum + ")" + "." + orgExt);

						if (!f.exists()) {// 파일이 존재 안하면
							fname = orgFilename + "(" + renameNum + ")" + "." + orgExt;
							break;
						}
					}
				}
				try {
					mainMF.transferTo(new File(path, fname));
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("파일 업로드 에러" + e.getMessage());
				}
				vo.setP_filename1(fname);
				System.out.println(fname);
				p_filenames[0] = fname;
			}
		}

		MultipartFile filename2 = mr.getFile("filename2");
		if (filename2 != null) {
			String fname = filename2.getOriginalFilename();
			if (fname != null && !fname.equals("")) {
				// 파일명 변경하기
				File f = new File(path, fname);

				if (f.exists()) {// 파일이 존재함
					for (int renameNum = 1;; renameNum++) {
						String orgFilename = fname.substring(0, fname.lastIndexOf("."));// 파일명 (확장자 뺀)
						String orgExt = fname.substring(fname.lastIndexOf(".") + 1);// 확장자명
						f = new File(path, orgFilename + "(" + renameNum + ")" + "." + orgExt);

						if (!f.exists()) {// 파일이 존재 안하면
							fname = orgFilename + "(" + renameNum + ")" + "." + orgExt;
							break;
						}
					}
				}
				try {
					filename2.transferTo(new File(path, fname));
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("파일 업로드 에러" + e.getMessage());
				}
				vo.setP_filename2(fname);
				p_filenames[1] = fname;
			}
		}

		MultipartFile filename3 = mr.getFile("filename3");
		if (filename3 != null) {
			String fname = filename3.getOriginalFilename();
			if (fname != null && !fname.equals("")) {
				// 파일명 변경하기
				File f = new File(path, fname);

				if (f.exists()) {// 파일이 존재함
					for (int renameNum = 1;; renameNum++) {
						String orgFilename = fname.substring(0, fname.lastIndexOf("."));// 파일명 (확장자 뺀)
						String orgExt = fname.substring(fname.lastIndexOf(".") + 1);// 확장자명
						f = new File(path, orgFilename + "(" + renameNum + ")" + "." + orgExt);

						if (!f.exists()) {// 파일이 존재 안하면
							fname = orgFilename + "(" + renameNum + ")" + "." + orgExt;
							break;
						}
					}
				}
				try {
					filename3.transferTo(new File(path, fname));
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("파일 업로드 에러" + e.getMessage());
				}
				vo.setP_filename3(fname);
				p_filenames[2] = fname;
			}
		}

		MultipartFile filename4 = mr.getFile("filename4");
		if (filename4 != null) {
			String fname = filename4.getOriginalFilename();
			if (fname != null && !fname.equals("")) {
				// 파일명 변경하기
				File f = new File(path, fname);

				if (f.exists()) {// 파일이 존재함
					for (int renameNum = 1;; renameNum++) {
						String orgFilename = fname.substring(0, fname.lastIndexOf("."));// 파일명 (확장자 뺀)
						String orgExt = fname.substring(fname.lastIndexOf(".") + 1);// 확장자명
						f = new File(path, orgFilename + "(" + renameNum + ")" + "." + orgExt);

						if (!f.exists()) {// 파일이 존재 안하면
							fname = orgFilename + "(" + renameNum + ")" + "." + orgExt;
							break;
						}
					}
				}
				try {
					filename4.transferTo(new File(path, fname));
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("파일 업로드 에러" + e.getMessage());
				}
				vo.setP_filename4(fname);
				p_filenames[3] = fname;
			}
		}

		MultipartFile filename5 = mr.getFile("filename5");
		if (filename5 != null) {
			String fname = filename5.getOriginalFilename();
			if (fname != null && !fname.equals("")) {
				// 파일명 변경하기
				File f = new File(path, fname);

				if (f.exists()) {// 파일이 존재함
					for (int renameNum = 1;; renameNum++) {
						String orgFilename = fname.substring(0, fname.lastIndexOf("."));// 파일명 (확장자 뺀)
						String orgExt = fname.substring(fname.lastIndexOf(".") + 1);// 확장자명
						f = new File(path, orgFilename + "(" + renameNum + ")" + "." + orgExt);

						if (!f.exists()) {// 파일이 존재 안하면
							fname = orgFilename + "(" + renameNum + ")" + "." + orgExt;
							break;
						}
					}
				}
				try {
					filename5.transferTo(new File(path, fname));
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("파일 업로드 에러" + e.getMessage());
				}
				vo.setP_filename5(fname);
				p_filenames[4] = fname;
			}
		}

		if ((vo.getDelivery_fee()) == -1) {
			System.out.println("배송비 직접 입력");
			vo.setDelivery_fee(vo.getDelivery_fee_direct());
			System.out.println(vo.getDelivery_fee());
		}

		ModelAndView mav = new ModelAndView();
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		int result = dao.productEdit(vo);

		if (result > 0) {
			mav.setViewName("redirect:admin/product");
		} else {
			for (int i = 0; i < p_filenames.length; i++) {
				if (p_filenames[i] != null) {
					deleteFile(path, p_filenames[i]);
				}
			}
			mav.setViewName("redirect:admin/product");
		}
		return mav;
	}

}
