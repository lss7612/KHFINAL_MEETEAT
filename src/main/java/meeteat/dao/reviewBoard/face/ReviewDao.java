package meeteat.dao.reviewBoard.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import meeteat.dto.reviewBoard.ReviewBoard;
import meeteat.dto.reviewBoard.ReviewImg;
import meeteat.dto.reviewBoard.ReviewSearch;
import meeteat.util.Paging;

public interface ReviewDao {

	public int selectCntAll(ReviewSearch reviewSearch);

	public List<ReviewBoard> selectList(Paging paging);
	
//	public List<HashMap<String, String>> selectList(Paging paging);

	public void updateHit(ReviewBoard reviewBoard);

	public ReviewBoard selectByBoardNo(ReviewBoard reviewBoard);

	public void updateHit(Map<String, Object> param);

	public HashMap<String, Object> selectByBoardNo(Map<String, Object> param);

	public void write(ReviewBoard reviewBoard);

	public void update(ReviewBoard reviewBoard);

	public void delete(ReviewBoard reviewBoard);

	public void insertFile(ReviewImg reviewImg);

	public List<ReviewImg> selectImgAll();

	public ReviewImg selectByFileno(int file_no);

	public List<HashMap<String, String>> selectList(HashMap<String, Object> listmap);

	public void errorPage();

}
