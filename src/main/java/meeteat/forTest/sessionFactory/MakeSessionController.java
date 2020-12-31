package meeteat.forTest.sessionFactory;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MakeSessionController {

	private static final Logger logger = LoggerFactory.getLogger(MakeSessionController.class);
	
	
	@RequestMapping(value = "/testhome")
	public String makeSessionMain() {
		
		return "/forTest/makeSession";
	}
	
	@RequestMapping(value = "/makesession/commonUser")
	public String makeCommonUserSession(Model model, HttpSession session) {
		
		session.setAttribute("user_no", 3);
		session.setAttribute("user_nick", "일반유저");
		session.setAttribute("user_grade", 2);
		session.setAttribute("isLogin", true );
		
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/makesession/adminUser")
	public String makeAdminUserSession(Model model, HttpSession session) {
		
		session.setAttribute("user_no", 1);
		session.setAttribute("user_nick", "관리자유저");
		session.setAttribute("user_grade", 0);
		session.setAttribute("isLogin", true );
		
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/makesession/PaymentUser")
	public String makePaymentUserSession(Model model, HttpSession session) {
		
		session.setAttribute("user_no", 2);
		session.setAttribute("user_nick", "결제유저");
		session.setAttribute("user_grade", 1);
		session.setAttribute("isLogin", true );
		
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/makesession/BannedUser")
	public String makeBannedUserSession(Model model, HttpSession session) {
		
		session.setAttribute("user_no", 4);
		session.setAttribute("user_nick", "영구정지유저");
		session.setAttribute("user_grade", 3);
		session.setAttribute("isLogin", true );
		
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/makesession/guestUser")
	public String invalidateSession(Model model, HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	
}
