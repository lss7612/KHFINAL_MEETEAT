package meeteat.controller.myPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import meeteat.util.MyPaging;

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
		
		//내가 쓴 댓글 조회
		List<Map<String, Object>> commentList = myPageService.myCommentList(user_no);
		model.addAttribute("cList", commentList);		
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

	@RequestMapping(value = "/mypage/mydelete")
	public void mydelete(HttpSession session, Model model) {
		int user_no = Integer.parseInt(session.getAttribute("user_no").toString());

		logger.info("유저번호 : " + user_no);
		Map<String, Object> user = myPageService.infoByNo(user_no);

		logger.info("유저 정보 : " + user);

		model.addAttribute("u", user);
	}
	
	@RequestMapping(value = "/mypage/mydelete", method = RequestMethod.POST)
	public String mydeleteProc(HttpSession session, User user, Model model) {

		boolean pwChk = myPageService.pwChk(user);
		
		model.addAttribute("pwChk", pwChk);

		if(pwChk) {
			
			myPageService.deleteUser(user);

			session.invalidate();
			return "login/login";
		}else {

			return "redirect:/mypage/mydelete";
		}

	}
	@RequestMapping(value="/mypage/mypost")
	public void myPost(HttpSession session, Model model, MyPaging curPage) {
		
		//페이징 계산 페이징 
		System.out.println(curPage);
		curPage.setUser_no(Integer.parseInt(session.getAttribute("user_no").toString()));
		
		MyPaging paging = myPageService.getPaging(curPage);
		
//		paging.setSearch(curPage.getSearch());
//		paging.setCategory(curPage.getCategory());
//		paging.setUser_no(Integer.parseInt(session.getAttribute("user_no").toString()));

		model.addAttribute("myPostPaging", paging);
		
		// 전체 작성글 리스트
		List<Map<String, Object>> myAllPostList = myPageService.myAllPostList(paging);
		
		model.addAttribute("myAllPList", myAllPostList);
		
	}
	
	@RequestMapping(value="/mypage/mypost" , method=RequestMethod.POST)
	public String myPostProc(HttpServletRequest req) {
		
		String[] postArr = req.getParameterValues("checkbox");
		//	System.out.println(Arrays.toString(postArr));

		HashMap<String, Object> map = new HashMap<>();
		map.put("postArr", postArr);

		myPageService.deleteMyPost(map);

		return "redirect:/mypage/mypost";	
	}
	
	@RequestMapping(value="/mypage/mycmmt")
	public void myCmmt() {
		
		
	}
	

}
