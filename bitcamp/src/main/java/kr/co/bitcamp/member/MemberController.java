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

	//�α�����
	@RequestMapping("/loginFrm")
	public String loginFrm() {
		return "member/login";
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
	
	//ȸ������ ������
	@RequestMapping("/infoEditFrm")
	public String infoEditFrm() {
		return "member/infoEdit";
	}
}
