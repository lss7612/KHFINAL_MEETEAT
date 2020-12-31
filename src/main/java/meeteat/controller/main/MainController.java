package meeteat.controller.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainPage(HttpSession session) {
		
		if(session.getAttribute("isLogin")==null || session.getAttribute("isLogin")=="")
			return "/main/main";
		
		return "/main/member";
		
	}
	
}
