package meeteat.service.commentForSSLEE.face;

import java.util.List;
import java.util.Map;

import meeteat.dto.commentForSSLEE.Comment;

public interface CommentService {

	public void write(Comment comment);

	public List<Map<String,Object>> getCommentlist(int article_no, int board_no);

}
