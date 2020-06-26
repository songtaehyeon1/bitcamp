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
	
	//네이버 이메일 보내기에서 사용
	@Inject
	JavaMailSenderImpl mailSender;
	
	//아이디/비밀번호 찾기 폼
	@RequestMapping("/contFindFrm")
	public String contFindFrm() {
		return "member/contFind";
	}
	
	//아이디 찾기 완료
	@RequestMapping(value="/idFindOk", method=RequestMethod.POST, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String idFindOk(String name, String mail) {  //jsp파일 form에서 지정한 name값을 담아온다.
		//System.out.println(name+","+mail);

		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		MemberVO vo = dao.idFind(name, mail);  //name값을 DAO로 보낸다. 그럼 xml의 #{param1}, #{param2}에 매칭이 된다. sql문에 따라 vo에 userid가 담긴다.
		
		if(vo.getUserid()!=null) {  //입력한 정보에 일치하는 아이디가 있으면
			System.out.println(vo.getUserid());
			
			String username = name;
			String userid = vo.getUserid();
			String regdate = vo.getRegdate();
			String txt = "{\"username\":\""+username+"\",";
				   txt += "\"userid\":\""+userid+"\",";
				   txt += "\"regdate\":\""+regdate+"\"}";
				   
			return txt;
		}else {  //입력한 정보에 일치하는 아이디가 없으면
			return "N";
		}	
		
		/* 이메일로 아이디 전송하기
		if(vo.getUserid()!=null) {  //입력한 정보에 일치하는 아이디가 있으면
			System.out.println(vo.getUserid());
			
			String tomail = mail;  //받는 사람 이메일
			String title = "[THEBITCAMP] "+name+"님의 아이디 입니다.";  //이메일 제목
			String content = "안녕하세요. THEBITCAMP입니다.\n";  //이메일 내용
				   content += "회원님께서 요청하신 아이디를 알려드립니다.\n";
				   content += "아이디는 "+vo.getUserid()+" 입니다.";
				   	
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom("hellojaeeun@naver.com");
				messageHelper.setTo(tomail);  
				messageHelper.setSubject(title);  
				messageHelper.setText(content);  
				
				mailSender.send(message);
				
				System.out.println("메일 전송 성공");
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
			return "Y";
		}else {
			return "N";
		}
		*/
	}
	
	//비밀번호 찾기 완료
	@RequestMapping(value="/pwdFindOk", method=RequestMethod.POST, produces="application/text; charset=UTF-8")
	@ResponseBody
	public String pwdFindOk(String named, String userid, String email) {
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		MemberVO vo = dao.pwdFind(named, userid, email);
		
		if(vo.getUserpwd()!=null) {
			System.out.println(vo.getUserpwd());
			
			String tomail = email; 
			String title = "[THEBITCAMP] "+named+"님의 비밀번호 입니다.";
			String content = "<div style='width:100%; background-color:#f2f2f2; padding:50px; text-align:center;'>";
			       content += "<div style='width:600px; background-color:#fff; padding:16px; margin:0 auto;'>";
			       content += "<h1 style='margin-bottom:20px;'>회원님의 비밀번호 입니다.</h1>";
				   content += "<p style='color:#343a40;'>안녕하세요. THEBITCAMP입니다. <br/>";
				   content += "회원님께서 요청하신 비밀번호를 알려드립니다.<br/>";
				   content += "비밀번호는 <strong>"+vo.getUserpwd()+"</strong> 입니다.</p>";	
				   content += "<hr/>";
				   content += "<p>더욱 좋은 서비스를 위해 노력하는 THEBITCAMP가 되겠습니다.<br/> 감사합니다.</p></div>";
				   content += "<img src='http://localhost:9090/bitcamp/resources/category/mail-img.png' style='width:630px; height:350px;'></div>";
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom("hellojaeeun@naver.com");
				messageHelper.setTo(tomail);
				messageHelper.setSubject(title);
				messageHelper.setText("text/html; charset=UTF-8", content);
				
				mailSender.send(message);
				
				System.out.println("메일 전송 성공");
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
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
	public ModelAndView loginOk(HttpServletRequest req, MemberVO vo) {
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		ModelAndView mav = new ModelAndView();
		MemberVO memVo = dao.loginCheck(vo);
		
		if(memVo==null) {  //로그인 실패
			mav.setViewName("redirect:loginFrm");
		}else {  //로그인 성공
			//접속 날짜 구하기
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  //날짜 형식 지정하기
			Date today  = new Date();
			String logdate = format.format(today);  //변수 logdate의 타입이 String이므로 Mapper.xml에서 sql문은 to_date(날짜형 데이터)로 변환해주기!
			memVo.setUserlogdate(logdate);
			//int result = dao.logdateUpdate(memVo);
			dao.logdateUpdate(memVo);
		    
			HttpSession ses = req.getSession();
			ses.setAttribute("userno", memVo.getUserno());  //setAttribute : 값을 넣어준다.
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
	
	//회원정보 수정, 회원탈퇴_비밀번호 확인 폼
	@RequestMapping("/pwdChkFrm")                        
	public ModelAndView pwdCheck(HttpServletRequest req, @RequestParam("str") String str) {
		//HttpSession ses = req.getSession();
		//String userid = (String)ses.getAttribute("userid");  //getAttribute : 값을 가져온다.

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("str", str);
		//mav.addObject("userid", userid);
		mav.setViewName("member/pwdCheck");
		
		return mav;
	}
	
	//회원정보 수정, 회원탈퇴_비밀번호 확인 완료
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
				mav.setViewName("redirect:infoEditFrm");  //회원정보 수정 폼으로 이동
			}else if(str.equals("delete")) {
				mav.setViewName("redirect:withdrawalFrm");  //회원탈퇴 폼으로 이동
			}
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
	
	//회원탈퇴 폼
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
	
	//회원탈퇴 완료
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
			ses.invalidate();  //강제 로그아웃
		}
		
		return "member/withdrawalOk";
	}
}
