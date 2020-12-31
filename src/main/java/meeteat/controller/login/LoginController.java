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
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;

import meeteat.dto.user.User;
import meeteat.service.login.face.LoginService;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired private LoginService loginService;
	@Autowired private KakaoRestApi kakaoRestApi;

	
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
		
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize"
				+ "?response_type=code"
				//추가 동의 요청
//				+ "&scope=age_range,account_email,gender,profile"
				+ "&client_id=895375f3d436ba0bf699c34807dffc98"
				+ "&redirect_uri=http://localhost:8088/login/kakaocallback";

		
		model.addAttribute("naverUrl", naverUrl);
		model.addAttribute("kakaoUrl", kakaoUrl);
		
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
			session.setAttribute("kakaoLogin", false);
			
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
		
		String accessToken = (String)session.getAttribute("accessToken");
		
		boolean hasToken = (boolean) session.getAttribute("kakaoLogin");
		
		
		if(hasToken){
			// 연결끊기
			kakaoRestApi.breakAccessToken(accessToken);
			
			// 로그아웃
//			kakaoRestApi.kakaoLogout(accessToken);
		}
		
		
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
		
		
		//네이버 회원 데이터베이스에 저장하기
		User user = new User();
		
		String[] naverId = new String[1];
		naverId = email.split("@");
				
		user.setUser_id("N" + naverId[0]);
		user.setUser_pw(id);
		user.setUser_nick(nick);
		user.setUser_age(age);
		user.setUser_gender(gender);
		user.setUser_email(email);
		user.setUser_profileorigin(image);
		user.setUser_profilestored(image);
		
		boolean hasData = loginService.login(user);
		
		if(!hasData) {
			loginService.signUp(user);
		}
		
		user = loginService.selectUser(user);
		
		session.setAttribute("isLogin", true);
		session.setAttribute("user_no", user.getUser_no());
		session.setAttribute("user_grade", user.getUser_grade());
		session.setAttribute("snsLogin", true);
		session.setAttribute("kakaoLogin", false);
		session.setAttribute("user_id", id);
		session.setAttribute("user_name", name);
		session.setAttribute("user_nick", nick);
		session.setAttribute("user_gender", gender);
		session.setAttribute("user_age", age);
		session.setAttribute("user_email", email);
		session.setAttribute("user_image", image);

		
		return "redirect:/login/main";
		
		
	}
	
	@RequestMapping(value = "/kakaocallback")
	public String kakaoCallback(@RequestParam("code") String code, HttpSession session) {
		
		logger.info("kakao code : " + code );
		
		String accessToken = kakaoRestApi.getAccessToken(code);
		logger.info("kakao accessToken : " + accessToken );
		
		HashMap<String, Object> kakaoUserInfo = kakaoRestApi.getUserInfo(accessToken);
		
		if(kakaoUserInfo.get("kakaoFail").equals(true)) {
			kakaoRestApi.breakAccessToken(accessToken);
			
			return "/login/kakaofail";
		}
		
		logger.info("kakaoUserInfo : " + kakaoUserInfo);
		
		//카카오정보 들어간다
		
		//데이터베이스에 맞게 정보수정
		String convertGender = "";
		if("male".equals(kakaoUserInfo.get("gender"))) {
			convertGender = "M";
		} else if("female".equals(kakaoUserInfo.get("gender"))) {
			convertGender = "F";
		} else {
			convertGender = "U";
		}
		
		String convertAge = kakaoUserInfo.get("age").toString().replace("~", "-");
		
		
		
		
		//카카오 정보 데이터베이스에 저장하기
		User user = new User();
		
		String[] kakaoId = new String[1];
		kakaoId = kakaoUserInfo.get("email").toString().split("@");
		
		logger.info(kakaoId[0]);
		
		user.setUser_id("K" + kakaoId[0]);
		user.setUser_pw(kakaoUserInfo.get("id").toString());
		user.setUser_age(convertAge);
		user.setUser_gender(convertGender);
		user.setUser_email(kakaoUserInfo.get("email").toString());
		user.setUser_nick(kakaoUserInfo.get("nickname").toString());
		
		try {
			user.setUser_profileorigin(kakaoUserInfo.get("image").toString());
			user.setUser_profilestored(kakaoUserInfo.get("image").toString());
		} catch (NullPointerException e) {
			user.setUser_profileorigin("기본이미지");
			user.setUser_profilestored("기본이미지");
		}
		
		
		//로그인 시키기
		
		boolean hasData = loginService.login(user);
		
		if(!hasData) {
			loginService.signUp(user);
		}
		
		user = loginService.selectUser(user);
		
		session.setAttribute("isLogin", true);
		session.setAttribute("snsLogin", true);
		session.setAttribute("kakaoLogin", true);

		session.setAttribute("user_no", user.getUser_no());
		session.setAttribute("user_grade", user.getUser_grade());
		session.setAttribute("user_id", user.getUser_id());
		session.setAttribute("user_nick", user.getUser_nick());
		session.setAttribute("user_gender", user.getUser_gender());
		session.setAttribute("user_age", user.getUser_age());
		session.setAttribute("user_email", user.getUser_email());
		session.setAttribute("user_image", user.getUser_profilestored());
		
		session.setAttribute("accessToken", accessToken);
		
		
		
		return "redirect:/login/main";
		
	}
	
	

	@RequestMapping(value = "/google")
	public String google(HttpSession session) {
		
		session.setAttribute("isLogin", true);
		session.setAttribute("snsLogin", true);
		
		return "redirect:/login/main";
	}
	

}
