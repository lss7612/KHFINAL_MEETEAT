package meeteat.controller.myPage;

import java.util.Arrays;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import meeteat.dto.myPage.MyPageParam;
import meeteat.dto.user.User;
import meeteat.service.login.face.LoginService;
import meeteat.service.myPage.face.MyPageService;
import meeteat.util.Paging;

@Controller
public class MyPageController {

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	@Autowired MyPageService myPageService;
	@Autowired private LoginService loginService;
	
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
		
		//결제 정보 
		Map<String, Object> payList = myPageService.myPayList(user_no);
		model.addAttribute("payList", payList);
	}
	
	@RequestMapping(value = "/mypage/myedit")
	public String myedit(HttpSession session, Model model, User user) {
		int user_no = Integer.parseInt(session.getAttribute("user_no").toString());

		Map<String, Object> userinfo = new HashMap<>();

		userinfo = myPageService.infoByNo(user_no);
		model.addAttribute("userinfo", userinfo);

		return "mypage/myedit";
	}

	@RequestMapping(value = "/mypage/myedit", method = RequestMethod.POST)
	public String myeditProc(User user
			, @RequestParam("file") MultipartFile fileupload
			,Model model) {
		
		if(fileupload.isEmpty() ) {
			myPageService.myEdit(user);
		}else {
			myPageService.myEdit(user, fileupload);
		}

		return "redirect:/mypage/mypage";
	}

	@RequestMapping(value = "/mypage/mydelete")
	public void mydelete(HttpSession session, Model model) {
		int user_no = Integer.parseInt(session.getAttribute("user_no").toString());

//		logger.info("유저번호 : " + user_no);
		Map<String, Object> user = myPageService.infoByNo(user_no);

//		logger.info("유저 정보 : " + user);

		model.addAttribute("u", user);
	}
	
	@RequestMapping(value = "/mypage/mydelete", method = RequestMethod.POST)
	public String mydeleteProc(HttpSession session, User user, Model model) {

		boolean pwChk = myPageService.pwChk(user);
		
//		model.addAttribute("pwChk", pwChk);

		if(pwChk) {
			
			myPageService.deleteUser(user);
			
			session.invalidate();
			return "/";
		}else {

			return "redirect:/mypage/mydelete";
		}

	}
	@RequestMapping(value="/mypage/mypost")
	public void myPost(HttpSession session
						, Model model
						, Paging curPage
						, HttpServletRequest req
						,MyPageParam myPageParam
						) {
		
		myPageParam.setUser_no(Integer.parseInt(session.getAttribute("user_no").toString()));
//		myPageParam.setBoard_no(Integer.parseInt(req.getAttribute("board_no").toString()));
	
//		logger.info("보드 넘버 " + myPageParam.getBoard_no());
		//페이징
		Paging paging = myPageService.getPostPaging(curPage, myPageParam);
		model.addAttribute("myPostPaging", paging);
		
		//검색 목록 페이지
		paging.setSearch(curPage.getSearch());
		
		//전체 게시글 조회
		List<HashMap<String, Object>> postAllList = myPageService.postAllList(paging, myPageParam); 
		model.addAttribute("postAllList", postAllList);
		model.addAttribute("myParam", myPageParam);

		
	}
	
	@RequestMapping(value="/mypage/mypost" , method=RequestMethod.POST)
	public String myPostProc(HttpServletRequest req) {
		
		String[] postArr = req.getParameterValues("checkbox");
//		System.out.println(Arrays.toString(postArr));

		HashMap<String, Object> map = new HashMap<>();
		map.put("postArr", postArr);

		myPageService.deleteMyPost(map);

		return "redirect:/mypage/mypost";	
	}
	
	@RequestMapping(value="/mypage/mycmmt")
	public void myCmmt(Model model
						, HttpSession session
						, Paging curPage
						, HttpServletRequest req
						,MyPageParam myPageParam) {
		
		myPageParam.setUser_no(Integer.parseInt(session.getAttribute("user_no").toString()));
//		myPageParam.setBoard_no(Integer.parseInt(req.getAttribute("board_no").toString()));
		
//		logger.info("" + myPageParam);
		
		//페이징
		Paging paging = myPageService.getCmmtPaging(curPage, myPageParam);
		model.addAttribute("myCmmtPaging", paging);
		
		//검색 목록 페이지
		paging.setSearch(curPage.getSearch());
		
		//전체 댓글 조회
		List<HashMap<String, Object>> cmmtAllList = myPageService.cmmtAllList(paging, myPageParam); 
		model.addAttribute("cmmtAllList", cmmtAllList);
		model.addAttribute("myParam", myPageParam);
		
		//내가 쓴 글 조회
		int user_no = Integer.parseInt(session.getAttribute("user_no").toString());
		List<Map<String, Object>> postList = myPageService.myPostList(user_no);
		model.addAttribute("pList", postList);
		
	}
	
	@RequestMapping(value="/mypage/mycmmt" , method=RequestMethod.POST)
	public String myCmmtProc(HttpServletRequest req) {
		
		String[] cmmtArr = req.getParameterValues("checkbox");
//		System.out.println(Arrays.toString(cmmtArr));

		HashMap<String, Object> map = new HashMap<>();
		map.put("cmmtArr", cmmtArr);

		myPageService.deleteMyCmmt(map);

		return "redirect:/mypage/mycmmt";	
	}
	
	@RequestMapping(value = "/mypage/nickcheck", method = RequestMethod.GET)
	@ResponseBody
	public boolean nickCheck(@RequestParam("user_nick") String user_nick) {
		
		return loginService.userNickCheck(user_nick);
		
	}
	
}
