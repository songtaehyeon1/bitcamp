package kr.co.bitcamp.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//로그인폼
	@RequestMapping("/loginFrm")
	public String loginFrm() {
		return "member/login";
	}
	
	//회원가입폼
	@RequestMapping("/joinFrm")
	public String joinFrm() {
		return "member/join";
	}
	
	//아이디 중복확인
	@RequestMapping(value="/idChk", method=RequestMethod.POST)
	@ResponseBody
	public String idChk(String userid) {
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		int cnt = dao.idCheck(userid);
		
		if(cnt>0) {  //사용할 수 없는 아이디
			return "N";
		}else {  //사용할 수 있는 아이디
			return "Y";
		}
	}	
	
	//회원정보 수정폼
	@RequestMapping("/infoEditFrm")
	public String infoEditFrm() {
		return "member/infoEdit";
	}
}
