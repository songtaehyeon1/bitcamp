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
		vo2.setP_no(5);
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
		ArrayList<ProductVO> pvolist =(ArrayList)ses.getAttribute("productList");
		ProductVO pvo =pvolist.get(1);
		ArrayList<Integer> a = (ArrayList<Integer>) dao.allSelectProduct(pvo.getP_no());
		for (Integer integer : a) {
			System.out.println(integer);
		}
		
		
//		System.out.println(pvo.getP_no());
//		System.out.println(pvo.getOrderStart());
//		System.out.println(pvo.getOrderEnd());
//		pvo = pvolist.get(1);
//		System.out.println(pvo.getP_no());
//		System.out.println(pvo.getOrderStart());
//		System.out.println(pvo.getOrderEnd());


		
		mav.setViewName("order/orderSuccess");
		return mav;
	}
	
	
}
