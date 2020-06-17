package kr.co.bitcamp.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginIntercepter extends HandlerInterceptorAdapter {
	//컨트롤러가 호출되기 전에 호출
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//로그인 여부를 확인하여 로그인 했으면 계속 로그인안된경우 진행 중단
		HttpSession ses = request.getSession();
		String logid = (String)ses.getAttribute("logid");
		if(logid ==null || logid.equals("")) {//로그인 되어있지 않음
			response.sendRedirect(request.getContextPath()+"/loginFrm");
			return false;
		}		
		return true;
	}
	//컨트롤러 실행 후 view 페이지로 이동하기전에 호출
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
	}
	//컨트롤러 실행 후 호출
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable Exception ex) throws Exception {
	}
	
}
