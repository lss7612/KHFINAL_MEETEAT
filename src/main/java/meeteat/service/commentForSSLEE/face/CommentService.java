package meeteat.service.commentForSSLEE.face;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import meeteat.dto.commentForSSLEE.Comment;

public interface CommentService {

	public void write(Comment comment);

	public List<Map<String,Object>> getCommentlist(int article_no, int board_no);

	public void delete(int comment_no);

	public void update(int comment_no, String comment_content);

	public void replyComment(int comment_no, int article_no, String comment_content, int board_no,HttpSession session);

	public List<Map<String, Object>> replyCommentList(int comment_originno);

	public String getCommentContent(int comment_no);

}
