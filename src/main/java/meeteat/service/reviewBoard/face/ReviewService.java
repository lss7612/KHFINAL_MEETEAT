package meeteat.service.reviewBoard.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import meeteat.dto.reviewBoard.ReviewBoard;
import meeteat.dto.reviewBoard.ReviewComment;
import meeteat.dto.reviewBoard.ReviewImg;
import meeteat.dto.reviewBoard.ReviewSearch;
import meeteat.util.Paging;

public interface ReviewService {

	public Paging getPaging(Paging curPage, ReviewSearch reviewSearch);

//	public List<ReviewBoard> list(Paging paging);

	public ReviewBoard boardView(ReviewBoard reviewBoard);

	public void write(ReviewBoard reviewBoard);

	public void update(ReviewBoard reviewBoard);

	public void delete(ReviewBoard reviewBoard);

	public void insertComment(ReviewComment comment);

//	public boolean deleteComment(ReviewComment comment);

	public List<ReviewComment> getCommentList(ReviewBoard reviewBoard);

	public void filesave(MultipartFile fileupload, int article_no);

	public List<ReviewImg> list();

	public ReviewImg getFile(int file_no);

	public List<HashMap<String, String>> list(Paging paging, ReviewSearch reviewSearch, int board_no);

//	public void deleteComment(ReviewComment comment);

	public boolean deleteComment(ReviewComment comment);

	public void errorPage();





}
