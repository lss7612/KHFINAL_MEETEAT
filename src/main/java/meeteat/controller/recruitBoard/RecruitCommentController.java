package meeteat.controller.recruitBoard;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import meeteat.dto.commentForSSLEE.Comment;
import meeteat.service.commentForSSLEE.face.CommentService;

@Controller
public class RecruitCommentController {

	private static final Logger logger = org.slf4j.LoggerFactory.getLogger(RecruitCommentController.class);
	@Autowired CommentService commentService;
	
	
	@RequestMapping(value = "/recruitboard/comment/write")
	public String write(
			Comment comment
			) {
		commentService.write(comment);
		
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
		if(board_no == 3) return "/comment/comment_ajax_view";
		if(board_no == 6) return "/comment/comment_ajax_view_event";
		
		return "/comment/comment_ajax_view";
	}
	
	@RequestMapping(value = "/comment/delete")
	public @ResponseBody Boolean deleteComment(
			int comment_no
			) {
		
		commentService.delete(comment_no);
		
		return true;
	}
	
	@RequestMapping(value = "/comment/openupdateform")
	public String openUpdateForm(
			int comment_no
			,Model model
			) {
		
		model.addAttribute("comment_no",comment_no);
	
		String comment_content = commentService.getCommentContent(comment_no);
		model.addAttribute("comment_content",comment_content);
		
		return "/comment/commentUpdateForm";
	}
	
	@RequestMapping(value = "/comment/commentupdate")
	public @ResponseBody Boolean commentUpdate(
			int comment_no
			,String comment_content
			) {
		
		commentService.update(comment_no, comment_content);
		
		return true;
		
	}
	@RequestMapping(value = "/comment/openReplyForm")
	public String openReplyForm(
			int comment_no
			,int article_no
			,int board_no
			,Model model) {
		
		
		model.addAttribute("comment_no",comment_no);
		model.addAttribute("article_no",article_no);
		model.addAttribute("board_no",board_no);
		return "/comment/commentReplyForm";
		
	}
	
	@RequestMapping(value = "/comment/commentreply")
	public @ResponseBody Boolean commentReply(
			int comment_no
			,int article_no
			,int board_no
			,String comment_content
			,HttpSession session
			) {
		
		commentService.replyComment(comment_no, article_no, comment_content, board_no, session);
		
		return true;
	}
	
	@RequestMapping(value = "/comment/openReplyList")
	public String commentReplyList(
			int comment_originno
			,Model model
			) {
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		list = commentService.replyCommentList(comment_originno);
		
		model.addAttribute("list",list);
		
		return "/comment/commentReplyList";
	}
	
}
