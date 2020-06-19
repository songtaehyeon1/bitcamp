package kr.co.bitcamp.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	//로그인
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public ModelAndView loginOk(MemberVO vo, HttpServletRequest req) {
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		MemberVO memVo = dao.loginCheck(vo);
		
		if(memVo==null) {  //로그인 실패
			mav.setViewName("redirect:loginFrm");
		}else {  //로그인 성공
			HttpSession ses = req.getSession();
			ses.setAttribute("userno", memVo.getUserno());
			ses.setAttribute("userid", memVo.getUserid());
			ses.setAttribute("username", memVo.getUsername());
			ses.setAttribute("logStatus", "Y");
			
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();
		
		return "home";
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
	
	//회원가입 완료
	@RequestMapping(value="/joinOk", method=RequestMethod.POST)
	public ModelAndView joinOk(MemberVO vo) {
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		int cnt = dao.memberInsert(vo);
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {  //회원가입 성공
			mav.setViewName("member/joinOk");
		}else {  //회원가입 실패
			mav.setViewName("redirect:joinFrm");
		}
		return mav;
	}
	
	//회원정보 수정폼
	@RequestMapping("/infoEditFrm")
	public String infoEditFrm() {
		return "member/infoEdit";
	}
}
