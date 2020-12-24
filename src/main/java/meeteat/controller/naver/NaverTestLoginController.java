package meeteat.controller.naver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/naver")
public class NaverTestLoginController {

	@RequestMapping(value = "/naverlogin")
	public String naverLogin(HttpSession session) {
		return "/naver/naverlogin";
	}
	
	
	@RequestMapping(value = "/navercallback")
	public String naverCallback(HttpServletRequest request) throws Exception {
		return "/naver/navercallback";
	}
	
}
