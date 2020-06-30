package kr.co.bitcamp.order;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	//장바구니에서 구매하기
	@RequestMapping(value="/cartOrder" , method = RequestMethod.POST)
	public ModelAndView cartOrder(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
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
		for(int i =0;i<p_noList.length;i++) {
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
			pvolist.add(i, vo);
		}
		for(int i =0;i<p_noList.length;i++) {
			System.out.println(pvolist.get(i).getP_no());
			System.out.println(pvolist.get(i).getCurrentQty());
		}
		
		
		mav.addObject("cart",pvolist);
		mav.setViewName("order/orderForm_cart");
		return mav;
	}
	
	//바로 구매하기
	@RequestMapping(value="/orderDirect" , method = RequestMethod.POST)
	public ModelAndView order(HttpServletRequest req,int p_no,ProductVO vo) {
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);
		ModelAndView mav = new ModelAndView();
		//파라미터값을 받아와서 vo에 저장함.
		int delivery_fee = Integer.parseInt(req.getParameter("delivery_fee")); //배송비
		String orderStart = req.getParameter("orderStart");//대여기간 시작날
		String orderEnd = req.getParameter("orderEnd");//대여기간 마지막날
		String borrowPeriod = req.getParameter("product_borrow_period");//대여기간
		String filename = req.getParameter("p_filename1");//사진파일1
		int limitQuantity = Integer.parseInt(req.getParameter("limitQuantity"));//제품 최대 대여 가능 갯수
		int price = Integer.parseInt(req.getParameter("price"));//대여가격
		vo.setDelivery_fee(delivery_fee);
		vo.setOrderStart(orderStart);
		vo.setOrderEnd(orderEnd);
		vo.setProduct_borrow_period(borrowPeriod);
		vo.setP_filename1(filename);
		vo.setPrice(price);
		vo.setLimitQuantity(limitQuantity);

		int zero = 0;
		System.out.println(req.getParameter("product_payment"));
		if(Integer.parseInt(req.getParameter("product_payment"))==0) {
			vo.setDelivery_fee(zero);
		}else {
			vo.setDelivery_fee(delivery_fee);
		}
		vo.setTotal_price(vo.getDelivery_fee(), price);//전체 가격
		vo.setPeriod(orderStart, orderEnd, borrowPeriod);//기간 yyyy-mm-dd~yyyy-mm-dd(x박x일)
		
		mav.addObject("vo",vo);
		mav.addObject("product",dao.productView(p_no));
		mav.setViewName("order/orderForm");
		return mav;
	}
	
	
	
	   @RequestMapping("/orderOk")
	   public ModelAndView orderOk(HttpServletRequest req) {
	      ModelAndView mav = new ModelAndView();
	      OrderDAOImp dao = sqlSession.getMapper(OrderDAOImp.class);
	      HttpSession ses = req.getSession();
	      ArrayList<ProductVO> pvolist =(ArrayList)ses.getAttribute("productList"); //장바구니에 담긴 품목 리스트
	      ArrayList<ProductVO> pvolist2 =(ArrayList)ses.getAttribute("productList"); //장바구니에 담긴 품목 리스트
	      
	      //재고 확인
	      for (int i = 0; i < pvolist.size(); i++) { // 품목 리스트의 갯수만큼 반복
	          ProductVO pvo = pvolist.get(i); // 품목 리스트의 i 번째
	          int orderStart = Integer.parseInt(pvo.getOrderStart()); //i번째 상품의 오더 시작 날짜
	          int orderEnd = Integer.parseInt(pvo.getOrderEnd()); //i번째 상품의 오더 끝 날짜
	          ArrayList<Integer> s_noList = (ArrayList<Integer>) dao.allSelectProduct(pvo.getP_no()); //i번째 상품의 재고 코드 리스트
	          for (int j = 0; j < s_noList.size(); j++) { // i번째 상품의 재고 코드 리스트 만큼 반복
	             ArrayList<String> dateList = (ArrayList<String>) dao.allSelectDate(s_noList.get(j));// i번째 상품의 재고 코드 리스트의 j번째 재고코드의 예약날짜 리스트 얻어옴
	             int resultCnt = 0;
	             for(int k = 0 ; k < dateList.size() ; k++) {
	                for (int l = orderStart; l <= orderEnd; l++) {
	                  if(Integer.parseInt(dateList.get(k)) == l) {
	                     resultCnt++;
	                  }
	                }
	             }
	             
	             if(resultCnt>0){
	                s_noList.remove(j);
	             }
	             resultCnt =0;
	         }
	         pvo.setProductCount(s_noList.size()); // 갯수 
	         pvo.setS_noList(s_noList); // 가능한 재고코드 리스트
	      }      
	      
	      boolean compareResult = true;
	      for (int i = 0; i < pvolist.size(); i++) {
	         ProductVO pvo = pvolist.get(i);
	         ProductVO pvo2 = pvolist2.get(i);
	         if(pvo.getProductCount() != pvo2.getProductCount()) {
	            compareResult = false;
	         }         
	      }
	      
	      if(compareResult == true) {
	         mav.setViewName("order/orderSuccess");
	         
	      }else {
	         mav.setViewName("order/orderFail");
	      }
	      
	      



	      
	      
	      return mav;
	   }
	   
	   
	}