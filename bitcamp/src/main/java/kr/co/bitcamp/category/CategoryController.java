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
	
	//SHOP �޴�
	@RequestMapping("/list")  
	public ModelAndView list(int c_no, String sort, HttpServletRequest req) {		
		CategoryDAOImp dao = sqlSession.getMapper(CategoryDAOImp.class);
		List<CategoryVO> clist = dao.allCategorySelect();		
		List<ProductVO> plist = dao.productSelect(c_no, sort);		
		
		HttpSession ses = req.getSession();
		String userno = String.valueOf(ses.getAttribute("userno"));	
		List<Integer> ilist = dao.allHearts(userno);
		//���ɻ�ǰ ����Ʈ
		for (int i=0; i<plist.size(); i++) {  //��ǰ0, ��ǰ1, ��ǰ2 ...
			for (int j=0; j<ilist.size(); j++) {  //���ɻ�ǰ0(��Ʈ��ư), ���ɻ�ǰ1, ���ɻ�ǰ2 ...
				if(plist.get(i).getP_no()==ilist.get(j)) {  //��ǰ0�� p_no�� ���ɻ�ǰ(��Ʈ��ư)�� p_no�� ��ġ�ϸ�  //.get(i)�� ��ǰ(i��°)�� ���Ѵ�.
					plist.get(i).setHeart("Y");  //���ɻ�ǰ(��Ʈ��ư) ���� ǥ��
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
	
/*
	//SHOP �޴� Ŭ�� ��
	@RequestMapping("/listAll")
	public ModelAndView listAll(String sort, HttpServletRequest req) {
		CategoryDAOImp dao = sqlSession.getMapper(CategoryDAOImp.class);

		//System.out.println(sort);
		List<CategoryVO> clist = dao.allCategorySelect();  //���̵�� �޴�
		List<ProductVO> plist = dao.allProductSelect(sort);  //��ǰ ����Ʈ
		
		
		HttpSession ses = req.getSession();
		String userno = String.valueOf(ses.getAttribute("userno"));	
		List<Integer> ilist = dao.allHearts(userno);
		//���ɻ�ǰ ����Ʈ
		for (int i=0; i<plist.size(); i++) {  //��ǰ0, ��ǰ1, ��ǰ2 ...
			for (int j=0; j<ilist.size(); j++) {  //���ɻ�ǰ0(��Ʈ��ư), ���ɻ�ǰ1, ���ɻ�ǰ2 ...
				if(plist.get(i).getP_no()==ilist.get(j)) {  //��ǰ0�� p_no�� ���ɻ�ǰ(��Ʈ��ư)�� p_no�� ��ġ�ϸ�  //.get(i)�� ��ǰ(i��°)�� ���Ѵ�.
					plist.get(i).setHeart("Y");  //���ɻ�ǰ(��Ʈ��ư) ǥ��
				}
			}
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("clist", clist);
		mav.addObject("plist", plist);
		mav.addObject("c_no", 0);  //ī�װ� All�� c_no�� �����Ƿ� ���� 0���� �������ش�. 
		                           //���� ���������� ������  c_no�� ������Ÿ���� int�̱� ������ null�̳� ''���� ó���� �� ���� .jsp���� ���� �о�� �� ����.
								   //int�� �⺻�� ������ ���� ���� ����������, integer�� ��ü�� ������ ���� ���� �ƴ� ��ü�� �ּҸ� �����ϰ� �־� null�� ���� �� �ִ�.
		mav.addObject("sort",sort );
		mav.setViewName("category/list");
		
		return mav;
	}
	
	//�ش� ī�װ��� ��ǰ ����Ʈ
	@RequestMapping("/list")
	public ModelAndView list(int c_no, String sort, HttpServletRequest req) {
		String c_no 
		
		int c_noStr;  //String c_no�� int�� ��ȯ�ϱ�
		if(c_no==null){
			c_noStr = 0;
		}else if(c_no!=null) {
			c_noStr = Integer.parseInt(c_no);
		}
	
		CategoryDAOImp dao = sqlSession.getMapper(CategoryDAOImp.class);
		List<CategoryVO> clist = dao.allCategorySelect();		
		List<ProductVO> plist = dao.productSelect(c_no, sort);		
		
		HttpSession ses = req.getSession();
		String userno = String.valueOf(ses.getAttribute("userno"));	
		List<Integer> ilist = dao.allHearts(userno);
		//���ɻ�ǰ ����Ʈ
		for (int i=0; i<plist.size(); i++) {  //��ǰ0, ��ǰ1, ��ǰ2 ...
			for (int j=0; j<ilist.size(); j++) {  //���ɻ�ǰ0(��Ʈ��ư), ���ɻ�ǰ1, ���ɻ�ǰ2 ...
				if(plist.get(i).getP_no()==ilist.get(j)) {  //��ǰ0�� p_no�� ���ɻ�ǰ(��Ʈ��ư)�� p_no�� ��ġ�ϸ�  //.get(i)�� ��ǰ(i��°)�� ���Ѵ�.
					plist.get(i).setHeart("Y");  //���ɻ�ǰ(��Ʈ��ư) ǥ��
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
*/	

	//SHOP_submenu
	@RequestMapping("/getcList")
	@ResponseBody
	public List<CategoryVO> getcList() {
		CategoryDAOImp dao = sqlSession.getMapper(CategoryDAOImp.class);
		List<CategoryVO> mainclist = dao.allCategorySelect();
		
		return mainclist;		
	}
	
	//���ɻ�ǰ �߰�
	@RequestMapping("/addInterest")
	@ResponseBody
	public int addinterest(int p_no, HttpServletRequest req) {
		CategoryDAOImp dao = sqlSession.getMapper(CategoryDAOImp.class);
		HttpSession ses = req.getSession();
		int userno = Integer.parseInt(String.valueOf(ses.getAttribute("userno")));  //parseInt() �Լ��� �Ű������� String ���� �ޱ� ������ Object�� String���� ����ȯ �� �� �Է��ؾ� �Ѵ�.
		
		InterestVO vo = new InterestVO();
		vo.setUserno(userno);
		vo.setP_no(p_no);
		int result = dao.addInterest(vo);
		
		return result;
	}
	
	//���ɻ�ǰ ����
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
