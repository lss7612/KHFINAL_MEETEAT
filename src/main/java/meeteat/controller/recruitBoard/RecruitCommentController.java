package meeteat.controller.recruitBoard;


import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import meeteat.dto.commentForSSLEE.Comment;
import meeteat.service.comment.face.CommentService;

@Controller
public class RecruitCommentController {

	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(RecruitCommentController.class);
	@Autowired CommentService commentService;
	
	
	@RequestMapping(value = "/recruitboard/comment/write")
	public String write(
			Comment comment
			) {
		commentService.write(comment);
		
//		int board_no = comment.getBoard_no();
//		int article_no = comment.getArticle_no();
		
		String returnURI = "redirect:/recruitboard/view?board_no="+comment.getBoard_no()+"&article_no="+comment.getArticle_no();

		return returnURI;
		
	}
	
	@RequestMapping(value = "/comment/list")
	public String getCommentList(
			int article_no
			,int board_no
			,Model model
			) {
		
		logger.info("param: "+article_no );
		logger.info("param: "+board_no );
		
		List<Map<String,Object>> list = commentService.getCommentlist(article_no, board_no);
		logger.info("param:"+list);
		model.addAttribute("list",list);
		
		return "/comment/comment_ajax_view";
	}
	
}
