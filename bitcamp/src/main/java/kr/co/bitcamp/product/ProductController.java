package kr.co.bitcamp.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcamp.board.EnquiryVO;
import kr.co.bitcamp.board.ReplyVO;
import kr.co.bitcamp.category.InterestVO;

@Controller
public class ProductController {
	SqlSession sqlSession; // 변수명은 xml에 있는거랑 똑같이 지어야함.

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 장바구니 추가
	@RequestMapping(value = "/productCart")
	public ModelAndView productCart(ProductVO vo, HttpSession session, HttpServletRequest request) {
		HttpSession ses = request.getSession();
		if(ses.getAttribute("userno")!=null) {
			ses.setAttribute("logStatus", "Y");
			int userno = (Integer)(ses.getAttribute("userno"));
			vo.setUserno(userno);
		}else {
			ses.setAttribute("logStatus", "N");
		}
		
		
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductVO> productList = (ArrayList<ProductVO>) (session.getAttribute("productList"));
		// productList가 없을경우 새로 만들어줌
		if (productList == null) {
			productList = new ArrayList<ProductVO>();
			session.setAttribute("productList", productList);
		}
		// 파라미터값을 받아와서 vo에 저장함.
		int p_no = Integer.parseInt(request.getParameter("p_no")); // 제품번호
		int delivery_fee = Integer.parseInt(request.getParameter("delivery_fee")); // 배송비
		String orderStart = request.getParameter("orderStart");// 대여기간 시작날
		String orderEnd = request.getParameter("orderEnd");// 대여기간 마지막날
		String borrowPeriod = request.getParameter("product_borrow_period");// 대여기간
		int zero = 0;
		if (Integer.parseInt(request.getParameter("product_payment")) == 0) {
			vo.setDelivery_fee(zero);
		} else {
			vo.setDelivery_fee(delivery_fee);
		}

		vo.setPeriod(orderStart, orderEnd, borrowPeriod);// 기간 yyyy-mm-dd~yyyy-mm-dd(x박x일)

		// 장바구니에 기존 상품이 있는지 없는지 검사
		for (int i = 0; i < productList.size(); i++) {
			if (p_no == productList.get(i).getP_no()) {
				productList.remove(i);
			}
		}
		// 세션값 추가
		productList.add(vo);
		if(ses.getAttribute("userno")!=null) {
			session.setAttribute("productList", productList);
		}else {
			ses.removeAttribute("productList");
		}
		// mav 설정
		mav.setViewName("redirect:productCartList");
		return mav;
	}
	// 장바구니 수정
	@RequestMapping(value = "/productCartEdit", method = RequestMethod.GET)
	@ResponseBody
	public ProductVO productCartEdit(ProductVO pvo,HttpServletRequest req,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductVO> productList = (ArrayList<ProductVO>) (session.getAttribute("productList"));
		int p_no = Integer.parseInt(req.getParameter("p_no")); // 제품번호
		int Qty = Integer.parseInt(req.getParameter("currentQty"));// 대여 갯수
		System.out.println(p_no);
		System.out.println(Qty);
		for (int i = 0; i < productList.size(); i++) {
			if (p_no == productList.get(i).getP_no()) {
				productList.get(i).setCurrentQty(Qty);
			}
		}
		return pvo;
	}
	
	// 장바구니 리스트 이동
	@RequestMapping(value = "/productCartList")
	public String productCartList(HttpServletRequest req) {
		 
		HttpSession ses = req.getSession();
		if(ses.getAttribute("userno")!=null) {
			ses.setAttribute("logStatus", "Y");
		}else {
			ses.setAttribute("logStatus", "N");
		}
		
		
		
		return "product/productCart";
	}

	// 장바구니 삭제
	@RequestMapping(value = "/deleteCart")
	public String deleteCart(HttpSession session, HttpServletRequest request) {
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		ArrayList<ProductVO> productList = (ArrayList<ProductVO>) (session.getAttribute("productList"));
		for (int i = 0; i < productList.size(); i++) {
			if (p_no == productList.get(i).getP_no()) {
				productList.remove(i);
			}
		}
		return "product/productCart";
	}

////////////////////////관심상품
	@RequestMapping(value = "/productInterest")
	public ModelAndView productInterest(int p_no, HttpServletRequest req) {
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		ModelAndView mav = new ModelAndView();
		HttpSession ses = req.getSession();
		int userno = 0;
		if ((Integer) ses.getAttribute("userno") != null) {
			userno = (Integer) ses.getAttribute("userno");
		}
		if ((Integer) ses.getAttribute("userno") == null) {
			mav.setViewName("redirect:loginFrm");
			return mav;
		}
		InterestVO vo = new InterestVO();
		vo.setUserno(userno);
		vo.setP_no(p_no);
		try {
			System.out.println("관심상품 여부 체크" + dao.allHearts(userno));
			if (dao.allHearts(userno).contains(vo.getP_no())) {
				mav.setViewName("forward:mypageWishList");
				System.out.println("상품번호 존재");
			} else {
				System.out.println("상품번호 추가가능");
				System.out.println(dao.addInterest(vo));
				mav.setViewName("forward:mypageWishList");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("관심상품 추가 에러" + e.getMessage());
			mav.setViewName("forward:mypageWishList");
		}
		return mav;
	}

////////////////////////상품 상세글
	@RequestMapping("/productView")
	public ModelAndView productView(int p_no, EnquiryVO evo) {
		ModelAndView mav = new ModelAndView();
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		mav.addObject("review", dao.allReviewList(p_no));
		mav.addObject("QandA", dao.allQandAList(evo));
		mav.addObject("product", dao.productView(p_no));
		mav.setViewName("product/productView");
		return mav;
	}

	// 몇개까지 가능한지 체크하는거
	@RequestMapping("/availableChk")
	@ResponseBody
	public ProductVO availableChk(HttpServletRequest req) {
		int p_no = Integer.parseInt(req.getParameter("p_no"));
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		ProductVO pvo = dao.productSelect(p_no);

		if (req.getParameter("s_date") != null && req.getParameter("e_date") != null && req.getParameter("s_date") != ""
				&& req.getParameter("e_date") != "") {
			int orderStart = Integer.parseInt(req.getParameter("s_date").replaceAll("-", ""));
			int orderEnd = Integer.parseInt(req.getParameter("e_date").replaceAll("-", ""));
			System.out.println(orderStart + "," + orderEnd);

			ArrayList<Integer> s_noList = (ArrayList<Integer>) dao.productAllSelectProduct(pvo.getP_no());
			ArrayList<Integer> s_noList2 = new ArrayList<Integer>();

			for (int j = 0; j < s_noList.size(); j++) {
				ArrayList<String> dateList = (ArrayList<String>) dao.productAllSelectDate(s_noList.get(j));
				int resultCnt = 0;
				for (int k = 0; k < dateList.size(); k++) {
					for (int l = orderStart; l <= orderEnd; l++) {
						if (Integer.parseInt(dateList.get(k)) == l) {
							resultCnt++;
						}
					}
				}
				if (resultCnt == 0) {
					s_noList2.add(s_noList.get(j));
				}
				resultCnt = 0;
			}
			pvo.setProductCount(s_noList2.size());
			pvo.setS_noList(s_noList2);
		}
		return pvo;
	}

//////////////////////////enquiry 글 땡겨오기
	@RequestMapping("/getReply") ///////////////////// 나중에 태현이거 긁어오기
	@ResponseBody
	public List<ReplyVO> productEnquiry(HttpServletRequest req) {
		int enquiry_no = Integer.parseInt(req.getParameter("no"));
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		List<ReplyVO> asd = dao.replyAll(enquiry_no);
		if(asd.isEmpty()==false){
			System.out.println(asd.get(0).getE_reply_content());
		}else {
			System.out.println("리플이 없음");
		}
		return asd;
	}
}

