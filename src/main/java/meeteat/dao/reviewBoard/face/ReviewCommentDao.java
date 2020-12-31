package meeteat.dao.reviewBoard.face;

import java.util.List;

import meeteat.dto.reviewBoard.ReviewComment;
import meeteat.dto.reviewBoard.ReviewBoard;

public interface ReviewCommentDao {
	
	public List selectComment(ReviewBoard reviewBoard);

	void insertComment(ReviewComment comment);

	void deleteComment(ReviewComment comment);

	int countComment(ReviewComment comment);

}
