package meeteat.controller.noticeBoard;

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

import meeteat.dto.noticeBoard.NoticeBoard;
import meeteat.service.noticeBoard.face.NoticeBoardService;
import meeteat.util.Paging;

@Controller
@RequestMapping(value = "/notice")
public class NoticeBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeBoardController.class);
	
	@Autowired NoticeBoardService noticeBoardService;
	
	@RequestMapping(value = "/list")
	public void noticeList(Model model
				, Paging curPage
				, HttpSession session
				, HttpServletRequest request) {
		
		//페이징 처리
		Paging paging = noticeBoardService.getNoticePaging(curPage);
		
		//검색 목록 페이지
		paging.setSearch(curPage.getSearch());
		paging.setKeyword(curPage.getKeyword());
		model.addAttribute("paging", paging);
		
		///게시물 목록
		int board_no = 1;
		List<HashMap<String, String>> list = noticeBoardService.noticeList(paging, board_no);
		model.addAttribute("list", list);
		
		//검색 기능
		String keyword = request.getParameter("keyword");
		String search = request.getParameter("search");
		
		NoticeBoard noticeBoard = new NoticeBoard();
		
		if(keyword != null) {
			if(search.equals("article_title")) {
				noticeBoard.setArticle_title(keyword);
			} else if(search.equals("article_content")) {
				noticeBoard.setArticle_content(keyword);
			}
			
			request.setAttribute("keyword", keyword);
			request.setAttribute("search", search);
			
		}
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void noticeWrite() { }
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String noticeWriteProc(
			NoticeBoard noticeBoard
			, HttpSession session
			, String user_nick
			, Model model
			, @RequestParam("noticeFile") MultipartFile fileupload) {
		
		noticeBoard.setUser_no((int) session.getAttribute("user_no"));
		noticeBoardService.noticeWrite(noticeBoard);
		
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value = "/view")
	public void noticeView(
			NoticeBoard noticeBoard
			, Model model
			, HttpSession session
			, int article_no ) {
		
		//상세페이지
		HashMap<String, Object> result = noticeBoardService.noticeView(noticeBoard, article_no);
		model.addAttribute("result", result);
		
	}
		
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String noticeModify(
				int board_no
				, int article_no
				, String user_nick
				, HttpSession session
				, Model model) {
		
		if(board_no != 1) {
			Boolean isWriter = noticeBoardService.isWriter(user_nick, session);
			if( !isWriter) {
				model.addAttribute("error", "작성자가 아닌 회원은 수정할 수 없습니다.");
				
				return "/notice/error";
			}
		}
		
		logger.info("board_no = " + board_no + ", article_no : " + article_no);
		Map<String, Object> result = noticeBoardService.getnoticeModify(board_no, article_no, session);
		
		result.put("article_no", article_no);
		
		model.addAttribute("result", result);
		
		return "/notice/modify";
		
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String noticeModifyProc(NoticeBoard noticeBoard) {
	
		noticeBoardService.noticeModify(noticeBoard);
		
		String board_no = "1";
		String article_no =""+noticeBoard.getArticle_no();
		
		System.out.println(article_no);
		
		
		return "redirect:/notice/view?board_no=" + board_no + "&article_no=" + article_no;
	}
	
	@RequestMapping(value = "/delete")
	public String noticeDelete(NoticeBoard noticeBoard) {
		
		noticeBoardService.noticeDelete(noticeBoard);
		
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value = "/error")
	public void error() {}


}
