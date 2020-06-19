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
		int cnt = dao.memberInsert(vo);
		ModelAndView mav = new ModelAndView();
		if(cnt>0) {  //ȸ������ ����
			mav.setViewName("member/joinOk");
		}else {  //ȸ������ ����
			mav.setViewName("redirect:joinFrm");
		}
		return mav;
	}
	
	//ȸ������ ������
	@RequestMapping("/infoEditFrm")
	public String infoEditFrm() {
		return "member/infoEdit";
	}
}
