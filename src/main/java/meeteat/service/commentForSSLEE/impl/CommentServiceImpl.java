package meeteat.service.commentForSSLEE.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import meeteat.dao.commentForSSLEE.face.CommentDao;
import meeteat.dto.commentForSSLEE.Comment;
import meeteat.service.commentForSSLEE.face.CommentService;
@Service
public class CommentServiceImpl implements CommentService {

	private static final Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);
	@Autowired CommentDao commentDao;
	
	@Override
	public void write(Comment comment) {

		commentDao.insertComment(comment);
		
	}

	@Override
	public List<Map<String,Object>> getCommentlist(int article_no, int board_no) {

		Map<String,Object> param = new HashMap<>();
		param.put("article_no", article_no);
		param.put("board_no", board_no);
		
		logger.info("paramparam" + param);
		
		List<Map<String,Object>> result = commentDao.getCommentList(param);
		
		return result;
		
	}

	@Override
	public void delete(int comment_no) {

		commentDao.deleteComment(comment_no);
		
	}

	@Override
	public String getCommentContent(int comment_no) {

		return commentDao.getCommentContetnt(comment_no);
				
	}
	
	@Override
	public void update(int comment_no, String comment_content) {
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("comment_no", comment_no);
		param.put("comment_content", comment_content);
		
		commentDao.updateComment(param);
		
	}

	@Override
	public void replyComment(int comment_no, int article_no, String comment_content, int board_no,HttpSession session) {

		Comment comment = new Comment();
		
		String str_user_no = ""+session.getAttribute("user_no");
		int user_no = Integer.parseInt(str_user_no);
		
		comment.setComment_originno(comment_no);
		comment.setBoard_no(board_no);
		comment.setComment_content(comment_content);
		comment.setArticle_no(article_no);
		comment.setUser_no(user_no);
		comment.setComment_order(1);
		
		logger.info("인서트할꺼!"+comment);
		commentDao.insertComment(comment);
		
	}

	@Override
	public List<Map<String, Object>> replyCommentList(int comment_originno) {

		return commentDao.getReplyList(comment_originno);
		
	}



}
