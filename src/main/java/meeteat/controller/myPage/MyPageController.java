package meeteat.controller.myPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import meeteat.dto.user.User;
import meeteat.service.myPage.face.MyPageService;

@Controller
public class MyPageController {

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	@Autowired MyPageService myPageService;
	
	@RequestMapping(value="/mypage/mypage")
	public void myPage(HttpSession session, Model model) {
		
		int user_no = Integer.parseInt(session.getAttribute("user_no").toString());
		
		//마이페이지 기본정보 조회
		Map<String, Object> userinfo = new HashMap<>();
		userinfo = myPageService.infoByNo(user_no);
		model.addAttribute("userinfo", userinfo);
		
		//내가 쓴 글 조회
		List<Map<String, Object>> postList = myPageService.myPostList(user_no);
		model.addAttribute("pList", postList);
		
	}
	
	@RequestMapping(value = "/mypage/myedit")
	public String myedit(HttpSession session, Model model) {
		int user_no = Integer.parseInt(session.getAttribute("user_no").toString());

		Map<String, Object> userinfo = new HashMap<>();

		userinfo = myPageService.infoByNo(user_no);
		model.addAttribute("userinfo", userinfo);

		return "mypage/myedit";
	}

	@RequestMapping(value = "/mypage/myedit", method = RequestMethod.POST)
	public String myeditProc(User user
			, @RequestParam("file") MultipartFile fileupload) {

		logger.info("user_no");
		myPageService.myEdit(user, fileupload);

		return "redirect:/mypage/mypage";
	}

}
