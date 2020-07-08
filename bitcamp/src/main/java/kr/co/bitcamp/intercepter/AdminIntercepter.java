package kr.co.bitcamp.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminIntercepter extends HandlerInterceptorAdapter {
	//��Ʈ�ѷ��� ȣ��Ǳ� ���� ȣ��
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//�α��� ���θ� Ȯ���Ͽ� �α��� ������ ��� �α��ξȵȰ�� ���� �ߴ�
		HttpSession ses = request.getSession();
		String logStatus = (String)ses.getAttribute("adminStatus");
		if(logStatus ==null || logStatus.equals("")) {//�α��� �Ǿ����� ����
			response.sendRedirect(request.getContextPath()+"/admin");
			return false;
		}		
		return true;
	}
	//��Ʈ�ѷ� ���� �� view �������� �̵��ϱ����� ȣ��
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
	}
	//��Ʈ�ѷ� ���� �� ȣ��
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable Exception ex) throws Exception {
	}
	
}
