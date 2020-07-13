package kr.co.bitcamp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.bitcamp.admin.AdminDAOImp;
import kr.co.bitcamp.product.ProductVO;

@Controller
public class HomeController {

	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request) {
		AdminDAOImp dao = sqlSession.getMapper(AdminDAOImp.class);
		List<ProductVO> plist = dao.getmainproduct();
		ModelAndView mav = new ModelAndView();
		accessorManage(request);
		mav.addObject("plist", plist);
		mav.setViewName("home");	
		return mav;
	}
	
	// 접속한 ip 체크하고 넣기
	public void accessorManage(HttpServletRequest request) {
		AccessorDAO dao = sqlSession.getMapper(AccessorDAO.class);
		String ip = getClientIpAddr(request);
		int checkCnt = dao.accessorIpCheck(ip);
		if(checkCnt <= 0) {
			dao.accessorIpInsert(ip);
		}
	}
	
	// ip 구하기
	public static String getClientIpAddr(HttpServletRequest request) {
	    String ip = request.getHeader("X-Forwarded-For");
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = request.getRemoteAddr();
	    }
	 
	    return ip;
	}
	
}
