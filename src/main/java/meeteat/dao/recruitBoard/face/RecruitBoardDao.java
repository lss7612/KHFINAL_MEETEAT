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

	public HashMap<String,Object> getBoardView(Map<String, Object> param);

}
