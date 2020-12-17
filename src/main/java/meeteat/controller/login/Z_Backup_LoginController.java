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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import meeteat.dto.user.User;
import meeteat.service.login.face.LoginService;

@Controller
@RequestMapping(value = "/backuplogin")
public class Z_Backup_LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired private LoginService loginService;
	
	//네이버 로그인
	private NaverLoginController naverLoginController;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginController(NaverLoginController naverLoginController) {
		this.naverLoginController = naverLoginController;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) throws UnsupportedEncodingException {
		
//		    String clientId = "9cY8lkLm6XbRnSBmNyFf";//애플리케이션 클라이언트 아이디값";
//		    String redirectURI;
//			redirectURI = URLEncoder.encode("http://localhost:8088/login/navercallback", "UTF-8");
//			SecureRandom random = new SecureRandom();
//			String state = new BigInteger(130, random).toString();
//			String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
//			apiURL += "&client_id=" + clientId;
//			apiURL += "&redirect_uri=" + redirectURI;
//			apiURL += "&state=" + state;
//			session.setAttribute("state", state);
		
		String naverUrl = naverLoginController.getAuthorizationUrl(session);
		
		model.addAttribute("naverUrl", naverUrl);
		
		return "login/login";
		
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginProcess(User user, HttpSession session, Model model) {
		
		boolean loginResult = loginService.login(user);
		
		if(loginResult) {
			
			user = loginService.selectUser(user);
			
			session.setAttribute("isLogin", true);
			
			session.setAttribute("user_id", user.getUser_id());
			session.setAttribute("user_no", user.getUser_no());
			session.setAttribute("user_nick", user.getUser_nick());
			session.setAttribute("user_grade", user.getUser_grade());
			session.setAttribute("user_image", user.getUser_profilestored());
			session.setAttribute("user_gender", user.getUser_gender());
			session.setAttribute("user_age", user.getUser_age());
			session.setAttribute("user_email", user.getUser_email());
			
//				model.addAttribute("user_id", user.getUser_id());
//				model.addAttribute("user_nick", user.getUser_nick());
//				model.addAttribute("user_gender", user.getUser_gender());
//				model.addAttribute("user_age", user.getUser_age());
//				model.addAttribute("user_email", user.getUser_email());

			
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
	
	@RequestMapping(value = "/fail")
	public void loginFail() {
		
	}
	
	
	@RequestMapping(value = "/main")
	public void main() {
		
	}
	
	
//		@RequestMapping(value = "/navercallback", produces = "application/json;charset=utf-8", method = {RequestMethod.GET, RequestMethod.POST})
//		public String naverCallback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
//		    String clientId = "9cY8lkLm6XbRnSBmNyFf";//애플리케이션 클라이언트 아이디값";
//		    String clientSecret = "9oEJC_zirR";//애플리케이션 클라이언트 시크릿값";
////		    String code = request.getParameter("code");
////		    String state = request.getParameter("state");
//		    String redirectURI = URLEncoder.encode("http://localhost:8088/login/navercallback", "UTF-8");
//		    String apiURL;
//		    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
//		    apiURL += "client_id=" + clientId;
//		    apiURL += "&client_secret=" + clientSecret;
//		    apiURL += "&redirect_uri=" + redirectURI;
//		    apiURL += "&code=" + code;
//		    apiURL += "&state=" + state;
//		    String access_token = "";
//		    String refresh_token = "";
//		    
//		    
//		    logger.info("apiURL = " + apiURL);
////		    System.out.println("apiURL="+apiURL);
//		    
//		    logger.info("code : " + code + " // state : " + state + " // session : " + session);
//		    
//		    try {
//		      URL url = new URL(apiURL);
//		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
//		      con.setRequestMethod("GET");
//		      int responseCode = con.getResponseCode();
//		      BufferedReader br;
//		      
//		      logger.info("responseCode="+responseCode);
////		      System.out.print("responseCode="+responseCode);
//		      
//		      if(responseCode==200) { // 정상 호출
//		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//		      } else {  // 에러 발생
//		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
//		      }
//		      String inputLine;
//		      StringBuffer res = new StringBuffer();
//		      while ((inputLine = br.readLine()) != null) {
//		        res.append(inputLine);
//		      }
//		      br.close();
//		      if(responseCode==200) {
//		    	logger.info(res.toString());
//		    	  
////		        out.println(res.toString());
//		      }
//		    } catch (Exception e) {
//		      System.out.println(e);
//		    }
//		    
//		    session.setAttribute("isLogin", true);
//		    return "redirect:/login/main";
//		}

//			
	@RequestMapping(value = "/navercallback", produces = "application/json;charset=utf-8", method = {RequestMethod.GET, RequestMethod.POST})
	public String naverCallback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
		
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginController.getAccessToken(session, code, state);
		
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
		
		
		return "redirect:/login/main";
	}
	
	

	
	
	@RequestMapping(value = "/google")
	public String google(HttpSession session) {
		
		session.setAttribute("isLogin", true);
		
		return "redirect:/login/main";
	}
	

}
