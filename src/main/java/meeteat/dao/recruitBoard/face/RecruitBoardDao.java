package meeteat.dao.recruitBoard.face;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import meeteat.dto.recruitBoard.RecruitBoard;
import meeteat.dto.recruitBoard.SearchParam;

public interface RecruitBoardDao {

	public void insertRecruitBoard(RecruitBoard param);

	public List<HashMap<String,String>> getRecruitBoardList(HashMap<String, Object> param);

	public int selectCntListAll(SearchParam searchParam);

	public void updateHit(Map<String, Object> param);

	public HashMap<String,Object> getBoardView(Map<String, Object> param);

	public void updateRecruitBoard(RecruitBoard param);

	public void deleteRecruitBoard(Map<String, Object> param);

	public int isRecommended(Map<String, Object> param);

	public void increaseRecommendCnt(Map<String, Object> param);

	public int getRecommendCnt(Map<String, Object> param);

	public void decreaseRecommendCnt(Map<String, Object> param);

	public int getNextVal();

	public List<HashMap<String,Object>> getImgList(Map<String, Object> param);

}
