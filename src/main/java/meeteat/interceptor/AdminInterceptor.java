package meeteat.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AdminInterceptor implements HandlerInterceptor{

	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		logger.info("+ + + AdminInterceptor started + + +");
		
		HttpSession session = request.getSession();
		int user_grade = (int)session.getAttribute("user_grade");
		
		if(session.getAttribute("isLogin") == null) {
			return false;
		} else if (user_grade!=2) {
			return false;
		}
		return true;
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		logger.info("+ + + AdminInterceptor started + + +");
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
}
