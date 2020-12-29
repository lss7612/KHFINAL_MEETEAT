package meeteat.controller.inquiryBoard;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import meeteat.dto.inquiryBoard.InquiryBoard;
import meeteat.service.inquiryBoard.face.InquiryBoardService;
import meeteat.util.Paging;

@Controller
@RequestMapping(value = "/inquiry")
public class InquiryBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(InquiryBoardController.class);

	@Autowired InquiryBoardService inquiryBoardService;
	
	@RequestMapping(value = "/list")
	public void InquiryList(Model model
				, Paging curPage
				, HttpSession session
				, HttpServletRequest request
				, InquiryBoard inquiryBoard
				) {
		
		//페이징 처리
		Paging paging = inquiryBoardService.getInquiryPaging(curPage);
		model.addAttribute("paging", paging);
		
		//검색 목록 페이지
		paging.setSearch(curPage.getSearch());
		paging.setKeyword(curPage.getKeyword());
		
		///게시물 목록
		int board_no = 5;
		int article_secret = inquiryBoard.getArticle_secret();; // 컬럼 타입 변경 ok <<<<<<<<<<<< 여기 부터 작업하기
		
		logger.info("********************" + article_secret);
		
		
		List<HashMap<String, String>> list = inquiryBoardService.InquiryList(paging, board_no, article_secret);
		model.addAttribute("list", list);
		
		//검색 기능
		String keyword = request.getParameter("keyword");
		String search = request.getParameter("search");
		
		InquiryBoard inquiryBoard2 = new InquiryBoard();
		
		if(keyword != null) {
			if(search.equals("article_title")) {
				inquiryBoard2.setArticle_title(keyword);
			} else if(search.equals("article_content")) {
				inquiryBoard2.setArticle_content(keyword);
			}
			
			request.setAttribute("keyword", keyword);
			request.setAttribute("search", search);
			
		}
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void inquiryWrite() { }
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String inquiryWriteProc(
			InquiryBoard inquiryBoard
			, HttpSession session
			, String user_nick
			, Model model
			, int article_secret
			) {
	
		logger.info(">>>>>>>>>>>>>>>>Write" + article_secret); // 1 값이 넘어옴 (비밀글)
		
		inquiryBoard.setUser_no((int) session.getAttribute("user_no"));
		inquiryBoardService.inquiryWrite(inquiryBoard);
		
		return "redirect:/inquiry/list";
	}
	
	@RequestMapping(value = "/view")
	public void inquiryView(
			InquiryBoard inquiryBoard
			, Model model
			, HttpSession session
			, int article_no
			, HttpServletRequest request) {
		
		//상세페이지
		HashMap<String, Object> result = inquiryBoardService.inquiryView(inquiryBoard, article_no);
		model.addAttribute("result", result);
		
		//답글
		int board_no = Integer.parseInt(request.getParameter("board_no").trim());
		article_no = Integer.parseInt(request.getParameter("article_no").trim());
		
		System.out.println(article_no);
		System.out.println(board_no);
		
	}
		
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String inquiryModify(
				int board_no
				, int article_no
				, String user_nick
				, HttpSession session
				, Model model) {
		
		if(board_no != 5) {
			Boolean isWriter = inquiryBoardService.isWriter(user_nick, session);
			if( !isWriter) {
				model.addAttribute("error", "작성자가 아닌 회원은 수정할 수 없습니다.");
				
				return "/inquiry/error";
			}
		}
		
		logger.info("board_no = " + board_no + ", article_no : " + article_no);
		Map<String, Object> result = inquiryBoardService.getInquiryModify(board_no, article_no, session);
		
		result.put("article_no", article_no);
		
		model.addAttribute("result", result);
		
		return "/inquiry/modify";
		
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String inquiryModifyProc(InquiryBoard inquiryBoard) {
	
		inquiryBoardService.inquiryModify(inquiryBoard);
		
		String board_no = "5";
		String article_no =""+inquiryBoard.getArticle_no();
		
		System.out.println(article_no);
		
		
		return "redirect:/inquiry/view?board_no=" + board_no + "&article_no=" + article_no;
	}
	
	@RequestMapping(value = "/delete")
	public String inquiryDelete(InquiryBoard inquiryBoard) {
		
		inquiryBoardService.inquiryDelete(inquiryBoard);
		
		return "redirect:/inquiry/list";
	}
	
	@RequestMapping(value = "/error")
	public void error() {}
	
	
	//reply
	@RequestMapping(value = "/replyWrite", method = RequestMethod.GET)
	public void replyWrite(
				HttpServletRequest req
				, Model model
				, String post_step
				, String post_group
				, String post_indent
				
				, int board_no
				, int article_no
				, HttpSession session
				) {
		
		logger.info("/inquiry/replyWrite");
		
		Map<String, Object> result = inquiryBoardService.getInquiryParam(board_no, article_no, session, post_group, post_indent, post_step);
		
		board_no = Integer.parseInt((String) req.getParameter("board_no"));
		
		result.put("article_no", article_no);
		model.addAttribute("result", result);
		
		logger.info("board_no = " + article_no + "/ post_group = " + post_group + "/ post_step = " + post_group + "/ post_indent =" + post_indent );
	}
	
	
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWriteProc(
					HttpSession session
					, @ModelAttribute InquiryBoard inquiryBoard
					, HttpServletRequest request
					, Model model) {
		
		String board_no = "5";
		String article_no="" + inquiryBoard.getArticle_no();
		
		model.addAttribute("board_no", board_no);
		model.addAttribute("article_no", article_no);
		request.getParameter("post_group");
		request.getParameter("post_step");
		request.getParameter("post_indent");
		request.getParameter("article_title");
		request.getParameter("article_content");
		
		InquiryBoard inquiryBd = new InquiryBoard();
		inquiryBd.setPost_group((String)request.getParameter("post_group"));
		inquiryBd.setPost_step((String)request.getParameter("post_step"));
		inquiryBd.setPost_indent((String)request.getParameter("post_indent"));
		inquiryBd.setArticle_title((String)request.getParameter("article_title"));
		inquiryBd.setArticle_content((String)request.getParameter("article_content"));
		
		logger.info("board_no : " + board_no);
		logger.info("post_group : " + inquiryBd.getPost_group());
		logger.info("post_step : " + inquiryBd.getPost_step());
		logger.info("post_indent : " + inquiryBd.getPost_indent());
		logger.info("article_title : " + inquiryBd.getArticle_title());
		logger.info("article_content : " + inquiryBd.getArticle_content());
		
		
		inquiryBoardService.reply(inquiryBoard);
		
		
		return "redirect:/inquiry/list";

	}

	
}
