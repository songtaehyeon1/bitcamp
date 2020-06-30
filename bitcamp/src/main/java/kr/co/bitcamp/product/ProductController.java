package kr.co.bitcamp.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcamp.order.OrderDAOImp;

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
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductVO> productList = (ArrayList<ProductVO>) (session.getAttribute("productList"));
		// productList가 없을경우 새로 만들어줌
		if (productList == null) {
			productList = new ArrayList<ProductVO>();
			session.setAttribute("productList", productList);
		}
		// 파라미터값을 받아와서 vo에 저장함.
		int p_no = Integer.parseInt(request.getParameter("p_no")); // 제품번호
		String p_name = request.getParameter("p_name"); // 제품명
		int delivery_fee = Integer.parseInt(request.getParameter("delivery_fee")); // 배송비
		String orderStart = request.getParameter("orderStart");// 대여기간 시작날
		String orderEnd = request.getParameter("orderEnd");// 대여기간 마지막날
		String borrowPeriod = request.getParameter("product_borrow_period");// 대여기간
		String filename = request.getParameter("p_filename1");// 사진파일1
		int price = Integer.parseInt(request.getParameter("price"));// 대여가격
		int Qty = Integer.parseInt(request.getParameter("currentQty"));// 대여 갯수
		int limitQuantity = Integer.parseInt(request.getParameter("limitQuantity"));//제품 최대 대여 가능 갯수
		vo.setP_no(p_no);
		vo.setP_name(p_name);
		vo.setOrderStart(orderStart);
		vo.setOrderEnd(orderEnd);
		vo.setProduct_borrow_period(borrowPeriod);
		vo.setP_filename1(filename);
		vo.setPrice(price);
		vo.setCurrentQty(Qty);
		vo.setLimitQuantity(limitQuantity);
		int zero = 0;
		if (Integer.parseInt(request.getParameter("product_payment")) == 0) {
			vo.setDelivery_fee(zero);
		} else {
			vo.setDelivery_fee(delivery_fee);
		}

		vo.setTotal_price(vo.getDelivery_fee(), price);// 전체 가격
		vo.setPeriod(orderStart, orderEnd, borrowPeriod);// 기간 yyyy-mm-dd~yyyy-mm-dd(x박x일)

		// 장바구니에 기존 상품이 있는지 없는지 검사
		for (int i = 0; i < productList.size(); i++) {
			if (p_no == productList.get(i).getP_no()) {
				productList.remove(i);
			}
		}
		// 세션값 추가
		productList.add(vo);
		session.setAttribute("productList", productList);

		// mav 설정
		mav.setViewName("redirect:productCartList");
		return mav;
	}

	// 장바구니 리스트 이동
	@RequestMapping(value = "/productCartList")
	public String productCartList() {
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
	public String productInterest() {
		return "product/productInterest";
	}

////////////////////////상품 상세글
	@RequestMapping("/productView")
	public ModelAndView productView(int p_no) {
		ModelAndView mav = new ModelAndView();
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		mav.addObject("product", dao.productView(p_no));
		mav.setViewName("product/productView");
		return mav;
	}

/////////////////////////상품 리스트
	@RequestMapping("/productList")
	public ModelAndView productList() {
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.allSelectRecord());
		mav.setViewName("product/productList");
		return mav;
	}


<<<<<<< HEAD
=======
	@RequestMapping(value = "/productWrite")
	public String productWrite() {
		return "product/productWrite";
	}
>>>>>>> master

//////////////////////////// review 글 땡겨오기
//	   @RequestMapping("/productReview")/////////////////////나중에 태현이거 긁어오기
//		public ModelAndView productReview() {
//			ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
//			ModelAndView mav = new ModelAndView();
//			mav.addObject("list", dao.allSelectRecord());
//			mav.setViewName("product/productList");
//			return mav;
//		}

//////////////////////////// enquiry 글 땡겨오기
//	   @RequestMapping("/productEnquiry")/////////////////////나중에 태현이거 긁어오기
//		public ModelAndView productEnquiry() {
//			ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
//			ModelAndView mav = new ModelAndView();
//			mav.addObject("list", dao.allSelectRecord());
//			mav.setViewName("product/productList");
//			return mav;
//		}

	@RequestMapping("/availableChk")
	@ResponseBody
	public ProductVO availableChk(HttpServletRequest req) {
        System.out.println(req.getParameter("p_no"));
        System.out.println(req.getParameter("s_date").replaceAll("-", ""));
        System.out.println(req.getParameter("e_date").replaceAll("-", ""));
        int p_no = Integer.parseInt(req.getParameter("p_no"));
        
        ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
        ProductVO pvo = dao.productSelect(p_no);

		if (req.getParameter("s_date") != null && req.getParameter("e_date") != null && req.getParameter("s_date") != "" && req.getParameter("e_date") != "") {
			int orderStart = Integer.parseInt(req.getParameter("s_date").replaceAll("-", "")); 
			int orderEnd = Integer.parseInt(req.getParameter("e_date").replaceAll("-", "")); 
			ArrayList<Integer> s_noList = (ArrayList<Integer>) dao.productAllSelectProduct(pvo.getP_no()); 
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
				if (resultCnt > 0) {
					s_noList.remove(j);
				}
				resultCnt = 0;
			}
			pvo.setProductCount(s_noList.size()); 
			pvo.setS_noList(s_noList);		
			
		}
        
        return pvo;
	}

}
