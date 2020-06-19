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
		ArrayList<ProductVO> pvolist =(ArrayList)ses.getAttribute("productList"); //��ٱ��Ͽ� ��� ǰ�� ����Ʈ
		ArrayList<ProductVO> pvolist2 =(ArrayList)ses.getAttribute("productList"); //��ٱ��Ͽ� ��� ǰ�� ����Ʈ
		
		//��� Ȯ��
		for (int i = 0; i < pvolist.size(); i++) { // ǰ�� ����Ʈ�� ������ŭ �ݺ�
			 ProductVO pvo = pvolist.get(i); // ǰ�� ����Ʈ�� i ��°
			 int orderStart = Integer.parseInt(pvo.getOrderStart()); //i��° ��ǰ�� ���� ���� ��¥
			 int orderEnd = Integer.parseInt(pvo.getOrderEnd()); //i��° ��ǰ�� ���� �� ��¥
			 ArrayList<Integer> s_noList = (ArrayList<Integer>) dao.allSelectProduct(pvo.getP_no()); //i��° ��ǰ�� ��� �ڵ� ����Ʈ
			 for (int j = 0; j < s_noList.size(); j++) { // i��° ��ǰ�� ��� �ڵ� ����Ʈ ��ŭ �ݺ�
				 ArrayList<String> dateList = (ArrayList<String>) dao.allSelectDate(s_noList.get(j));// i��° ��ǰ�� ��� �ڵ� ����Ʈ�� j��° ����ڵ��� ���೯¥ ����Ʈ ����
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
			pvo.setProductCount(s_noList.size()); // ���� 
			pvo.setS_noList(s_noList); // ������ ����ڵ� ����Ʈ
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
