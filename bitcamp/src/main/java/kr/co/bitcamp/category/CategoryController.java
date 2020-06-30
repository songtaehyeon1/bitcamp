package kr.co.bitcamp.category;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	//¸®½ºÆ®
	@RequestMapping("/listAll")
	public ModelAndView listAll() {
		CategoryDAOImp dao = sqlSession.getMapper(CategoryDAOImp.class);
		List<CategoryVO> clist = dao.allCategorySelect();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("clist", clist);
		mav.setViewName("category/list");
		
		return mav;
	}
	@RequestMapping("/list1")
	public ModelAndView list1(int c_no) {
		CategoryDAOImp dao = sqlSession.getMapper(CategoryDAOImp.class);
		List<CategoryVO> clist = dao.CategorySelect(c_no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("clist", clist);
		mav.setViewName("category/list1");
		
		return mav;
	}
}
