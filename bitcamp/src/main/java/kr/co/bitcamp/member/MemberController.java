package kr.co.bitcamp.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
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
	
	//아이디/비밀번호 찾기 폼
	@RequestMapping("/contFindFrm")
	public String contFindFrm() {
		return "member/contFind";
	}
	
	//아이디 찾기 완료
	@RequestMapping(value="/idFindOk", method=RequestMethod.POST)
	public String idFindOk(String name, String mail) {
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		MemberVO vo = dao.idFind(name, mail);  //vo에 userid가 담긴다.
						
		if(vo.getUserid()!=null) {  
			System.out.println(vo.getUserid());
			return "Y";
		}else {
			return "N";
		}
	}
	
	//비밀번호 찾기 완료
	@RequestMapping(value="/pwdFindOk", method=RequestMethod.POST)
	public String pwdFindOk(String named, String userid, String email) {
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		MemberVO vo = dao.pwdFind(named, userid, email);
		
		if(vo.getUserpwd()!=null) {
			System.out.println(vo.getUserpwd());
			return "Y";
		}else {
			return "N";
		}
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
		int result = dao.memberInsert(vo);
		ModelAndView mav = new ModelAndView();
		if(result>0) {  //회원가입 성공
			mav.setViewName("member/joinOk");
		}else {  //회원가입 실패
			mav.setViewName("redirect:joinFrm");
		}
		return mav;
	}
	
	//회원정보 수정_비밀번호 확인 폼
	@RequestMapping("/pwdChkFrm")
	public ModelAndView pwdCheck(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		String userid = (String)ses.getAttribute("userid");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("userid", userid);
		mav.setViewName("member/pwdCheck");
		
		return mav;
	}
	
	//회원정보 수정_비밀번호 확인 완료
	@RequestMapping(value="/pwdChkOk", method=RequestMethod.POST)
	public ModelAndView pwdChkFrm(HttpServletRequest req, @RequestParam("userpwd") String userpwd) {
		HttpSession ses = req.getSession();
		String userid = (String)ses.getAttribute("userid");
		
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		int cnt = dao.pwdCheck(userid, userpwd);

		ModelAndView mav = new ModelAndView();

		if(cnt>0) {
			mav.setViewName("redirect:infoEditFrm");
		}else {
			mav.addObject("cnt", cnt);	
			mav.setViewName("member/pwdCheck");
		}
		
		return mav;
	}
	
	//회원정보 수정 폼
	@RequestMapping("/infoEditFrm")
	public ModelAndView infoEditFrm(HttpServletRequest req) {
		HttpSession ses = req.getSession();  
		String userid = (String)ses.getAttribute("userid");
		
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", dao.getMember(userid));
		mav.setViewName("member/infoEdit");
		
		return mav;
	}

	//회원정보 수정 완료
	@RequestMapping(value="/infoEditOk", method=RequestMethod.POST)
	public ModelAndView infoEditOk(MemberVO vo) {
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		int result = dao.memberUpdate(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("userid", vo.getUserid());
		
		if(result>0) {
			mav.addObject("userid", vo.getUserid());
			mav.setViewName("home");
		}else {
			mav.setViewName("redirect:infoEditFrm");
		}
		return mav;
	}
	
	//회원탈퇴 폼
	
	
}
