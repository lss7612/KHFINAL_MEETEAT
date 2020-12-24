package meeteat.controller.boardAdmin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import meeteat.dto.boardAdmin.BoardAdmin;
import meeteat.dto.boardAdmin.BoardAdminParam;
import meeteat.service.boardAdmin.face.BoardAdminService;
import meeteat.service.eventBoard.face.EventBoardService;
import meeteat.service.inquiryBoard.face.InquiryBoardService;
import meeteat.service.noticeBoard.face.NoticeBoardService;
import meeteat.service.recruitBoard.face.RecruitBoardService;
import meeteat.util.Paging;

@Controller
@RequestMapping(value = "/admin/board")
public class BoardAdminController {

	@Autowired BoardAdminService boardAdminService;
	@Autowired NoticeBoardService noticeBoardService;
	@Autowired InquiryBoardService inquiryBoardService;
	@Autowired EventBoardService eventBoardService;
	@Autowired RecruitBoardService recruitBoardService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(BoardAdminController.class);
	
	@RequestMapping(value = "/list")
	public void boardManageList(
				Model model
				, Paging curPage
				, HttpSession session
				, HttpServletRequest request
				, BoardAdminParam boardAdminParam
				, BoardAdmin boardAdmin
				) {
	
		
	
	logger.info("controller getSearchCategory : "+ boardAdminParam.getManageCategory());
	logger.info("getSearchKeyword : "+ boardAdminParam.getManageKeyword());
	logger.info("getManageSearch : "+ boardAdminParam.getManageSearch());	
		
	//페이징 처리
	Paging paging = boardAdminService.getBoardManagePaging(curPage, boardAdminParam);
	model.addAttribute("paging", paging);
	
	//검색 목록 페이지
	paging.setSearch(curPage.getSearch());
	paging.setKeyword(curPage.getKeyword());
	
	//전체 게시물
	List<HashMap<String, String>> list = boardAdminService.BoardManageList(paging, boardAdminParam, boardAdmin);
	model.addAttribute("list", list);
	
	model.addAttribute("boardAdminParam", boardAdminParam);
	
	//검색 기능
	String keyword = request.getParameter("keyword");
	String search = request.getParameter("search");
	String board_no = request.getParameter("board_no");
	
	BoardAdmin boardAdminSearch = new BoardAdmin();
	
	if(keyword != null ) {
		if(search.equals("article_title")) { //제목
			boardAdminSearch.setArticle_title(keyword);
		} else if (search.equals("article_content")) { //내용
			boardAdminSearch.setArticle_content(keyword);
		} else if (search.equals("user_no")) { //작성자
			boardAdminSearch.setUser_no(Integer.parseInt(keyword));
		} else if (board_no.equals("1")) {
			boardAdminSearch.setBoard_no('1');
		} else if (board_no.equals("5")) {
			boardAdminSearch.setBoard_no('5');
		}
	}
	}
	
	@RequestMapping(value = "/delete")
	   public String boardManageDelete(
	            Model model   
	            , HttpSession session
	            , @RequestParam(value="articleNoArr[]") List<String> articleNoList
	            , @RequestParam(value="boardNoArr[]") List<String> boardNoList
	            , BoardAdmin boardAdmin
	            ) {
	      
	      int size = articleNoList.size();
	      logger.info(""+size);
	      for(int i=0; i<size; i++) {
	    	  
	    	  logger.info(articleNoList.get(i));
	    	  logger.info(boardNoList.get(i));
	    	  
	         boardAdminService.deleteBoard(articleNoList, boardNoList);
	      }
	      
	      logger.info("articleNoList : " + articleNoList);
	      logger.info("boardNoList : " + boardNoList);      
	      
	      return "redirect:/admin/board/list";
	   }
	
} //method end

