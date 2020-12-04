package meeteat.dao.commentForSSLEE.face;

import java.util.List;
import java.util.Map;

import meeteat.dto.commentForSSLEE.Comment;

public interface CommentDao {

	public void insertComment(Comment comment);

	public List<Map<String, Object>> getCommentList(Map<String, Object> param);

}
