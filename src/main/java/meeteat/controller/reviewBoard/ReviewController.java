package meeteat.controller.reviewBoard;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import meeteat.dto.reviewBoard.ReviewBoard;
import meeteat.dto.reviewBoard.ReviewComment;
import meeteat.dto.reviewBoard.ReviewImg;
import meeteat.dto.reviewBoard.ReviewSearch;
import meeteat.service.reviewBoard.face.ReviewService;
import meeteat.util.Paging;

@Controller
public class ReviewController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;

	
	@RequestMapping(value = "/review/view")
	public String reviewView(ReviewBoard reviewBoard, Model model) {
		
		if(reviewBoard.getArticle_no() < 1) {
			return "redirect:/review/list";
		}
		
		reviewBoard = reviewService.boardView(reviewBoard);
		model.addAttribute("view", reviewBoard);
		
		ReviewComment comment = new ReviewComment();
		List<ReviewComment> commentList = reviewService.getCommentList(reviewBoard);
		model.addAttribute("commentList", commentList);
		
		List<ReviewImg> list = reviewService.list(); 
		model.addAttribute("list", list);
		
		return "review/view";

	}
	
	
	@RequestMapping(value = "/review/download")
	public String download(int file_no, Model model) {
		
		ReviewImg file = reviewService.getFile(file_no);
		model.addAttribute("downFile", file);
		
		logger.info("=============================================================file_no" + file_no);
		
		return "down";
		
	}
	
	
	@RequestMapping(value = "/review/write", method = RequestMethod.GET)
	public void write() {}
	
	@RequestMapping(value = "/review/write", method = RequestMethod.POST)
	public String writeReview(ReviewBoard reviewBoard, HttpSession session
				, @RequestParam("file") MultipartFile fileupload) {
		
		reviewBoard.setUser_no((int)session.getAttribute("user_no"));
		
		reviewService.write(reviewBoard);
		int article_no = reviewBoard.getArticle_no();
		logger.info("--------------------------------------NO" + article_no);
		
//		logger.info("======================fileupload! : " +fileupload );
		if(fileupload.getOriginalFilename()!=null && fileupload.getOriginalFilename()!="") {
			reviewService.filesave(fileupload, article_no);
		}
		
		return "redirect:/review/list";
		
	}
	
	
	
	@RequestMapping(value = "/review/list")
	public void reviewList(Paging curPage, Model model, HttpServletRequest request
			, ReviewBoard reviewBoard, ReviewSearch reviewSearch) {
		
		//페이징 계산
		Paging paging = reviewService.getPaging(curPage, reviewSearch);
		model.addAttribute("paging", paging);
		
		paging.setSearch(curPage.getSearch());
		paging.setKeyword(curPage.getKeyword());
		
		//게시글 목록
		int board_no = 4;
		List<HashMap<String, String>> list = reviewService.list(paging, reviewSearch, board_no);
		model.addAttribute("list", list);
		model.addAttribute("reviewSearch", reviewSearch);
		
		String keyword = request.getParameter("keyword");
		String search = request.getParameter("search");
		
		ReviewBoard reviewBoard2 = new ReviewBoard();
		
		if(keyword != null) {
			if(search.equals("article_title")) {
				reviewBoard2.setArticle_title(keyword);
			} else if(search.equals("article_content")) {
				reviewBoard2.setArticle_content(keyword);
			} else if(search.equals("user_nick")) {
				reviewBoard2.setUser_nick(keyword);
			}
			
			request.setAttribute("keyword", keyword);
			request.setAttribute("search", search);
			
			logger.info(">>>>>>>>>>>>>>keyword" + keyword);
			logger.info(">>>>>>>>>>>>>>search" + search);
			
		}
		
	} 
	
	
	@RequestMapping(value = "/review/update", method = RequestMethod.GET)
	public void update(ReviewBoard reviewBoard, Model model) {
		
		reviewBoard = reviewService.boardView(reviewBoard);
		model.addAttribute("view", reviewBoard);
	}
	
	
	@RequestMapping(value = "/review/update", method = RequestMethod.POST)
	public String updateReview(ReviewBoard reviewBoard) {
		
		reviewService.update(reviewBoard);
		
		return "redirect:/review/view?article_no=" + reviewBoard.getArticle_no();
	}
	
	
	@RequestMapping(value = "/review/delete", method = RequestMethod.GET)
	public String delete(ReviewBoard reviewBoard, Model model) {
		
		reviewService.delete(reviewBoard);
		
		return "redirect:/review/list";
	}
	
	
	
	@RequestMapping(value = "/layout/error500")
	public void errorPage() {
		reviewService.errorPage();
	}
	

	
	
}












