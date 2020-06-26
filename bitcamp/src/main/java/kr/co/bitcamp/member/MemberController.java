package kr.co.bitcamp.member;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	
	//���̹� �̸��� �����⿡�� ���
	@Inject
	JavaMailSenderImpl mailSender;
	
	//���̵�/��й�ȣ ã�� ��
	@RequestMapping("/contFindFrm")
	public String contFindFrm() {
		return "member/contFind";
	}
	
	//���̵� ã�� �Ϸ�
	@RequestMapping(value="/idFindOk", method=RequestMethod.POST, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String idFindOk(String name, String mail) {  //jsp���� form���� ������ name���� ��ƿ´�.
		//System.out.println(name+","+mail);

		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		MemberVO vo = dao.idFind(name, mail);  //name���� DAO�� ������. �׷� xml�� #{param1}, #{param2}�� ��Ī�� �ȴ�. sql���� ���� vo�� userid�� ����.
		
		if(vo.getUserid()!=null) {  //�Է��� ������ ��ġ�ϴ� ���̵� ������
			System.out.println(vo.getUserid());
			
			String username = name;
			String userid = vo.getUserid();
			String regdate = vo.getRegdate();
			String txt = "{\"username\":\""+username+"\",";
				   txt += "\"userid\":\""+userid+"\",";
				   txt += "\"regdate\":\""+regdate+"\"}";
				   
			return txt;
		}else {  //�Է��� ������ ��ġ�ϴ� ���̵� ������
			return "N";
		}	
		
		/* �̸��Ϸ� ���̵� �����ϱ�
		if(vo.getUserid()!=null) {  //�Է��� ������ ��ġ�ϴ� ���̵� ������
			System.out.println(vo.getUserid());
			
			String tomail = mail;  //�޴� ��� �̸���
			String title = "[THEBITCAMP] "+name+"���� ���̵� �Դϴ�.";  //�̸��� ����
			String content = "�ȳ��ϼ���. THEBITCAMP�Դϴ�.\n";  //�̸��� ����
				   content += "ȸ���Բ��� ��û�Ͻ� ���̵� �˷��帳�ϴ�.\n";
				   content += "���̵�� "+vo.getUserid()+" �Դϴ�.";
				   	
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom("hellojaeeun@naver.com");
				messageHelper.setTo(tomail);  
				messageHelper.setSubject(title);  
				messageHelper.setText(content);  
				
				mailSender.send(message);
				
				System.out.println("���� ���� ����");
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
			return "Y";
		}else {
			return "N";
		}
		*/
	}
	
	//��й�ȣ ã�� �Ϸ�
	@RequestMapping(value="/pwdFindOk", method=RequestMethod.POST, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String pwdFindOk(String named, String userid, String email) {
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		MemberVO vo = dao.pwdFind(named, userid, email);
		
		if(vo.getUserpwd()!=null) {
			System.out.println(vo.getUserpwd());
			
			String tomail = email; 
			String title = "[THEBITCAMP] "+named+"���� ��й�ȣ �Դϴ�.";
			String content = "<div style='width:100%; background-color:#f2f2f2; padding:50px; text-align:center;'>";
			       content += "<div style='width:600px; background-color:#fff; padding:16px; margin:0 auto;'>";
			       content += "<h1 style='margin-bottom:20px;'>ȸ������ ��й�ȣ �Դϴ�.</h1>";
				   content += "<p style='color:#343a40;'>�ȳ��ϼ���. THEBITCAMP�Դϴ�. <br/>";
				   content += "ȸ���Բ��� ��û�Ͻ� ��й�ȣ�� �˷��帳�ϴ�.<br/>";
				   content += "��й�ȣ�� <strong>"+vo.getUserpwd()+"</strong> �Դϴ�.</p>";	
				   content += "<hr/>";
				   content += "<p>���� ���� ���񽺸� ���� ����ϴ� THEBITCAMP�� �ǰڽ��ϴ�.<br/> �����մϴ�.</p></div>";
				   content += "<img src='http://localhost:9090/bitcamp/resources/category/mail-img.png' style='width:630px; height:350px;'></div>";
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom("hellojaeeun@naver.com");
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);
				messageHelper.setText("text/html; charset=UTF-8", content);
				
				mailSender.send(message);
				
				System.out.println("���� ���� ����");
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
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
	public ModelAndView loginOk(HttpServletRequest req, MemberVO vo) {
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		ModelAndView mav = new ModelAndView();
		MemberVO memVo = dao.loginCheck(vo);
		
		if(memVo==null) {  //�α��� ����
			mav.setViewName("redirect:loginFrm");
		}else {  //�α��� ����
			//���� ��¥ ���ϱ�
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  //��¥ ���� �����ϱ�
			Date today  = new Date();
			String logdate = format.format(today);  //���� logdate�� Ÿ���� String�̹Ƿ� Mapper.xml���� sql���� to_date(��¥�� ������)�� ��ȯ���ֱ�!
			memVo.setUserlogdate(logdate);
			//int result = dao.logdateUpdate(memVo);
			dao.logdateUpdate(memVo);
		    
			HttpSession ses = req.getSession();
			ses.setAttribute("userno", memVo.getUserno());  //setAttribute : ���� �־��ش�.
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
	
	//ȸ������ ����, ȸ��Ż��_��й�ȣ Ȯ�� ��
	@RequestMapping("/pwdChkFrm")                        
	public ModelAndView pwdCheck(HttpServletRequest req, @RequestParam("str") String str) {
		//HttpSession ses = req.getSession();
		//String userid = (String)ses.getAttribute("userid");  //getAttribute : ���� �����´�.

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("str", str);
		//mav.addObject("userid", userid);
		mav.setViewName("member/pwdCheck");
		
		return mav;
	}
	
	//ȸ������ ����, ȸ��Ż��_��й�ȣ Ȯ�� �Ϸ�
	@RequestMapping(value="/pwdChkOk", method=RequestMethod.POST)
	//                                                    @RequestParam("userpwd") String userpwd, @RequestParam("str") String str 
	public ModelAndView pwdChkFrm(HttpServletRequest req, String userpwd, String str) {
		HttpSession ses = req.getSession();
		String userid = (String)ses.getAttribute("userid");
		//System.out.println(str);
		
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		int cnt = dao.pwdCheck(userid, userpwd);

		ModelAndView mav = new ModelAndView();
		
		if(cnt>0) {
			if(str.equals("update")) {
				mav.setViewName("redirect:infoEditFrm");  //ȸ������ ���� ������ �̵�
			}else if(str.equals("delete")) {
				mav.setViewName("redirect:withdrawalFrm");  //ȸ��Ż�� ������ �̵�
			}
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
	public ModelAndView infoEditOk(HttpSession ses, MemberVO vo) {
		vo.setUserid((String)ses.getAttribute("userid"));    
		
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		int result = dao.memberUpdate(vo);
		
		ModelAndView mav = new ModelAndView();
		
		if(result>0) {
			mav.addObject("result", result);
			mav.setViewName("home");
		}else {
			mav.addObject("result", result);
			mav.setViewName("redirect:infoEditFrm");
		}
		return mav;
	}
	
	//ȸ��Ż�� ��
	@RequestMapping("/withdrawalFrm")
	public ModelAndView withdrawalFrm(HttpSession ses) {
		//HttpSession ses = req.getSession();
		String userid = (String)ses.getAttribute("userid");				
		
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("vo", dao.withdrawalChk(userid));
		mav.setViewName("member/withdrawal");
		
		return mav;
	}
	
	//ȸ��Ż�� �Ϸ�
	@RequestMapping(value="/withdrawalOk", method=RequestMethod.POST)
	public String withdrawalFrmOk(HttpSession ses, WithdrawalVO vo2) {
		String userid = (String)ses.getAttribute("userid");
		
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		MemberVO vo = dao.withdrawal(userid);
		vo2.setUserno(vo.getUserno());
		vo2.setUserid(vo.getUserid());
		vo2.setUsername(vo.getUsername());
		int result = dao.withdrawalInsert(vo2);
		if(result>0) {
			dao.joinTypeUpdate(userid);
			ses.invalidate();  //���� �α׾ƿ�
		}
		
		return "member/withdrawalOk";
	}
}
