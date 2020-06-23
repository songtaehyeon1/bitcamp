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
	
	//���̵�/��й�ȣ ã�� ��
	@RequestMapping("/contFindFrm")
	public String contFindFrm() {
		return "member/contFind";
	}
	
	//���̵� ã�� �Ϸ�
	@RequestMapping(value="/idFindOk", method=RequestMethod.POST)
	public String idFindOk(String name, String mail) {
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		MemberVO vo = dao.idFind(name, mail);  //vo�� userid�� ����.
						
		if(vo.getUserid()!=null) {  
			System.out.println(vo.getUserid());
			return "Y";
		}else {
			return "N";
		}
	}
	
	//��й�ȣ ã�� �Ϸ�
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

	//�α�����
	@RequestMapping("/loginFrm")
	public String loginFrm() {
		return "member/login";
	}
	
	//�α���
	@RequestMapping(value="/loginOk", method=RequestMethod.POST)
	public ModelAndView loginOk(MemberVO vo, HttpServletRequest req) {
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		MemberVO memVo = dao.loginCheck(vo);
		
		if(memVo==null) {  //�α��� ����
			mav.setViewName("redirect:loginFrm");
		}else {  //�α��� ����
			HttpSession ses = req.getSession();
			ses.setAttribute("userno", memVo.getUserno());
			ses.setAttribute("userid", memVo.getUserid());
			ses.setAttribute("username", memVo.getUsername());
			ses.setAttribute("logStatus", "Y");
			
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	//�α׾ƿ�
	@RequestMapping("logout")
	public String logout(HttpServletRequest req) {
		req.getSession().invalidate();
		
		return "home";
	}
	
	//ȸ��������
	@RequestMapping("/joinFrm")
	public String joinFrm() {
		return "member/join";
	}
	
	//���̵� �ߺ�Ȯ��
	@RequestMapping(value="/idChk", method=RequestMethod.POST)
	@ResponseBody
	public String idChk(String userid) {
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		int cnt = dao.idCheck(userid);
		
		if(cnt>0) {  //����� �� ���� ���̵�
			return "N";
		}else {  //����� �� �ִ� ���̵�
			return "Y";
		}
	}	
	
	//ȸ������ �Ϸ�
	@RequestMapping(value="/joinOk", method=RequestMethod.POST)
	public ModelAndView joinOk(MemberVO vo) {
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		int result = dao.memberInsert(vo);
		ModelAndView mav = new ModelAndView();
		if(result>0) {  //ȸ������ ����
			mav.setViewName("member/joinOk");
		}else {  //ȸ������ ����
			mav.setViewName("redirect:joinFrm");
		}
		return mav;
	}
	
	//ȸ������ ����_��й�ȣ Ȯ�� ��
	@RequestMapping("/pwdChkFrm")
	public ModelAndView pwdCheck(HttpServletRequest req) {
		HttpSession ses = req.getSession();
		String userid = (String)ses.getAttribute("userid");
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("userid", userid);
		mav.setViewName("member/pwdCheck");
		
		return mav;
	}
	
	//ȸ������ ����_��й�ȣ Ȯ�� �Ϸ�
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
	
	//ȸ������ ���� ��
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

	//ȸ������ ���� �Ϸ�
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
	
	//ȸ��Ż�� ��
	
	
}
