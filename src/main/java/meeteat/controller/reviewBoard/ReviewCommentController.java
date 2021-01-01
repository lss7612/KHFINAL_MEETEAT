package meeteat.controller.reviewBoard;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import meeteat.dto.reviewBoard.ReviewComment;
import meeteat.service.reviewBoard.face.ReviewService;

@Controller
public class ReviewCommentController {
	
	private static final Logger logger
	= LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	
	@RequestMapping(value = "/review/comment/insert")
	public String insert(ReviewComment comment, Model model, HttpSession session) {
		
		comment.setUser_no(Integer.parseInt(""+session.getAttribute("user_no")));
		reviewService.insertComment(comment);
		
		return "redirect:/review/view?article_no=" + comment.getArticle_no();
		
	}
	
	@RequestMapping(value = "/review/comment/delete")
	public void delete(ReviewComment comment, Writer writer, Model Model) {
		
		boolean success = reviewService.deleteComment(comment);
		
		try {
			writer.append("{\"success\":" + success + "}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
//	@RequestMapping(value = "/review/comment/delete")
//	public String delete(ReviewComment comment, Writer writer, Model Model) {
//		
//		reviewService.deleteComment(comment);
//		
//		return "redirect:/review/view?article_no=" + comment.getArticle_no();
//	
//	}

}












