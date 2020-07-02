package kr.co.bitcamp.category;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcamp.product.ProductVO;

@Controller
public class CategoryController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//SHOP 메뉴 클릭 시
	@RequestMapping("/listAll")
	public ModelAndView listAll(String sort, HttpServletRequest req) {
		CategoryDAOImp dao = sqlSession.getMapper(CategoryDAOImp.class);

		//System.out.println(sort);
		List<CategoryVO> clist = dao.allCategorySelect();  //사이드바 메뉴
		List<ProductVO> plist = dao.allProductSelect(sort);  //상품 리스트
		
		
		HttpSession ses = req.getSession();
		String userno = String.valueOf(ses.getAttribute("userno"));	
		List<Integer> ilist = dao.allHearts(userno);
		//관심상품 리스트
		for (int i=0; i<plist.size(); i++) {  //상품0, 상품1, 상품2 ...
			for (int j=0; j<ilist.size(); j++) {  //관심상품0(하트버튼), 관심상품1, 관심상품2 ...
				if(plist.get(i).getP_no()==ilist.get(j)) {  //상품0의 p_no와 관심상품(하트버튼)의 p_no가 일치하면
					plist.get(i).setHeart("Y");  //관심상품(하트버튼) 표시
				}
			}
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("clist", clist);
		mav.addObject("plist", plist);
		mav.addObject("c_no", 0);  //카테고리 All은 c_no가 없으므로 값을 0으로 세팅해준다. 
		                           //값을 세팅해주지 않으면  c_no의 데이터타입이 int이기 때문에 null이나 ''으로 처리할 수 없어 .jsp에서 값을 읽어올 수 없다.
		mav.addObject("sort",sort );
		mav.setViewName("category/list");
		
		return mav;
	}
	
	//해당 카테고리의 상품 리스트
	@RequestMapping("/list")
	public ModelAndView list(int c_no, String sort, HttpServletRequest req) {
		/*
		 *String c_noStr 
		 *
		int c_no=0;
		if(c_noStr!=null) {
			c_no= Integer.parseInt(c_no_Str);
		}
		*/
		CategoryDAOImp dao = sqlSession.getMapper(CategoryDAOImp.class);
		List<CategoryVO> clist = dao.allCategorySelect();		
		List<ProductVO> plist = dao.productSelect(c_no, sort);		
		
		HttpSession ses = req.getSession();
		String userno = String.valueOf(ses.getAttribute("userno"));	
		List<Integer> ilist = dao.allHearts(userno);
		
		//관심상품 리스트
		for (int i=0; i<plist.size(); i++) {  //상품0, 상품1, 상품2 ...
			for (int j=0; j<ilist.size(); j++) {  //관심상품0(하트버튼), 관심상품1, 관심상품2 ...
				if(plist.get(i).getP_no()==ilist.get(j)) {  //상품0의 p_no와 관심상품(하트버튼)의 p_no가 일치하면
					plist.get(i).setHeart("Y");  //관심상품(하트버튼) 표시
				}
			}
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("clist", clist);
		mav.addObject("plist", plist);
		mav.addObject("c_no", c_no);
		mav.addObject("sort", sort);
		mav.setViewName("category/list");
		
		return mav;
	}
	
	//관심상품 추가
	@RequestMapping("/addInterest")
	@ResponseBody
	public int addinterest(int p_no, HttpServletRequest req) {
		CategoryDAOImp dao = sqlSession.getMapper(CategoryDAOImp.class);
		HttpSession ses = req.getSession();
		int userno = Integer.parseInt(String.valueOf(ses.getAttribute("userno")));
		
		InterestVO vo = new InterestVO();
		vo.setUserno(userno);
		vo.setP_no(p_no);
		int result = dao.addInterest(vo);
		
		return result;
	}
	
	//관심상품 삭제
	@RequestMapping("/delInterest")
	@ResponseBody
	public int delinterest(int p_no, HttpServletRequest req) {
		CategoryDAOImp dao = sqlSession.getMapper(CategoryDAOImp.class);
		HttpSession ses = req.getSession();
		int userno = Integer.parseInt(String.valueOf(ses.getAttribute("userno")));
		
		InterestVO vo = new InterestVO();
		vo.setUserno(userno);
		vo.setP_no(p_no);
		int result = dao.delInterest(vo);
		
		return result;
	}
}
