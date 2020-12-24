package meeteat.controller.login;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import meeteat.dto.user.User;
import meeteat.service.login.face.LoginService;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired private LoginService loginService;
	
	//네이버 로그인
	private NaverLoginController naverLoginController;
	private String apiResult = null;
	
	private OAuth2AccessToken oauthToken;
	
	@Autowired
	private void setNaverLoginController(NaverLoginController naverLoginController) {
		this.naverLoginController = naverLoginController;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) throws UnsupportedEncodingException {
		
		String naverUrl = naverLoginController.getAuthorizationUrl(session);
		
		model.addAttribute("naverUrl", naverUrl);
		
		return "login/login";
		
	}
	
	@RequestMapping(value = "/logincheck", method = RequestMethod.GET)
	@ResponseBody
	public boolean loginCheck(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw) {
		
		logger.info("/logincheck 접근했음");
		
		User user = new User();
		
		user.setUser_id(user_id);
		user.setUser_pw(user_pw);
		
		if(loginService.login(user)) {
			return true;
		} else {
			return false;
		}
		
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginProcess(User user, HttpSession session, Model model) {
		
		boolean loginResult = loginService.login(user);
		
		if(loginResult) {
			
			user = loginService.selectUser(user);
			
			session.setAttribute("isLogin", true);
			
			session.setAttribute("user_no", user.getUser_no());
			session.setAttribute("user_id", user.getUser_id());
			session.setAttribute("user_nick", user.getUser_nick());
			session.setAttribute("user_grade", user.getUser_grade());
			session.setAttribute("user_image", user.getUser_profilestored());
			session.setAttribute("user_gender", user.getUser_gender());
			session.setAttribute("user_age", user.getUser_age());
			session.setAttribute("user_email", user.getUser_email());
			
//			model.addAttribute("user_id", user.getUser_id());
//			model.addAttribute("user_nick", user.getUser_nick());
//			model.addAttribute("user_gender", user.getUser_gender());
//			model.addAttribute("user_age", user.getUser_age());
//			model.addAttribute("user_email", user.getUser_email());

			
			logger.info("유저번호 : " + session.getAttribute("user_no"));
			logger.info("유저닉네임 : " + session.getAttribute("user_nick"));
			logger.info("유저등급 : " + session.getAttribute("user_grade"));
			
			return "redirect:/login/main";
			
		} else {
			
			return "redirect:/login/fail";
		}
		
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/login/main";
		
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void signUp() {
		
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signUpProcess(User user) {
		
		loginService.signUp(user);
		
		return "redirect:/login/signupsuccess";
	}
	
	@RequestMapping(value = "/signupsuccess")
	public void signUpSuccess() {
		
	}
	
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	@ResponseBody
	public boolean idCheck(@RequestParam("user_id") String user_id) {
		
		return loginService.userIdCheck(user_id);
		
	}
	
	@RequestMapping(value = "/nickcheck", method = RequestMethod.GET)
	@ResponseBody
	public boolean nickCheck(@RequestParam("user_nick") String user_nick) {
		
		return loginService.userNickCheck(user_nick);
		
	}
	
	@RequestMapping(value = "/main")
	public void main() {
		
	}
	
	@RequestMapping(value = "/navercallback", produces = "application/json;charset=utf-8", method = {RequestMethod.GET, RequestMethod.POST})
	public String naverCallback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
		
		
//		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginController.getAccessToken(session, code, state);
		
		logger.info(oauthToken.toString());
		
		apiResult = naverLoginController.getUserProfile(oauthToken);
		
		JSONParser parser = new JSONParser();
		Object obj = null;
		
		try {
			obj = parser.parse(apiResult);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		JSONObject jsonobj = (JSONObject) obj;
		JSONObject response = (JSONObject) jsonobj.get("response");
		
		String id = (String) response.get("id");
		String name = (String) response.get("name");
		String nick = (String) response.get("nickname");
		String email = (String) response.get("email");
		String gender = (String) response.get("gender");
		String age = (String) response.get("age");
		String image = (String) response.get("profile_image");
		
		session.setAttribute("isLogin", true);
		session.setAttribute("user_id", id);
		session.setAttribute("user_name", name);
		session.setAttribute("user_nick", nick);
		session.setAttribute("user_gender", gender);
		session.setAttribute("user_age", age);
		session.setAttribute("user_email", email);
		session.setAttribute("user_image", image);
		
		
		//네이버 회원 데이터베이스에 저장하기
		User user = new User();
		
		String[] naverId = new String[1];
		naverId = email.split("@");
				
		user.setUser_id(naverId[0]);
		user.setUser_pw(id);
		user.setUser_nick(nick);
		user.setUser_age(age);
		user.setUser_gender(gender);
		user.setUser_email(email);
		user.setUser_profileorigin(image);
		user.setUser_profilestored(image);
		
		boolean hasData = loginService.login(user);
		
		
		if(hasData) {

			user = loginService.selectUser(user);
			session.setAttribute("isLogin", true);
			session.setAttribute("user_no", user.getUser_no());
			session.setAttribute("user_grade", user.getUser_grade());

			return "redirect:/login/main";
			
		} else {
			
			user = loginService.selectUser(user);
			session.setAttribute("isLogin", true);
			session.setAttribute("user_no", user.getUser_no());
			session.setAttribute("user_grade", user.getUser_grade());
			
			loginService.signUp(user);
			return "redirect:/login/main";
			
		}
		
		
	}

	@RequestMapping(value = "/google")
	public String google(HttpSession session) {
		
		session.setAttribute("isLogin", true);
		
		return "redirect:/login/main";
	}
	

}
