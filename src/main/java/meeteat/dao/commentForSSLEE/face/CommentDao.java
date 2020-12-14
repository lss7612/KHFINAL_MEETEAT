package meeteat.dao.commentForSSLEE.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import meeteat.dto.commentForSSLEE.Comment;

public interface CommentDao {

	public void insertComment(Comment comment);

	public List<Map<String, Object>> getCommentList(Map<String, Object> param);

	public void deleteComment(int comment_no);

	public void updateComment(HashMap<String, Object> param);

	public List<Map<String, Object>> getReplyList(int comment_originno);

	public String getCommentContetnt(int comment_no);

}
