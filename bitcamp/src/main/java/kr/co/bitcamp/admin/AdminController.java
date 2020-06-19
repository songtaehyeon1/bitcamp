package kr.co.bitcamp.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
