package kr.co.bitcamp.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcamp.category.CategoryVO;
import kr.co.bitcamp.order.OrderDAOImp;

@Controller
public class AdminController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping("/admin")
	public String goAdminlogin() {

		return "admin/adminLogin";
	}

	@RequestMapping("/adminLoginOk")
	public String goAdminLoginOk() {

		return "admin/adminHome";
	}

	@RequestMapping("/admin/home")
	public String goAdminHome() {

		return "admin/adminHome";
	}

	@RequestMapping("/admin/member")
	public String goAdminMember() {

		return "admin/adminMember";
	}

	@RequestMapping("/admin/memberJoin")
	public String goAdminJoin() {

		return "admin/adminJoin";
	}
	
	@RequestMapping("/admin/memberdellist")
	public String goAdminMemberDellist() {

		return "admin/adminMemberDellist";
	}
	
	@RequestMapping("/admin/orderList")
	public String goAdminOrderlist() {

		return "admin/adminOrderList";
	}
	@RequestMapping("/admin/product")
	public String goAdminProduct() {

		return "admin/adminProductList";
	}
	
	@RequestMapping("/admin/productCategory")
	public ModelAndView goAdminProductCategory() {
		ModelAndView mav = new ModelAndView();
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		List<CategoryVO> list = dao.allCategorySelect();
		mav.addObject("list", list);
		mav.setViewName("admin/adminCategory");
		return mav;
	}
	
	@RequestMapping(value = "/admin/selectCategory", method = RequestMethod.GET)
	@ResponseBody
	public CategoryVO ajaxCategorySelect(int c_no){
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		CategoryVO vo = dao.selectCategory(c_no);		
		vo.setCnt(dao.cntCategoryProduct(c_no));		
		return vo;
	}
	
}
