package kr.co.bitcamp.order;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcamp.admin.AdminDAOImp;
import kr.co.bitcamp.admin.BasicinfoVO;
import kr.co.bitcamp.member.MemberVO;
import kr.co.bitcamp.member.MypageDAO;
import kr.co.bitcamp.product.ProductDAOImp;
import kr.co.bitcamp.product.ProductVO;

@Controller
public class OrderController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 장바구니에서 구매하기
	@RequestMapping(value = "/cartOrder", method = RequestMethod.POST)
	public ModelAndView cartOrder(HttpServletRequest req, MemberVO mvo) {
		HttpSession ses = req.getSession();
		ModelAndView mav = new ModelAndView();
		int userno = 0;
		if(ses.getAttribute("userno")!=null) {
			userno = (Integer) (ses.getAttribute("userno"));
			System.out.println("유저넘버"+userno);
			ses.setAttribute("logStatus", "Y");
			mvo.setUserno(userno);
		}else {
			ses.setAttribute("logStatus", "N");
		}
		OrderDAOImp orderdao = sqlSession.getMapper(OrderDAOImp.class);
		AdminDAOImp admindao = sqlSession.getMapper(AdminDAOImp.class);
		BasicinfoVO bvo = admindao.basicinfoselect();
		ArrayList<ProductVO> pvolist = new ArrayList<ProductVO>();
		String[] p_noList = req.getParameterValues("p_no");
		String[] p_name = req.getParameterValues("p_name");
		String[] orderStart = req.getParameterValues("orderStart");
		String[] orderEnd = req.getParameterValues("orderEnd");
		String[] borrowPeriod = req.getParameterValues("borrowPeriod");
		String[] filename = req.getParameterValues("filename");
		String[] price = req.getParameterValues("price");
		String[] quantity = req.getParameterValues("quantity");
		String[] delivery_fee = req.getParameterValues("delivery_fee");
		String[] limitQuantity = req.getParameterValues("limitQuantity");
		for (int i = 0; i < p_noList.length; i++) {
			ProductVO vo = new ProductVO();
			vo.setP_no(Integer.parseInt(p_noList[i]));
			vo.setP_name(p_name[i]);
			vo.setOrderStart(orderStart[i]);
			vo.setOrderEnd(orderEnd[i]);
			vo.setProduct_borrow_period(borrowPeriod[i]);
			vo.setP_filename1(filename[i]);
			vo.setPrice(Integer.parseInt(price[i]));
			vo.setDelivery_fee(Integer.parseInt(delivery_fee[i]));
			vo.setCurrentQty(Integer.parseInt(quantity[i]));
			vo.setLimitQuantity(Integer.parseInt(limitQuantity[i]));
			pvolist.add(i, vo);
		}
		mav.addObject("memberInfo",orderdao.selectMember(userno));
		System.out.println("유저 정보 가져오기"+orderdao.selectMember(userno));
		mav.addObject("bvo", bvo);
		mav.addObject("cart", pvolist);
		mav.setViewName("order/orderForm_cart");
		return mav;
	}

	// 바로 구매하기
	@RequestMapping(value = "/orderDirect", method = RequestMethod.POST)
	public ModelAndView order(HttpServletRequest req, int p_no, ProductVO pvo,MemberVO mvo,OrderVO ovo) {
		HttpSession ses = req.getSession();
		int userno = 0;
		if(ses.getAttribute("userno")!=null) {
			userno = (Integer) (ses.getAttribute("userno"));
			System.out.println("유저넘버"+userno);
			ses.setAttribute("logStatus", "Y");
			mvo.setUserno(userno);
		}else {
			ses.setAttribute("logStatus", "N");
		}
		
		OrderDAOImp orderdao = sqlSession.getMapper(OrderDAOImp.class);
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		AdminDAOImp admindao = sqlSession.getMapper(AdminDAOImp.class);
		BasicinfoVO bvo = admindao.basicinfoselect();
		ModelAndView mav = new ModelAndView();
		// 파라미터값을 받아와서 vo에 저장함.

		int delivery_fee = Integer.parseInt(req.getParameter("delivery_fee")); // 배송비
		String orderStart = req.getParameter("orderStart");// 대여기간 시작날
		String orderEnd = req.getParameter("orderEnd");// 대여기간 마지막날
		String borrowPeriod = req.getParameter("product_borrow_period");// 대여기간

		int zero = 0;
		if (Integer.parseInt(req.getParameter("product_payment")) == 0) {
			pvo.setDelivery_fee(zero);
		} else if (req.getParameter("product_payment") == "1") {
			pvo.setDelivery_fee(delivery_fee);
		}
		pvo.setPeriod(orderStart, orderEnd, borrowPeriod);// 기간 yyyy-mm-dd~yyyy-mm-dd(x박x일)
		
		mav.addObject("memberInfo",orderdao.selectMember(userno));
		System.out.println("유저 정보 가져오기"+orderdao.selectMember(userno));
		mav.addObject("bvo", bvo);
		mav.addObject("vo", pvo);
		mav.addObject("product", dao.productView(p_no));
		mav.setViewName("order/orderForm");
		return mav;
	}

	// 바로구매하기 완료
	@RequestMapping("/orderOk")
	public ModelAndView orderOk(HttpServletRequest req, ProductVO pvo, OrderVO ovo) throws ParseException {
		HttpSession ses = req.getSession();
		ModelAndView mav = new ModelAndView();
		OrderDAOImp dao = sqlSession.getMapper(OrderDAOImp.class);
		if(ses.getAttribute("userno")!=null) {
			ses.setAttribute("logStatus", "Y");
			int userno = (Integer)(ses.getAttribute("userno"));
			ovo.setUserno(userno);
		}else {
			ses.setAttribute("logStatus", "N");
		}
		//카드 주문 정보 저장
		ovo.setImp_uid(req.getParameter("imp_uid"));
		ovo.setBuyer_name(req.getParameter("buyer_name"));
		ovo.setMerchant_uid(req.getParameter("merchant_uid"));
		ovo.setCard_corp(req.getParameter("card_name"));
		ovo.setApply_num(req.getParameter("apply_num"));
		ovo.setBuyer_email(req.getParameter("buyer_email"));
		ovo.setBuyer_tel(req.getParameter("buyer_tel"));
		ovo.setFormattedTime(req.getParameter("formattedTime"));
		ovo.setPaid_amount(req.getParameter("paid_amount"));
		
	
		/// 오더넘버에 난수 넣기.......굳이 필요 없었지만...
		String ono_sq = dao.orderNumber(ovo);
		String uuid_ono = UUID.randomUUID().toString();
		String o_no = uuid_ono.replaceAll("-", "");
		o_no = o_no.substring(0, 12);// o_no 난수
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
		Date date = new Date();
		String time = dateFormat.format(date);// 오늘 날짜
		o_no = (ono_sq + "_" + time + "_" + o_no);
		ovo.setO_no(o_no);
		pvo.setO_no(o_no);
		// 재고 확인
		int orderStart = Integer.parseInt(pvo.getOrderStart().replaceAll("-", "")); // i번째 상품의 오더 시작 날짜
		int orderEnd = Integer.parseInt(pvo.getOrderEnd().replaceAll("-", "")); // i번째 상품의 오더 끝 날짜

		ArrayList<Integer> s_noList = (ArrayList<Integer>) dao.allSelectProduct(pvo.getP_no()); // i번째 상품의 재고 코드 리스트
		ArrayList<Integer> s_noList2 = new ArrayList<Integer>();

		for (int j = 0; j < s_noList.size(); j++) { // i번째 상품의 재고 코드 리스트 만큼 반복
			ArrayList<String> dateList = (ArrayList<String>) dao.allSelectDate(s_noList.get(j));// i번째 상품의 재고 코드
			int resultCnt = 0;
			for (int k = 0; k < dateList.size(); k++) {
				for (int l = orderStart; l <= orderEnd; l++) {
					if (Integer.parseInt(dateList.get(k)) == l) {
						resultCnt++;
					}
				}
			}
			if (resultCnt == 0) {
				s_noList2.add(s_noList.get(j));// 가능한거만 snolist2에 담음.
			}
			resultCnt = 0;
		}
		pvo.setProductCount(s_noList2.size()); // 갯수
		pvo.setS_noList(s_noList2); // 가능한 재고코드 리스트
		System.out.println("내가 선택한 상품 갯수" + pvo.getCurrentQty() + "이전페이지에서 최대 구매가능 갯수=" + pvo.getLimitQuantity() + "///"
				+ "지금 최대가능 갯수=" + pvo.getProductCount());
		ovo.setP_count(pvo.getCurrentQty());
		if (pvo.getProductCount() < pvo.getLimitQuantity()) {
			mav.setViewName("order/orderFail");
			System.out.println("구매하는사이에 누군가가 구매를해서 수량이 변경됨.");
		} else {
			mav.setViewName("order/orderSuccess");
		}

		if (req.getParameter("addr_paymethod").equals("card")) {
			ovo.setDelivery_status("결제완료");
			ovo.setPayment_type("card");
			ovo.setPayment_price(ovo.getTotalprice());
		} else if (req.getParameter("addr_paymethod").equals("cash")) {
			ovo.setDelivery_status("입금대기");
			ovo.setPayment_type("cash");
			ovo.setPayment_price(0);
		}
		System.out.println("주문 제품 갯수" + ovo.getP_count());
		try {
			dao.order_info(ovo);
			dao.order_recipient(ovo);
			if(ovo.getUserno()!=0) {
				dao.ordertable(ovo);
			}else {
				dao.ordertable_nonmember(ovo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("orderinfo,orderrecipient,ordertable에서 에러" + e.getMessage());
			mav.setViewName("redirect:orderFail");
			return mav;
		}
		// 카드 , 무통장 입금
		if (req.getParameter("addr_paymethod").equals("card")) {
			dao.paymethod_card(ovo);
		} else if (req.getParameter("addr_paymethod").equals("cash")) {
			dao.paymethod_cash(ovo);
		}
		try {
			dao.order_product(ovo);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("orderproduct테이블 에러" + e.getMessage());
			mav.setViewName("redirect:orderFail");
			return mav;
		}
		// 두 날짜 사이값 구해서 reservate 테이블에 값 넣기
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		Date d1 = df.parse(orderStart + "");
		Date d2 = df.parse(orderEnd + "");
		System.out.println(d1 + "//" + d2);
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.setTime(d1);
		c2.setTime(d2);

		// pvo.setProductCount(s_noList2.size()); // 갯수
		// pvo.setS_noList(s_noList2); // 가능한 재고코드 리스트
		// reservation테이블,order_stock 테이블 입력
		ArrayList<Integer> slist = pvo.getS_noList();////////////////////////
		for (int i = 0; i < pvo.getCurrentQty(); i++) {
			pvo.setS_no(slist.get(i));
			System.out.println("s_no==" + pvo.getS_no() + "에 대한 예약일은===");
			while (c1.compareTo(c2) != 1) {
				pvo.setStock_date(c1.getTime());
				System.out.printf("pvo.getStock_date는 == %tF\n", pvo.getStock_date());
				try {
					dao.reservate(pvo);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("reservate 테이블 에러" + e.getMessage());
					mav.setViewName("redirect:orderFail");
					return mav;
				}
				c1.add(Calendar.DATE, 1);
			}
			c1.setTime(d1);
			try {
				dao.order_stock(pvo);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("orderstock테이블 에러" + e.getMessage());
				mav.setViewName("redirect:orderFail");
				return mav;
			}
		}
		// 카드결제 정보 입력 테이블
		try {
			if (req.getParameter("addr_paymethod").equals("card")) {
				dao.paymentInfoInsert(ovo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("결제테이블 에러" + e.getMessage());
			mav.setViewName("redirect:orderFail");
			return mav;
		}
		
		mav.addObject("vo", ovo);
		return mav;
	}

	// 장바구니에서부터 제품 구매 완료
	@RequestMapping("/cartOrderOk")
	public ModelAndView cartOrderOk(HttpServletRequest req, OrderVO ovo) throws ParseException {
		ModelAndView mav = new ModelAndView();
		OrderDAOImp dao = sqlSession.getMapper(OrderDAOImp.class);
		HttpSession ses = req.getSession();
		int userno = 0;
		if(ses.getAttribute("userno")!=null) {
			userno = (Integer) (ses.getAttribute("userno"));
			System.out.println("유저넘버"+userno);
			ses.setAttribute("logStatus", "Y");
			ovo.setUserno(userno);
		}else {
			ses.setAttribute("logStatus", "N");
		}
		//카드 주문 정보 저장
		ovo.setImp_uid(req.getParameter("imp_uid"));
		ovo.setBuyer_name(req.getParameter("buyer_name"));
		ovo.setMerchant_uid(req.getParameter("merchant_uid"));
		ovo.setCard_corp(req.getParameter("card_name"));
		ovo.setApply_num(req.getParameter("apply_num"));
		ovo.setBuyer_email(req.getParameter("buyer_email"));
		ovo.setBuyer_tel(req.getParameter("buyer_tel"));
		ovo.setFormattedTime(req.getParameter("formattedTime"));
		ovo.setPaid_amount(req.getParameter("paid_amount"));
		
		
		/// 오더넘버에 난수 넣기.......
		String ono_sq = dao.orderNumber(ovo);
		String uuid_ono = UUID.randomUUID().toString();
		String o_no = uuid_ono.replaceAll("-", "");
		o_no = o_no.substring(0, 12);// o_no 난수
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
		Date date = new Date();
		String time = dateFormat.format(date);// 오늘 날짜
		o_no = (ono_sq + "_" + time + "_" + o_no);
		ovo.setO_no(o_no);
		System.out.println("세션객체들.." + ses.getAttribute("productList"));
		if(ses.getAttribute("productList")==null) {// 시간이 오래 지나거나 해서 세션이 날라갔을때 결제 실패페이지로 연결해야함.
			mav.setViewName("redirect:orderFail");
			return mav;
		}
		ArrayList<ProductVO> pvolist = (ArrayList) ses.getAttribute("productList"); // 장바구니에 담긴 품목 리스트
		ArrayList<ProductVO> pvolist2 = (ArrayList) ses.getAttribute("productList"); // 장바구니에 담긴 품목 리스트
		if (pvolist == null) {
			pvolist = new ArrayList<ProductVO>();
			ses.setAttribute("productList", pvolist);
		}
		if (pvolist2 == null) {
			pvolist2 = new ArrayList<ProductVO>();
			ses.setAttribute("productList", pvolist2);
		}
		// 재고 확인
		for (int i = 0; i < pvolist.size(); i++) { // 품목 리스트의 갯수만큼 반복
			ProductVO pvo = pvolist.get(i); // 품목 리스트의 i 번째
			int orderStart = Integer.parseInt(pvo.getOrderStart().replaceAll("-", "")); // i번째 상품의 오더 시작 날짜
			int orderEnd = Integer.parseInt(pvo.getOrderEnd().replaceAll("-", "")); // i번째 상품의 오더 끝 날짜
			ArrayList<Integer> s_noList = (ArrayList<Integer>) dao.allSelectProduct(pvo.getP_no()); // i번째 상품의 재고 코드 리스트
			ArrayList<Integer> s_noList2 = new ArrayList<Integer>();

			for (int j = 0; j < s_noList.size(); j++) { // i번째 상품의 재고 코드 리스트 만큼 반복
				ArrayList<String> dateList = (ArrayList<String>) dao.allSelectDate(s_noList.get(j));// i번째 상품의 재고 코드
				int resultCnt = 0;
				for (int k = 0; k < dateList.size(); k++) {
					for (int l = orderStart; l <= orderEnd; l++) {
						if (Integer.parseInt(dateList.get(k)) == l) {
							resultCnt++;
						}
					}
				}
				if (resultCnt == 0) {
					s_noList2.add(s_noList.get(j));// 가능한거만 snolist2에 담음.
				}
				resultCnt = 0;
			}
			pvo.setProductCount(s_noList2.size()); // 갯수
			pvo.setS_noList(s_noList2); // 가능한 재고코드 리스트
			System.out.println("전체 가능 갯수=="+pvo.getProductCount());
			System.out.println("현재 가능 갯수=="+pvo.getS_noList());
		}

		if (req.getParameter("addr_paymethod").equals("card")) {
			ovo.setDelivery_status("결제완료");
			ovo.setPayment_type("card");
			ovo.setPayment_price(ovo.getTotalprice());
		} else if (req.getParameter("addr_paymethod").equals("cash")) {
			ovo.setDelivery_status("입금대기");
			ovo.setPayment_type("cash");
			ovo.setPayment_price(0);
		}
		try {
			dao.order_info(ovo);
			dao.order_recipient(ovo);
			if(ovo.getUserno()!=0) {
				dao.ordertable(ovo);
			}else {
				dao.ordertable_nonmember(ovo);
			}
			if (req.getParameter("addr_paymethod").equals("card")) {
				dao.paymethod_card(ovo);
			} else if (req.getParameter("addr_paymethod").equals("cash")) {
				dao.paymethod_cash(ovo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("order_info,order_recipient,ordertable 테이블 중 에러.." + e.getMessage());
			mav.setViewName("redirect:orderFail");
			return mav;
		}

		String[] p_noList = req.getParameterValues("p_no");
		String[] currentQty = req.getParameterValues("currentQty");
		for (int i = 0; i < pvolist.size(); i++) {
			ProductVO pvo = pvolist.get(i);
			pvo.setO_no(ovo.getO_no());
			pvo.setCurrentQty(Integer.parseInt(currentQty[i]));
			pvo.setP_no(Integer.parseInt(p_noList[i]));
			try {
				dao.order_product_cart(pvo);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("order_product테이블 에러" + e.getMessage());
				mav.setViewName("redirect:orderFail");
				return mav;
			}
			System.out.println("오더넘버는==" + pvo.getO_no() + "//내가 선택한 상품번호" + pvo.getP_no() + "내가 선택한 상품 갯수"
					+ pvo.getCurrentQty() + "///이전페이지에서 최대 구매가능 갯수=" + pvo.getLimitQuantity() + "///" + "지금 최대가능 갯수="
					+ pvo.getProductCount());

			if (pvo.getProductCount() < pvo.getLimitQuantity()) {
				System.out.println("구매하는사이에 누군가가 구매를해서 수량이 변경됨.");
				mav.setViewName("order/orderFail");
			} else {
				mav.setViewName("order/orderSuccess");
			}

			// 두 날짜 사이값 구해서 reservate 테이블에 값 넣기
			int orderStart = Integer.parseInt(pvo.getOrderStart().replaceAll("-", "")); // i번째 상품의 오더 시작 날짜
			int orderEnd = Integer.parseInt(pvo.getOrderEnd().replaceAll("-", "")); // i번째 상품의 오더 끝 날짜
			DateFormat df = new SimpleDateFormat("yyyyMMdd");
			Date d1 = df.parse(orderStart + "");
			Date d2 = df.parse(orderEnd + "");
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			c1.setTime(d1);
			c2.setTime(d2);
			ArrayList<Integer> slist = pvo.getS_noList();
			System.out.println("가능한s_noList=="+slist);
			for (int i2 = 0; i2 < pvo.getCurrentQty(); i2++) {
				System.out.println("현재 구매 갯수"+pvo.getCurrentQty());
				pvo.setS_no(slist.get(i2));
				System.out.println("s_no구하기===>"+pvo.getS_no());
				System.out.println("s_no==" + pvo.getS_no() + "에 대한 예약일은===");
				while (c1.compareTo(c2) != 1) {
					pvo.setStock_date(c1.getTime());
					System.out.printf("pvo.getStock_date는 == %tF\n", pvo.getStock_date());
					try {
						dao.reservate(pvo);
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("reservate테이블 에러" + e.getMessage());
						mav.setViewName("redirect:orderFail");
						return mav;
					}
					c1.add(Calendar.DATE, 1);
				}
				c1.setTime(d1);
				try {
					dao.order_stock(pvo);
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("order_stock테이블 에러" + e.getMessage());
					mav.setViewName("redirect:orderFail");
					return mav;
				}
			}
		}
		// 카드결제 정보 입력 테이블
		try {
			if (req.getParameter("addr_paymethod").equals("card")) {
				dao.paymentInfoInsert(ovo);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("결제테이블 에러" + e.getMessage());
			mav.setViewName("redirect:orderFail");
			return mav;
		}
		
		ses.removeAttribute("productList");
		mav.addObject("vo", ovo);
		return mav;
	}

	@RequestMapping("/orderFail")
	public String orderFail() {
		return "order/orderFail";
	}
	
	@RequestMapping("/orderShipping")
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
		mv.setViewName("/order/orderShipping");
		return mv;
	}
	
	@RequestMapping("/CancleOrder")
	public String CancleOrder() {
		return "order/cancleOrder";
	}
	
	@RequestMapping("/nonmemberOrderHistory")
	public String nonmemberOrderHistory() {
		return "order/nonmember_orderHistory";
	}
	@RequestMapping(value="/nonSearchHistory",method = RequestMethod.POST)
	public ModelAndView nonSearchHistory(HttpServletRequest req) {
		String o_no = req.getParameter("o_no");
		String username = req.getParameter("username");
		String password = req.getParameter("opassword");
		System.out.println("주문자 이름"+username+"//"+"비밀번호"+password+"//"+"오더넘버"+o_no);
		ModelAndView mav = new ModelAndView();
		OrderDAOImp dao = sqlSession.getMapper(OrderDAOImp.class);
		System.out.println(dao.selectOrder(o_no,username,password)+"<<---vo 결과");
		if(dao.selectOrder(o_no,username,password)==null) {
			System.out.println("주문번호 없음");
			mav.addObject("result", 0);
			mav.setViewName("/order/nonmember_searchFail");
		}else {
			mav.addObject("vo", dao.selectOrder(o_no,username,password));
			mav.setViewName("/member/mypageOrderView");
		}
		return mav;
	}
	
}
