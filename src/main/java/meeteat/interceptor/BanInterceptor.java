
package meeteat.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class BanInterceptor implements HandlerInterceptor{

	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("+ + + PayInterceptor started + + +");
		logger.info("	Request URI : " + request.getRequestURI());
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("isLogin") == null) {
			logger.info("로그인안함");
			response.sendRedirect("/interceptor/loginfail");
			return false;
		} else if (session.getAttribute("user_grade")!=null) {
			int user_grade = (int) session.getAttribute("user_grade");

			if(user_grade==3) {
				logger.info("영정유저임");
				response.sendRedirect("/interceptor/banfail");
				return false;
			}
		}
		logger.info("영정유저아님");
		return true;
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		logger.info("+ + + AdminInterceptor started + + +");
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
}

