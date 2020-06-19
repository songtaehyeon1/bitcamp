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
	
	@RequestMapping(value="/orderDirect" , method = RequestMethod.POST)
	public ModelAndView order(HttpServletRequest req,int p_no,ProductVO vo) {
		ProductDAOImp dao = sqlSession.getMapper(ProductDAOImp.class);

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("day",vo);
		mav.addObject("product",dao.productView(p_no));
		mav.setViewName("order/orderForm");
		return mav;
		/*		HttpSession ses = req.getSession();
		ProductVO vo = new ProductVO();
		ProductVO vo2 = new ProductVO();
		vo.setP_no(1);
		vo.setOrderStart("20200701");
		vo.setOrderEnd("20200703");
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		list.add(vo);
		vo2.setP_no(2);
		vo2.setOrderStart("20200701");
		vo2.setOrderEnd("20200703");
		list.add(vo2);
		ses.setAttribute("productList", list);	*/
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
